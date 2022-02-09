
import 'package:flutter/material.dart';
import 'package:flutter_try/color.dart';
import 'package:flutter_try/page1/HomePage.dart';


void main() => runApp(
    MyApp()
);//앱 구동시켜주세요~

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'Chari-o',
      theme: ThemeData(primarySwatch: Colors.red),
      home: HomePage(),
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



