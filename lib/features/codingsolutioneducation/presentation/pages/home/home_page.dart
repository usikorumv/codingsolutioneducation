import 'package:codingsolutioneducation/features/codingsolutioneducation/presentation/pages/home/banner.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/presentation/widgets/footer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[BannerApp(), Footer()],
    );
  }
}
