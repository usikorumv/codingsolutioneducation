import 'package:flutter/material.dart';
import 'package:codingsolutioneducation/common/constants.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../../../../common/screen_helper.dart';

class BannerApp extends StatelessWidget {
  const BannerApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenHelper(
      desktop: _buildUi(kDesktopMaxWidth, context),
      tablet: _buildUi(kTabletMaxWidth, context),
      mobile: _buildUi(getMobileMaxWidth(context), context),
    );
  }
}

Widget _buildUi(double width, BuildContext context) {
  return ResponsiveWrapper(
    defaultScale: true,
    child: Image.asset(AppConstants.banner),
  );
}
