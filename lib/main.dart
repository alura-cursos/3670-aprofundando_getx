import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vidflow/screens/login.dart';

void main() async {
  GetStorage.init();
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
      defaultTransition: Transition.fadeIn,
      home: Login(),
    );
  }
}
