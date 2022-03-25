import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_try/page1/welcome_screen.dart';
import '../constants.dart';
import 'package:flutter_try/route_generator.dart';

import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    );
  runApp(MyApp());

}

class MyApp extends StatelessWidget
{
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Chari-o',
      theme: ThemeData(
        primaryColor: TeamColor,
      ),

      initialRoute: WelcomeScreen.id,
      onGenerateRoute: RouteGenerator.generateRoute,
    );

  }
}
class MyClipper extends CustomClipper<Rect>{
  @override
  Rect getClip(Size size) {    // 하위 요소의 사이즈를 가져오는 메소드
    return Rect.fromCircle(center: Offset(size.width / 2, size.width / 2),
        radius: size.width / 2 + 3);    // 하위 요소의 사이즈에 상관없이 넓이와 높이 사이즈를 200px, 100px로 놓았다.
  }
  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
  return false;
  }


}



