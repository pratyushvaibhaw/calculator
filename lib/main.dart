
import 'package:calcsi/utils/routes.dart';
import 'package:calcsi/utils/routes_name.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() => runApp(DevicePreview(builder: (context)=>MyApp(),enabled:! kReleaseMode,));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      onGenerateRoute: Routes.generateRoute,
      initialRoute: RoutesName.splashscreen,
    );
  }
}
