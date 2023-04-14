import 'package:flutter/material.dart';
import 'package:fridger_app/ui/screens/login_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Fridger';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
