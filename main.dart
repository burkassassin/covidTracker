import 'package:covid19tracker_thirdapp/datasource.dart';
import 'package:covid19tracker_thirdapp/homepage.dart';

import 'package:flutter/material.dart';

void main(List<String> args) => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryBlack,
        brightness: Brightness.light,
      ),
      home: HomePage(),
    );
  }
}
