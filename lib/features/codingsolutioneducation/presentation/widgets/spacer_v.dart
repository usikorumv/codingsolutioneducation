import 'package:flutter/material.dart';

import 'package:codingsolutioneducation/features/codingsolutioneducation/presentation/presentation.dart';

class SpacerV extends StatelessWidget {
  const SpacerV({super.key, this.value});
  final double? value;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: value ?? Dimens.space8,
    );
  }
}
