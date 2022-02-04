import 'package:flutter/material.dart';
import 'package:flutter_try/color.dart';
import 'package:flutter_try/page1/HomePage2.dart';
import 'package:flutter_try/page1/main.dart';
import 'package:flutter_try/page2/FcDetail.dart';


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
                      IconButton(onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>NoPoverty())
                        );
                      },icon: Icon(Icons.arrow_forward_ios),),

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