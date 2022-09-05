import 'package:flutter/material.dart';

import 'package:codingsolution/features/codingsolution/presentation/widgets/footer/footer.dart';
import 'package:codingsolution/features/codingsolution/presentation/pages/about_page.dart';
import 'package:codingsolution/features/codingsolution/presentation/pages/home/home_page.dart';
import 'package:codingsolution/features/codingsolution/presentation/widgets/drawer_widget.dart';

import '../../../../../common/globals.dart';
import '../../../../../common/screen_helper.dart';
import '../../widgets/header/header.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _HomePageState();
}

class _HomePageState extends State<MainPage> {
  List<Widget> pageIndex = [const HomePage(), const AboutPage()];
  int index = 0;
  void setIndex(int i) {
    setState(() {
      index = i;
    });
  }

  Widget _buildPage() {
    return Stack(
      children: [
        ScrollConfiguration(
          behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: ScreenHelper.isDesktop(context)
                      ? MediaQuery.of(context).size.height * .03
                      : MediaQuery.of(context).size.height * .02,
                ),
                Header(setIndex),
                pageIndex[index],
                const Footer()
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: Globals.scaffoldKey,
      endDrawer: const DrawerWidget(),
      body: _buildPage(),
    );
  }
}
