import 'package:codingsolutioneducation/common/styles.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/data/data_sources/local/data_helpers/header_items.dart';
import 'package:codingsolutioneducation/features/codingsolutioneducation/presentation/getx/main_page_changer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getx;
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_framework/responsive_framework.dart';

class HeaderRow extends StatelessWidget {
  const HeaderRow({Key? key, required this.setIndex}) : super(key: key);
  final Function setIndex;

  static List<NameOnTap> get headerItems => [
        NameOnTap(
          title: "Home",
          iconData: Icons.home,
          onTap: () {},
        ),
        NameOnTap(
          title: "Services",
          onTap: () {},
          iconData: Icons.school,
        ),
        NameOnTap(
          title: "About",
          onTap: () {},
          iconData: Icons.info,
        ),
        NameOnTap(
          title: "Enrol",
          onTap: () {},
          iconData: Icons.work,
        ),
        NameOnTap(
          title: "Contact",
          onTap: () {},
          iconData: Icons.contact_mail,
        ),
        NameOnTap(
          title: "Course",
          onTap: () {},
          iconData: Icons.article,
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final pageIndexController = Get.put(PageIndexController());

    return ResponsiveVisibility(
      visible: false,
      visibleWhen: const [
        Condition.largerThan(name: MOBILE),
      ],
      child: Row(children: [
        ...headerItems
            .map(
              (item) => MouseRegion(
                cursor: SystemMouseCursors.click,
                child: Container(
                  margin: const EdgeInsets.only(right: 30.0),
                  child: GestureDetector(
                    onTap: () {
                      pageIndexController.setIndex(1);
                      item.onTap();
                    },
                    child: Text(
                      item.title,
                      style: menuTextStyle(MediaQuery.of(context).size.width),
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ]),
    );
  }
}
