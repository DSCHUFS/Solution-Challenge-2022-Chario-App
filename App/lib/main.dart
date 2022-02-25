import 'package:flutter/material.dart';
import 'package:flutter_try/page1/dmoneyinput_screen.dart';
import 'package:flutter_try/page1/donationask_screen.dart';
import 'package:flutter_try/page1/donationfcdetail.dart';
import 'package:flutter_try/page1/donpersonal_screen.dart';
import 'package:flutter_try/page1/personal_screen.dart';
import 'package:flutter_try/page1/search_screen.dart';
import 'package:flutter_try/page1/subscribe_screen.dart';
import 'page1/HomePage.dart';
import 'page1/welcome_screen.dart';
import 'page1/registration_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Chari-o',
      //theme: ThemeData(primarySwatch:),
      //home: HomePage(),

      initialRoute:DonpersonalScreen.id,

      //initialRoute: WelcomeScreen.id,
      // routes to run an app
      routes: {

        WelcomeScreen.id: (context) => WelcomeScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        HomePage.id: (context) => HomePage(),
        PersonalScreen.id: (context) => PersonalScreen(),
        SubscribeScreen.id: (context) => SubscribeScreen(),
        SearchScreen.id: (context) =>  SearchScreen(),
        Donationask.id:(context) => Donationask(),
        Donationmoneyinput.id:(context) =>  Donationmoneyinput(),
        DonpersonalScreen.id:(context) =>  DonpersonalScreen(),
        DonfcdetailScreen.id: (context) => DonfcdetailScreen(),

        },

    );

  }
}
class MyClipper extends CustomClipper<Rect>{
  @override
  Rect getClip(Size size) {    // 하위 요소의 사이즈를 가져오는 메소드
    return Rect.fromCircle(center: new Offset(size.width / 2, size.width / 2),
        radius: size.width / 2 + 3);    // 하위 요소의 사이즈에 상관없이 넓이와 높이 사이즈를 200px, 100px로 놓았다.
  }
  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
  return false;
  }


}



