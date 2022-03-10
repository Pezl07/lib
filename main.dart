import 'package:cdms_flutter/pages/Service_show.dart';
import 'package:cdms_flutter/pages/add.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ServiceShowPage(),
      title: "add",
      debugShowCheckedModeBanner: false,
    );
  }
}
