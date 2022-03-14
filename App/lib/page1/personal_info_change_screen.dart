
import '../constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';



class InfochangeScreen extends StatefulWidget
{
  static const String id = "personal_info_change_screen";
  @override
  _InfochangeScreenState createState() => _InfochangeScreenState();
}



class _InfochangeScreenState extends State<InfochangeScreen> {


  @override
  Widget build(BuildContext context) {
    return
        Scaffold(
        appBar: AppBar(
              automaticallyImplyLeading: false, // for custom icon option setting down below
              title:ListTile(
              title :Text("This is personal Info page"),
              trailing: Image.asset("assets/Logo.png", width: 100, height: 50)),
              backgroundColor: TeamColor,
        ),






    );
  }
}