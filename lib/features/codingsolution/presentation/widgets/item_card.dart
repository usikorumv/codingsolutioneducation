import 'package:codingsolution/features/codingsolution/presentation/widgets/border_mouse_hover.dart';
import 'package:codingsolution/features/codingsolution/presentation/widgets/tags.dart';
import 'package:flutter/material.dart';

import 'constants/app_colors.dart';
import 'constants/app_text_theme.dart';
import 'constants/breakpoints.dart';

class ItemCardData {
  const ItemCardData({
    required this.imageProvider,
    required this.title,
    required this.description,
    required this.tags,
    required this.metadata1,
    required this.metadata2,
  });

  final ImageProvider imageProvider;
  final String title;
  final String description;
  final List<String> tags;
  final String metadata1;
  final String metadata2;
}

class ItemCard extends StatelessWidget {
  const ItemCard({Key? key, required this.data}) : super(key: key);
  final ItemCardData data;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final horizontalPadding = screenWidth >= Breakpoints.tablet ? 32.0 : 20.0;
    final verticalPadding = screenWidth >= Breakpoints.tablet ? 24.0 : 16.0;
    return BorderMouseHover(
      builder: (context, value) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16.0 / 9.0,
            child: DecoratedBox(
              // use a custom DecoratedBox to clip the image on the topLeft & topRight corners
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fitWidth,
                  image: data.imageProvider,
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding, vertical: verticalPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  style: Theme.of(context)
                      .textTheme
                      .headline5!
                      .copyWith(color: Colors.white),
                ),
                const SizedBox(height: 16),
                ItemMetadataWidget(
                    startText: data.metadata1, endText: data.metadata2),
                if (data.tags.isNotEmpty) ...[
                  const SizedBox(height: 16),
                  ItemMetadataTags(tags: data.tags),
                  const SizedBox(height: 20),
                ] else
                  const SizedBox(height: 18),
                Text(
                  data.description,
                  // TODO: Responsive?
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  style: DesktopTextTheme()
                      .paragraph18
                      .copyWith(color: AppColors.neutral2, height: 1.666),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ItemMetadataWidget extends StatelessWidget {
  const ItemMetadataWidget(
      {Key? key, required this.startText, required this.endText})
      : super(key: key);

  final String startText;
  final String endText;

  @override
  Widget build(BuildContext context) {
    // TODO: Responsive with LayoutBuilder
    return Text(
      startText,
      // '$startText | $endText',
      textAlign: TextAlign.left,
      style:
          DesktopTextTheme().subheadAllCaps.copyWith(color: AppColors.neutral2),
    );
    // TODO: Would be nice to make this work without overflow
    return Row(
      children: [
        Text(
          startText,
          style: DesktopTextTheme()
              .subheadAllCaps
              .copyWith(color: AppColors.neutral2),
        ),
        const SizedBox(width: 10),
        Container(
          height: 16,
          width: 1,
          color: AppColors.neutral2,
        ),
        const SizedBox(width: 10),
        Text(
          endText,
          overflow: TextOverflow.clip,
          style: DesktopTextTheme()
              .subheadAllCaps
              .copyWith(color: AppColors.neutral2),
        ),
      ],
    );
  }
}

class ItemMetadataTags extends StatelessWidget {
  const ItemMetadataTags({Key? key, required this.tags}) : super(key: key);
  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 0,
      children: [
        for (final tag in tags)
          Chip(
            backgroundColor: tag.color().backgroundColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
            label: Text(
              tag,
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                  fontWeight: FontWeight.normal, color: tag.color().color),
            ),
          ),
      ],
    );
  }
}
