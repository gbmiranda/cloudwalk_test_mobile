import 'package:flutter/material.dart';

import '../generated/assets.gen.dart';

enum AppTextStyle {
  titleExtraLarge,
  titleLarge,
  titleMedium,
  titleSmall,
  bodyLarge,
  bodyMedium,
  bodySmall;

  double get fontSize {
    switch (this) {
      case AppTextStyle.titleExtraLarge:
        return 40.0;
      case AppTextStyle.titleLarge:
        return 32.0;
      case AppTextStyle.titleMedium:
        return 24.0;
      case AppTextStyle.titleSmall:
        return 18.0;
      case AppTextStyle.bodyLarge:
        return 16.0;
      case AppTextStyle.bodyMedium:
        return 14.0;
      case AppTextStyle.bodySmall:
        return 12.0;
    }
  }

  FontWeight get fontWeight {
    switch (this) {
      case AppTextStyle.titleExtraLarge:
        return FontWeight.w700;
      case AppTextStyle.titleLarge:
        return FontWeight.w600;
      case AppTextStyle.bodyLarge:
      case AppTextStyle.titleMedium:
        return FontWeight.w500;
      case AppTextStyle.titleSmall:
      case AppTextStyle.bodyMedium:
      case AppTextStyle.bodySmall:
        return FontWeight.w400;
    }
  }

  String get fontFamily {
    switch (this) {
      case AppTextStyle.titleExtraLarge:
      case AppTextStyle.titleLarge:
        return Assets.fonts.lexendBold;
      case AppTextStyle.titleMedium:
        return Assets.fonts.lexendSemiBold;
      case AppTextStyle.titleSmall:
        return Assets.fonts.lexendRegular;
      case AppTextStyle.bodyLarge:
        return Assets.fonts.interBold;
      case AppTextStyle.bodyMedium:
        return Assets.fonts.interSemiBold;
      case AppTextStyle.bodySmall:
        return Assets.fonts.interRegular;
    }
  }
}

class AppText extends StatelessWidget {
  final String text;
  final int maxLines;
  final Color color;
  final AppTextStyle style;
  final EdgeInsets? margin;
  final bool expanded;

  const AppText({
    super.key,
    required this.text,
    required this.style,
    this.color = Colors.white,
    this.maxLines = 1,
    this.margin,
    this.expanded = false,
  });

  @override
  Widget build(BuildContext context) {
    final widget = Container(
      margin: margin,
      child: Text(
        text,
        maxLines: maxLines,
        overflow: TextOverflow.ellipsis,
        textWidthBasis: TextWidthBasis.parent,
        style: TextStyle(
          color: color,
          fontFamily: style.fontFamily,
          fontSize: style.fontSize,
          fontWeight: style.fontWeight,
        ),
        strutStyle: StrutStyle(
          fontFamily: style.fontFamily,
          fontSize: style.fontSize,
          fontWeight: style.fontWeight,
        ),
      ),
    );
    if (expanded) {
      return Flexible(child: widget);
    }
    return widget;
  }
}
