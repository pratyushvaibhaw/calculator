//class for splash service
import 'dart:async';

import 'package:calcsi/utils/routes_name.dart';
import 'package:flutter/material.dart';

class SplashService {
  void homeNav(BuildContext context) {
    Timer(Duration(seconds: 1), () {
      Navigator.pushReplacementNamed(context, RoutesName.homescreen);
    });
  }
}
