import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../utils/constants/app_color.dart';

class CustomTextFromField extends StatelessWidget {
  const CustomTextFromField({
    super.key,
    this.isHighlighted = false,
    required this.controller,
    this.lableText = '',
    required this.hintText,
    this.errorText,
    this.enabled = true,
    this.onChanged,
    this.keyboardType,
    this.isEnableSuffixIcon = false,
    this.onTap,
    this.obsecureText = false,
  });

  final TextEditingController controller;
  final String? lableText;
  final String hintText;
  final String? errorText;
  final bool isHighlighted;
  final bool enabled;
  final void Function(String)? onChanged;
  final TextInputType? keyboardType;
  final bool? isEnableSuffixIcon;
  final Function()? onTap;
  final bool obsecureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          lableText!,
          style: TextStyle(
              color: AppColors.heddingColor,
              fontSize: 12.r,
              fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: 5.h,
        ),
        SizedBox(
          height: 50.h,
          child: TextFormField(
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(
                  color: AppColors.textFormFieldHintColor,
                  fontSize: 12.r,
                  fontWeight: FontWeight.w400),
              errorText: errorText,
              enabledBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppColors.textFieldBorderColor),
                borderRadius: BorderRadius.circular(10.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide:
                    const BorderSide(color: AppColors.textFieldBorderColor),
                borderRadius: BorderRadius.circular(10.0),
              ),
              suffixIcon: isEnableSuffixIcon!
                  ? GestureDetector(
                      onTap: onTap ?? () {},
                      child: Icon(
                        Icons.arrow_drop_down,
                        color: AppColors.textFieldBorderColor,
                        size: 30.h,
                      ),
                    )
                  : null,
            ),
            cursorColor: AppColors.textFieldBorderColor,
            style: const TextStyle(color: AppColors.heddingColor),
            controller: controller,
            enabled: enabled,
            onChanged: onChanged,
            keyboardType: keyboardType,
            obscureText: obsecureText,
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
      ],
    );
  }
}
