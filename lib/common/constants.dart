import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xFFFFD800);
const Color kBackgroundColor = Color.fromRGBO(7, 17, 26, 1);
const Color kDangerColor = Color.fromARGB(255, 243, 22, 22);
const Color kCaptionColor = Color.fromRGBO(166, 177, 187, 1);

// Lets replace all static sizes
const double kDesktopMaxWidth = 1000.0;
const double kTabletMaxWidth = 760.0;
double getMobileMaxWidth(BuildContext context) =>
    MediaQuery.of(context).size.width * .8;


class AppConstants {

  static const _assets = "assets/";
  static const _images = "${_assets}images/";
  static const _svg = "${_assets}svg/";
  static const banner = "${_images}salesbanner.jpeg";
  static const guySvg = "${_svg}guy.svg";
  static const personSvg = "${_svg}person.svg";
  static const personSvg2 = "${_svg}person_girl.svg";


}


const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFF464667);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);

