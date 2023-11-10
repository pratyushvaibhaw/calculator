import 'package:calcsi/res/colors.dart';
import 'package:calcsi/view_model/services/splash_services.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashService _splash = SplashService();
  @override
  void initState() {
    super.initState();
    _splash.homeNav(context);
  }

  @override
  Widget build(BuildContext context) {
    TextStyle _style = TextStyle(
        fontFamily: 'font_one',
        color: AppColor.btnbgcolor,
        fontWeight: FontWeight.w300);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 230, 230),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'X',
              style: _style.copyWith(fontSize: 60),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '%',
              style: _style.copyWith(fontSize: 60),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '+',
              style: _style.copyWith(fontSize: 80),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '/',
              style: _style.copyWith(fontSize: 60),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '-',
              style: _style.copyWith(fontSize: 80),
            ),
          ],
        ),
      ),
    );
  }
}
