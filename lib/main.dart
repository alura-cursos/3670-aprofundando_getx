import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vidflow/screens/login.dart';

void main() {
  runApp(const VidFlow());
}

class VidFlow extends StatelessWidget {
  const VidFlow({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "VidFlow",
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        colorSchemeSeed: Colors.blueAccent,
      ),
      home: Login(),
    );
  }
}
