import 'package:flutter/material.dart';
import 'screens/HomeScreen.dart';
import 'package:due_t_demo_proj/constants.dart';



void main() =>runApp(MyApp());


class MyApp extends StatelessWidget
{
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home : HomeScreen(),
      title: 'DemoApp',
      theme: ThemeData(
        primaryColor: tcolor,
        // primarySwatch: Colors.indigo,
      ),
      // home: MyHomePage(title: ''),
    );
  }
}
