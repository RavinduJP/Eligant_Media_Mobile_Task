import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testproject/utils/constants/dimentions.dart';

import '../../utils/constants/app_color.dart';

class CommonLayout extends StatelessWidget {
  const CommonLayout({
    super.key,
    this.appBar,
    this.backgroundImage = false,
    this.image = '',
    this.hedingTitle = '',
    this.fontFamily,
    required this.body,
    this.appBarTitle,
  });

  final PreferredSizeWidget? appBar;
  final bool backgroundImage;
  final String? image;
  final String? hedingTitle;
  final String? fontFamily;
  final Widget body;
  final String? appBarTitle;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: appBar,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Dimension.screenWidthFactor,
            ),
            child: Stack(
              children: [
                Positioned(
                  child:  SizedBox(
                    height: screenHeight * 0.8,
                    width: MediaQuery.of(context).size.width,
                    // width: 300,
                    child: backgroundImage
                        ? 
                        Opacity(
                            opacity: 0.25,
                            child: Image.asset(
                              image!,
                              fit: BoxFit.cover,
                            ),
                          )
                        : null,
                  ),
                ),
                Positioned(
                  right: 0,
                  left: 0,
                  child: Padding(
                    padding: const EdgeInsets.only(top: Dimension.heddingMargin),
                    child: Text(
                      hedingTitle!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: fontFamily ?? '',
                        fontWeight: FontWeight.bold,
                        fontSize: 25.r,
                        color: AppColors.heddingColor,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 0,
                  left: 0,
                  top: 10.r,
                  child: SizedBox(
                    height: screenHeight * 0.8,
                    child: body,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
