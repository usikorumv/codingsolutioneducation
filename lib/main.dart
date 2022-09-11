import 'dart:async';

import 'package:codingsolution/common/styles.dart';
import 'package:codingsolution/features/codingsolution/presentation/pages/courses/cubit/courses_cubit.dart';
import 'package:codingsolution/features/codingsolution/presentation/pages/main_pages/main_page.dart';
import 'package:codingsolution/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/route_manager.dart';
import 'package:go_router/go_router.dart';
import 'package:oktoast/oktoast.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/codingsolution/data/data_sources/local/auth_local_data_source.dart';
import 'features/codingsolution/presentation/pages/auth/cubit/cubit.dart';
import 'features/codingsolution/presentation/pages/auth/login_page.dart';
import 'features/codingsolution/presentation/pages/auth/register_page.dart';
// import 'dart:io' show Platform;
// import 'package:flutter/foundation.dart' show kIsWeb;

void main() async {
  init();

  WidgetsFlutterBinding.ensureInitialized();

  runZonedGuarded(
    () => SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    ).then((_) async {
      SharedPreferences.getInstance().then((value) {
        initPreferencesManager(value);
        runApp(const Application());
      });
    }),
    (error, stackTrace) async {},
  );
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<LoginCubit>()),
        BlocProvider(create: (_) => sl<RegisterCubit>()),
        BlocProvider(create: (_) => sl<CoursesCubit>()),
      ],
      child: OKToast(
        child: ScreenUtilInit(
          designSize: const Size(375, 667),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) => Builder(builder: (context) {
            AppRoute.setStream(context);

            return MaterialApp.router(
              title: "Coding Solution",
              debugShowCheckedModeBanner: false,
              routeInformationProvider:
                  AppRoute.router.routeInformationProvider,
              routeInformationParser: AppRoute.router.routeInformationParser,
              routerDelegate: AppRoute.router.routerDelegate,
              builder: (context, child) => ResponsiveWrapper.builder(
                  BouncingScrollWrapper.builder(context, child!),
                  minWidth: 450,
                  defaultScale: true,
                  breakpoints: [
                    const ResponsiveBreakpoint.resize(450, name: MOBILE),
                    const ResponsiveBreakpoint.autoScale(800, name: TABLET),
                    const ResponsiveBreakpoint.autoScale(1000, name: TABLET),
                    const ResponsiveBreakpoint.resize(1200, name: DESKTOP),
                    const ResponsiveBreakpoint.autoScale(2460, name: "4K"),
                  ],
                  background: Container(color: const Color(0xFFF5F5F5))),
              theme: themeData(),
            );
          }),
        ),
      ),
    );
  }
}

enum Routes {
  root("/"),

  /// Home Page
  home("/home"),
  // dashboard("/home/dashboard"),
  // settings("/home/settings"),
  // Auth Page
  login("/login"),
  register("/register"),
  ;

  const Routes(this.path);

  final String path;
}

class AppRoute {
  static late BuildContext context;

  AppRoute.setStream(BuildContext ctx) {
    context = ctx;
  }

  static final GoRouter router = GoRouter(
    routes: [
      // GoRoute(
      //   path: Routes.splashScreen.path,
      //   name: Routes.splashScreen.name,
      //   builder: (_, __) => SplashScreenPage(),
      // ),
      GoRoute(
        path: Routes.root.path,
        name: Routes.root.name,
        redirect: (_) => Routes.home.path,
      ),
      GoRoute(
        path: Routes.home.path,
        name: Routes.home.name,
        builder: (_, __) => MainPage(),
      ),
      GoRoute(
        path: Routes.login.path,
        name: Routes.login.name,
        builder: (_, __) => const LoginPage(),
      ),
      GoRoute(
        path: Routes.register.path,
        name: Routes.register.name,
        builder: (_, __) => const RegisterPage(),
      ),
    ],
    routerNeglect: true,
    refreshListenable: GoRouterRefreshStream(context.read<LoginCubit>().stream),
    redirect: (GoRouterState state) {
      final isLoginPage = state.subloc == Routes.login.path;
      final isRegisterPage = state.subloc == Routes.register.path;

      if (!sl<AuthLocalDataSource>().isLoggedIn) {
        if (isLoginPage || isRegisterPage) {
          return null;
        } else {
          return Routes.login.path;
        }
      }

      if ((isLoginPage || isRegisterPage) &&
          sl<AuthLocalDataSource>().isLoggedIn) {
        return Routes.root.path;
      }

      return null;
    },
  );
}
