import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:testproject/utils/constants/api_service.dart';
import 'package:testproject/utils/constants/app_color.dart';
import 'package:testproject/widgets/common/common_layout.dart';
import 'package:testproject/widgets/common/custom_button.dart';

import '../utils/constants/routes.dart';
import 'detail_view_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _listViewController = ScrollController();

//call the API services with base url
  final ApiService apiService = ApiService(
      baseUrl: 'https://dl.dropboxusercontent.com/s/6nt7fkdt7ck0lue');

  late Future<List<dynamic>> _futureData;

  @override
  void initState() {
    super.initState();
    setState(() {
      _futureData = fetchData();
    });
  }

  Future<List<dynamic>> fetchData() async {
    final response = await apiService.get('hotels.json');
    // print('API: ${response['data'][0]['title']}');
    if (response is Map<String, dynamic> && response.containsKey('data')) {
      return response['data'] as List<dynamic>;
    } else {
      throw Exception('Failed to extract data list');
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return CommonLayout(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.primary,
        title: Center(
          child: Text(
            'List View',
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 15.r,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const Text('name'),
          const Text('email'),
          CustomButton(
            bordercolor: AppColors.secondary,
            borderWidth: 1.0,
            color: AppColors.secondary,
            boxShape: BoxShape.rectangle,
            buttonText: 'Log Out',
            btnTextColor: AppColors.whiteColor,
            btnFontSize: 14.r,
            btnFontWeight: FontWeight.w500,
            onTap: () {
              Navigator.of(context).pushNamed(Routes.loginScreen);
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          //List view
          FutureBuilder<List<dynamic>>(
            future: _futureData,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                print(snapshot.error);
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return const Center(child: Text('No Data Available'));
              } else {
                final data = snapshot.data!;
                print(data);
                return SizedBox(
                  // width: 300,
                  height: screenHeight * 0.655,
                  child: ListView.builder(
                    // itemCount: data.length,
                    itemCount: 15,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          child: Container(
                            // height: 20,
                            decoration: BoxDecoration(
                              color: AppColors.listViewCardColor,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  height: 40.h,
                                  width: 40.w,
                                  child: Image.network(
                                    // 'assets/images/avatar.png',
                                    data[index]['image']['small'],
                                    fit: BoxFit.cover,
                                    errorBuilder: (BuildContext context,
                                        Object exception,
                                        StackTrace? stackTrace) {
                                      return Image.asset(
                                          'assets/images/avatar.png');
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 10.h, vertical: 2.h),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        data[index]['title'],
                                        style: const TextStyle(
                                          color: AppColors.whiteColor,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                      ),
                                      Text(
                                        data[index]['address'],
                                        style: const TextStyle(
                                          color: AppColors.whiteColor,
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          onTap: () {
                            // Navigator.of(context)
                            //     .pushNamed(Routes.detailViewScreen);
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => DetailViewScreen(
                                  data: data[index],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    },
                    scrollDirection: Axis.vertical,
                    reverse: true,
                    controller: _listViewController,
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
