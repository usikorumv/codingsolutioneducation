import 'package:codingsolution/common/constants.dart';
import 'package:codingsolution/common/globals.dart';
import 'package:codingsolution/features/codingsolution/presentation/pages/courses/courses_page.dart';
import 'package:codingsolution/features/codingsolution/presentation/pages/home/home_page.dart';
import 'package:codingsolution/features/codingsolution/presentation/widgets/drawer/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sidebarx/sidebarx.dart';

import '../auth/cubit/login/login_cubit.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);

  final _controller = SidebarXController(selectedIndex: 0, extended: true);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final isSmallScreen = MediaQuery.of(context).size.width < 600;
        return Scaffold(
          key: Globals.scaffoldKey,
          appBar: isSmallScreen
              ? AppBar(
                  backgroundColor: canvasColor,
                  title: Text(_getTitleByIndex(_controller.selectedIndex)),
                  leading: IconButton(
                    onPressed: () {
                      // if (!Platform.isAndroid && !Platform.isIOS) {
                      //   _controller.setExtended(true);
                      // }
                      Globals.scaffoldKey.currentState?.openDrawer();
                    },
                    icon: const Icon(Icons.menu),
                  ),
                )
              : null,
          drawer: MainDrawer(controller: _controller),
          body: Row(
            children: [
              if (!isSmallScreen) MainDrawer(controller: _controller),
              Expanded(
                child: Center(
                  child: _MainScreen(
                    controller: _controller,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _MainScreen extends StatelessWidget {
  const _MainScreen({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ScrollConfiguration(
      behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
      child: SingleChildScrollView(
        child: AnimatedBuilder(
          animation: controller,
          builder: (context, child) {
            final pageTitle = _getTitleByIndex(controller.selectedIndex);

            switch (controller.selectedIndex) {
              case 0:
                return const HomePage();
              case 1:
                return const CoursesPage();
              // case 2:
              //   return const EnrolledCoursesPage();
              case 2:
                context.read<LoginCubit>().logout();

                return const SizedBox.shrink();
              default:
                return Text(
                  pageTitle,
                  style: theme.textTheme.headline5,
                );
            }
          },
        ),
      ),
    );
  }
}

String _getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Home';
    case 1:
      return 'Courses';
    // case 2:
    //   return "Enrolled Courses";
    default:
      return 'Not found page';
  }
}
