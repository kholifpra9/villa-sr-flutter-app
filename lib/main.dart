import 'package:villa_sr_app/core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SR Villa',
      navigatorKey: Get.navigatorKey,
      theme: ThemeData(),
      home: const LoginView(),
    );
  }
}
