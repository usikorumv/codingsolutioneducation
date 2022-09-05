import 'dart:async';

import 'package:codingsolution/features/codingsolution/presentation/pages/routes.dart';
import 'package:codingsolution/common/styles.dart';
import 'package:codingsolution/locator_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/route_manager.dart';
import 'package:oktoast/oktoast.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/codingsolution/presentation/pages/auth/cubit/cubit.dart';
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
      ],
      child: OKToast(
        child: ScreenUtilInit(
          designSize: const Size(375, 667),
          minTextAdapt: true,
          splitScreenMode: true,
          builder: (context, child) => GetMaterialApp(
            title: "Coding Solution",
            debugShowCheckedModeBanner: false,
            getPages: routes,
            initialRoute: '/home',
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
          ),
        ),
      ),
    );
  }
}
