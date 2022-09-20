import 'package:codingsolutioneducation/features/codingsolutioneducation/presentation/widgets/header/header_menu.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 24.0,
          ),
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                onTap: () {},
                leading: Icon(
                  HeaderRow.headerItems[index].iconData,
                ),
                title: Text(
                  HeaderRow.headerItems[index].title,
                  style: const TextStyle(),
                ),
                // trailing: HeaderRow.headerItems[index].isDarkTheme != null
                //     ? HeaderRow.headerItems[index].isDarkTheme!
                //     ? SizedBox(
                //   width: 50,
                //   child: CustomSwitch(
                //     value: ref.watch(themeProvider).isDarkMode,
                //     onChanged: (val) {
                //       ref.read(themeProvider).changeTheme(val);
                //       ThemeSwitcher.of(context).changeTheme(
                //           theme: ref
                //               .read(themeProvider)
                //               .getCurrentTheme,
                //           isReversed: false // default: false
                //       );
                //     },
                //   ),
                // )
                //     : null
                //     : null,
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(
                height: 10.0,
              );
            },
            itemCount: HeaderRow.headerItems.length,
          ),
        ),
      ),
    );
  }
}
