import 'package:flutter/material.dart';

import '../../utils/constants/app_color.dart';

class CommonText extends StatelessWidget {
  const CommonText({
    super.key,
    required this.text,
    required this.whiteTextSize,
    this.alignment,
    this.textColor,
    this.underLine,
    this.underlineColor,
    this.fontWeight,
    this.onTap,
  });

  final String text;
  final double whiteTextSize;
  final Alignment? alignment;
  final Color? textColor;
  final TextDecoration? underLine;
  final Color? underlineColor;
  final FontWeight? fontWeight;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment,
      child: GestureDetector(
        onTap: onTap ?? () {},
        child: Text(
          text,
          // textAlign: TextAlign.start,
          style: TextStyle(
            color: textColor ?? AppColors.heddingColor,
            fontSize: whiteTextSize,
            fontWeight: fontWeight,
            decoration: underLine,
            decorationColor: underlineColor,
          ),
        ),
      ),
    );
  }
}
