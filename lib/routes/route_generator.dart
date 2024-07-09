import 'package:flutter/material.dart';
import 'package:testproject/screen/auth/login/loginScreen.dart';
import 'package:testproject/screen/auth/register/sign_up_scree.dart';
import 'package:testproject/screen/detail_view_screen.dart';
import 'package:testproject/screen/home_screen.dart';
import 'package:testproject/screen/initial/splash_screen.dart';
import 'package:testproject/screen/map_view_screen.dart';
import 'package:testproject/utils/constants/routes.dart';

import '../screen/error/error_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (_) => const SpalshScreen(),
        );

        case Routes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => const LoginScreen(),
        );

        case Routes.signUpScreen:
        return MaterialPageRoute(
          builder: (_) => const SignUpScreen(),
        );

        case Routes.homeScreen:
        return MaterialPageRoute(
          builder: (_) => const HomeScreen(),
        );

        case Routes.detailViewScreen:
        return MaterialPageRoute(
          builder: (_) => const DetailViewScreen(data: {},),
        );

        case Routes.mapViewScreen:
        return MaterialPageRoute(
          builder: (_) => const MapViewScreen(data: {},),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const ErrorScreen(),
        );
    }
  }
}
