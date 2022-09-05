import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

import 'intro_header.dart';
import 'item_card.dart';

class Courses extends StatelessWidget {
  const Courses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveGridRow(children: [
      ResponsiveGridCol(
        lg: 12,
        child: Container(
          //height: 400,
          alignment: const Alignment(0, 0),
          //color: Colors.purple,
          child: const IntroHeader(),
        ),
      ),

      ResponsiveGridCol(
        xs: 6,
        md: 3,
        child: Container(

          alignment: const Alignment(0, 0),
          color: Colors.green,
          child: const ItemCard(),
        ),
      ),
      ResponsiveGridCol(
        xs: 6,
        md: 3,
        child: Container(

          alignment: const Alignment(0, 0),
          color: Colors.green,
          child: const ItemCard(),
        ),
      ),
      ResponsiveGridCol(
        xs: 6,
        md: 3,
        child: Container(

          alignment: const Alignment(0, 0),
          color: Colors.green,
          child: const ItemCard(),
        ),
      ),
    ]);
  }
}
