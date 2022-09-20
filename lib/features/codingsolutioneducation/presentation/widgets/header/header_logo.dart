import 'package:codingsolutioneducation/common/styles.dart';
import 'package:flutter/material.dart';

class HeaderLogo extends StatelessWidget {
  const HeaderLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: GestureDetector(
          onTap: () {},
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Coding ",
                  style: logoTextStyle(
                      MediaQuery.of(context).size.width, Colors.white),
                ),
                TextSpan(
                  text: "Solution Education",
                  style: logoTextStyle(
                      MediaQuery.of(context).size.width, Colors.yellow),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
