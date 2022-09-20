import 'package:codingsolutioneducation/common/globals.dart';
import 'package:codingsolutioneducation/common/screen_helper.dart';
import 'package:flutter/material.dart';
import 'header_logo.dart';
import 'header_menu.dart';

class Header extends StatelessWidget {
  const Header(this.setIndex, {Key? key}) : super(key: key);
  final Function setIndex;
  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: buildHeader(context, setIndex),
      mobile: buildMobileHeader(context),
      tablet: buildHeader(context, setIndex),
    );
  }

  // mobile header
  Widget buildMobileHeader(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.95),
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const HeaderLogo(),
            GestureDetector(
              onTap: () {
                Globals.scaffoldKey.currentState?.openEndDrawer();
              },
              child: const Icon(
                Icons.menu,
                size: 28.0,
              ),
            )
          ],
        ),
      ),
    );
  }

  // Lets plan for mobile and smaller width screens
  Widget buildHeader(BuildContext context, Function setIndexFunc) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor.withOpacity(0.95),
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: ScreenHelper.isDesktop(context) ? 24 : 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const HeaderLogo(),
            HeaderRow(
              setIndex: setIndexFunc,
            ),
          ],
        ),
      ),
    );
  }
}
