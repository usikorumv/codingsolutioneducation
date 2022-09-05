import 'package:codingsolution/features/codingsolution/presentation/pages/home/banner.dart';
import 'package:flutter/material.dart';

import '../../widgets/footer/footer.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget> [
        BannerApp(),
        Footer()
      ],
    );
  }
}
