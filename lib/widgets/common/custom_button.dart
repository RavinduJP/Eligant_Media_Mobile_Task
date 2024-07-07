import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.bordercolor,
    required this.borderWidth,
    required this.color,
    required this.boxShape,
    required this.buttonText,
    required this.btnTextColor,
    required this.btnFontSize,
    required this.btnFontWeight,
    required this.onTap,
  });

  final Color bordercolor;
  final double borderWidth;
  final Color color;
  final BoxShape boxShape;
  final String buttonText;
  final Color btnTextColor;
  final double btnFontSize;
  final FontWeight btnFontWeight;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        margin: const EdgeInsets.symmetric(horizontal: 70.0, vertical: 5.0),
        decoration: BoxDecoration(
            border: Border.all(
              color: bordercolor,
              width: borderWidth,
              style: BorderStyle.solid,
            ),
            borderRadius: BorderRadius.circular(9.0),
            color: color,
            shape: boxShape),
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              color: btnTextColor,
              fontSize: btnFontSize,
              fontWeight: btnFontWeight,
            ),
          ),
        ),
      ),
    );
  }
}
