import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../utils/constants/app_color.dart';
import '../widgets/common/common_layout.dart';

class MapViewScreen extends StatefulWidget {
  final Map<String, dynamic> data;

  const MapViewScreen({super.key, required this.data});

  @override
  State<MapViewScreen> createState() => _MapViewScreenState();
}

class _MapViewScreenState extends State<MapViewScreen> {
  // final locationController = Location();

  static const defaultCoordinates = LatLng(-60.964344, -12.024244);
  LatLng? currentPosition;

  // @override
  // void initState() {
  //   WidgetsBinding.instance
  //       .addPostFrameCallback((_) async => await initializeMap());
  // }

  // Future<void> initializeMap() async {
  //   await fetchLocationUpdates();
  // }

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
        title: Text(
          'Detail View',
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 15.r,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        child: GoogleMap(
            initialCameraPosition: const CameraPosition(
              target: defaultCoordinates,
              zoom: 13,
            ),
            markers: {
              const Marker(
                markerId: MarkerId('providedLocation'),
                icon: BitmapDescriptor.defaultMarker,
                position: defaultCoordinates,
              ),
            }),
      ),
    );
  }
}
