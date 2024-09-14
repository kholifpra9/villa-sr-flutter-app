import 'package:villa_sr_app/state_util.dart';
import 'package:villa_sr_app/core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final AuthService authService = AuthService();
  bool isLoggedIn = await authService.isLoggedIn();

  runApp(MyApp(isLoggedIn: isLoggedIn));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SR Villa',
navigatorKey: Get.navigatorKey,
      theme: ThemeData(),
      home: isLoggedIn ? const NavBar() : const LoginView(),
    );
  }
}
