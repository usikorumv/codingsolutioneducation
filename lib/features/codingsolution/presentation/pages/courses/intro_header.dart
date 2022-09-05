
import 'package:flutter/material.dart';

import '../../../../../common/app_colors.dart';
import '../../../../../common/app_text_theme.dart';
import '../../../../../common/breakpoints.dart';

class IntroHeader extends StatelessWidget {
  const IntroHeader({Key? key}) : super(key: key);

  double topPadding(double maxWidth) {
    if (maxWidth > Breakpoints.tablet) {
      return 150;
    } else if (maxWidth > Breakpoints.mobile) {
      return 71;
    } else {
      return 53;
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: 880,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: topPadding(screenWidth)),
            Text(
              'Sell smarter and grow your business faster from anywere ',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(color: Colors.white),
            ),
            const SizedBox(height: 32),
            RichText(
              text: TextSpan(
                text:
                'With  SALESFORCE\n'
                    '2 September  MONDAY-TUESDAY -THURSDAY-SATURDAY  8-11 pm east ',
                style: DesktopTextTheme()
                    .paragraph20
                    .copyWith(color: AppColors.neutral2),

              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
