import 'package:flutter/material.dart';
import 'package:jilly_bank/login.dart';

void main() {
  runApp(const Testing());
}

var lightColor = const Color.fromARGB(255, 122, 178, 178);

class Testing extends StatelessWidget {
  const Testing({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: lightColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const Login(),
    );
  }
}
