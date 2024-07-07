import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/constants/app_color.dart';
import '../utils/constants/routes.dart';
import '../widgets/common/common_layout.dart';

class DetailViewScreen extends StatelessWidget {
final Map<String, dynamic> data;

  const DetailViewScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return CommonLayout(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          color: AppColors.whiteColor,
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Text(
              'Detail View',
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 15.r,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            GestureDetector(
              child: const Icon(
                Icons.location_on_outlined,
                color: AppColors.whiteColor,
              ),
              onTap: () {
                Navigator.of(context).pushNamed(Routes.mapViewScreen);
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 150.h,
            width: 150.w,
            child: Image.network(
              // 'assets/images/avatar.png',
              data['image']['large'],
              fit: BoxFit.cover,
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return Image.asset('assets/images/avatar.png');
              },
            ),
          ),
          SizedBox(height: 20.h,),
          Text(
            data['title'],
            // 'Title',
            style: const TextStyle(
              color: Color(0xff707070),
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            data['description'],
            // 'Description',
            style: const TextStyle(
              color: Color(0xff707070),
              fontSize: 12.0,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
