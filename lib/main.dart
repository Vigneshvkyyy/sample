import 'package:flutter/material.dart';
import 'package:flutter_application_1/dynamic_homepage.dart';
import 'package:flutter_application_1/without_model.dart';

import 'static_home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
       
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: 
      // AssetjsonOrApijson(),
      // HomePage()
      WithoutModel()
    );
  }
}
