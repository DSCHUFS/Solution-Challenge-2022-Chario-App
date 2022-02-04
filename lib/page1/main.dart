
import 'package:flutter/material.dart';
import 'package:flutter_try/color.dart';
import 'package:flutter_try/page1/HomePage2.dart';

void main() => runApp(
    MyApp()
);//앱 구동시켜주세요~

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:'메뉴바를 만들어보자',
      theme: ThemeData(primarySwatch: Colors.red),
      home: HomePage1(),
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
class HomePage1 extends StatelessWidget {
  //static const color = const Color(0xffb74093);
  const HomePage1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:AppBar(
          backgroundColor: mainColor,
          title:Image.asset("assets/chario_logo.png",width:100,height:50),
          //centerTitle: true,
          actions: <Widget>[
            IconButton(onPressed: () {
                },
              icon: Icon(Icons.adb),),
            IconButton(onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>HomePage2())
              );}, icon: Icon(Icons.account_balance))
          ],
        ),
        body:ListView(
            padding: const EdgeInsets.all(100),
            children: <Widget>[
              Container(
                child:Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children:<Widget> [
                       Row(
                        children:[
                         ClipOval(
                             clipper : MyClipper()
                             ,child: Image.asset("assets/rufi.jpg",width: 50,height: 50,)
                         ),
                         Text("유니세프",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                          SizedBox(width: 300.0,),
                          Text("더 알아보기",style: TextStyle(fontSize: 15),),
                          IconButton(onPressed: (){},icon: Icon(Icons.arrow_forward_ios),),

                    ],
                         ),
                    SizedBox(height: 30.0,),
                    Container(
                        child: Row(
                          children:[
                            Column(
                              children: [
                                Image.asset("assets/rufi.jpg",width: 200,height: 200,),
                                Text("이건 내 기사내용이다"),
                              ],
                            ),
                            SizedBox(width: 30.0,),
                            Column(
                              children: [
                                Image.asset("assets/rufi.jpg",width: 200,height: 200,),
                                Text("이건 내 기사내용이다"),
                              ],
                            ),
                            SizedBox(width: 30.0,),
                            Column(
                              children: [
                                Image.asset("assets/rufi.jpg",width: 200,height: 200,),
                                Text("이건 내 기사내용이다"),
                              ],
                            ),
                            SizedBox(width: 30.0,),
                          ],
                    ),
    ),
                      ]
                    ),
    ),
              SizedBox(height: 30.0,),
              Container(
                child:Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:<Widget> [
                      Row(
                        children:[
                          ClipOval(
                              clipper : MyClipper()
                              ,child: Image.asset("assets/rufi.jpg",width: 50,height: 50,)
                          ),
                          Text("유니세프",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                          SizedBox(width: 300.0,),
                          Text("더 알아보기",style: TextStyle(fontSize: 15),),
                          IconButton(onPressed: (){},icon: Icon(Icons.arrow_forward_ios),),

                        ],
                      ),
                      SizedBox(height: 30.0,),
                      Container(
                        child: Row(
                          children:[
                            Column(
                              children: [
                                Image.asset("assets/rufi.jpg",width: 200,height: 200,),
                                Text("이건 내 기사내용이다"),
                              ],
                            ),
                            SizedBox(width: 30.0,),
                            Column(
                              children: [
                                Image.asset("assets/rufi.jpg",width: 200,height: 200,),
                                Text("이건 내 기사내용이다"),
                              ],
                            ),
                            SizedBox(width: 30.0,),
                            Column(
                              children: [
                                Image.asset("assets/rufi.jpg",width: 200,height: 200,),
                                Text("이건 내 기사내용이다"),
                              ],
                            ),
                            SizedBox(width: 30.0,),
                          ],
                        ),
                      ),
                    ]
                ),
              ),
              SizedBox(height: 30.0,),
              Container(
                child:Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:<Widget> [
                      Row(
                        children:[
                          ClipOval(
                              clipper : MyClipper()
                              ,child: Image.asset("assets/rufi.jpg",width: 50,height: 50,)
                          ),
                          Text("유니세프",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                          SizedBox(width: 300.0,),
                          Text("더 알아보기",style: TextStyle(fontSize: 15),),
                          IconButton(onPressed: (){},icon: Icon(Icons.arrow_forward_ios),),

                        ],
                      ),
                      SizedBox(height: 30.0,),
                      Container(
                        child: Row(
                          children:[
                            Column(
                              children: [
                                Image.asset("assets/rufi.jpg",width: 200,height: 200,),
                                Text("이건 내 기사내용이다"),
                              ],
                            ),
                            SizedBox(width: 30.0,),
                            Column(
                              children: [
                                Image.asset("assets/rufi.jpg",width: 200,height: 200,),
                                Text("이건 내 기사내용이다"),
                              ],
                            ),
                            SizedBox(width: 30.0,),
                            Column(
                              children: [
                                Image.asset("assets/rufi.jpg",width: 200,height: 200,),
                                Text("이건 내 기사내용이다"),
                              ],
                            ),
                            SizedBox(width: 30.0,),
                          ],
                        ),
                      ),
                    ]
                ),
              ),
              SizedBox(height: 30.0,),
              Container(
                child:Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:<Widget> [
                      Row(
                        children:[
                          ClipOval(
                              clipper : MyClipper()
                              ,child: Image.asset("assets/rufi.jpg",width: 50,height: 50,)
                          ),
                          Text("유니세프",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                          SizedBox(width: 300.0,),
                          Text("더 알아보기",style: TextStyle(fontSize: 15),),
                          IconButton(onPressed: (){},icon: Icon(Icons.arrow_forward_ios),),

                        ],
                      ),
                      SizedBox(height: 30.0,),
                      Container(
                        child: Row(
                          children:[
                            Column(
                              children: [
                                Image.asset("assets/rufi.jpg",width: 200,height: 200,),
                                Text("이건 내 기사내용이다"),
                              ],
                            ),
                            SizedBox(width: 30.0,),
                            Column(
                              children: [
                                Image.asset("assets/rufi.jpg",width: 200,height: 200,),
                                Text("이건 내 기사내용이다"),
                              ],
                            ),
                            SizedBox(width: 30.0,),
                            Column(
                              children: [
                                Image.asset("assets/rufi.jpg",width: 200,height: 200,),
                                Text("이건 내 기사내용이다"),
                              ],
                            ),
                            SizedBox(width: 30.0,),
                          ],
                        ),
                      ),
                    ]
                ),
              ),
              SizedBox(height: 30.0,),
              Container(
                child:Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:<Widget> [
                      Row(
                        children:[
                          ClipOval(
                              clipper : MyClipper()
                              ,child: Image.asset("assets/rufi.jpg",width: 50,height: 50,)
                          ),
                          Text("유니세프",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                          SizedBox(width: 300.0,),
                          Text("더 알아보기",style: TextStyle(fontSize: 15),),
                          IconButton(onPressed: (){},icon: Icon(Icons.arrow_forward_ios),),

                        ],
                      ),
                      SizedBox(height: 30.0,),
                      Container(
                        child: Row(
                          children:[
                            Column(
                              children: [
                                Image.asset("assets/rufi.jpg",width: 200,height: 200,),
                                Text("이건 내 기사내용이다"),
                              ],
                            ),
                            SizedBox(width: 30.0,),
                            Column(
                              children: [
                                Image.asset("assets/rufi.jpg",width: 200,height: 200,),
                                Text("이건 내 기사내용이다"),
                              ],
                            ),
                            SizedBox(width: 30.0,),
                            Column(
                              children: [
                                Image.asset("assets/rufi.jpg",width: 200,height: 200,),
                                Text("이건 내 기사내용이다"),
                              ],
                            ),
                            SizedBox(width: 30.0,),
                          ],
                        ),
                      ),
                    ]
                ),
              ),
              SizedBox(height: 30.0,),
              Container(
                child:Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:<Widget> [
                      Row(
                        children:[
                          ClipOval(
                              clipper : MyClipper()
                              ,child: Image.asset("assets/rufi.jpg",width: 50,height: 50,)
                          ),
                          Text("유니세프",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                          SizedBox(width: 300.0,),
                          Text("더 알아보기",style: TextStyle(fontSize: 15),),
                          IconButton(onPressed: (){},icon: Icon(Icons.arrow_forward_ios),),

                        ],
                      ),
                      SizedBox(height: 30.0,),
                      Container(
                        child: Row(
                          children:[
                            Column(
                              children: [
                                Image.asset("assets/rufi.jpg",width: 200,height: 200,),
                                Text("이건 내 기사내용이다"),
                              ],
                            ),
                            SizedBox(width: 30.0,),
                            Column(
                              children: [
                                Image.asset("assets/rufi.jpg",width: 200,height: 200,),
                                Text("이건 내 기사내용이다"),
                              ],
                            ),
                            SizedBox(width: 30.0,),
                            Column(
                              children: [
                                Image.asset("assets/rufi.jpg",width: 200,height: 200,),
                                Text("이건 내 기사내용이다"),
                              ],
                            ),
                            SizedBox(width: 30.0,),
                          ],
                        ),
                      ),
                    ]
                ),
              ),
              SizedBox(height: 30.0,),
            ],
    ),
    );






  }
}


