import '../screens/questionScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'binders/initial_binders.dart';

Future<void> main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: InitialBindings(),
      title: 'Quiz App',
      home: const QuestionScreen(),
    );
  }
}
