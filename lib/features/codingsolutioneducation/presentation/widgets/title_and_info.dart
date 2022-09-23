import 'package:flutter/material.dart';

class TitleAndInfo extends StatelessWidget {
  const TitleAndInfo({super.key, this.title, this.info});

  final String? title, info;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title ?? "Title"),
      subtitle: Text(info ?? "Info"),
    );
  }
}
