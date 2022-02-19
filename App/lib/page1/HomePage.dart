import 'package:flutter/material.dart';
import 'package:flutter_try/detailPage/FcDetail.dart';
import 'package:flutter_try/detailPage/FcDetail2.dart';
import 'package:flutter_try/detailPage/FcDetail3.dart';
import 'package:flutter_try/detailPage/FcDetail4.dart';
import 'package:flutter_try/detailPage/FcDetail5.dart';
import 'package:flutter_try/main.dart';
import '../color.dart';
import 'package:flutter_try/api/Fcapi.dart';
import 'package:flutter_try/page1/personal_screen.dart';
import 'package:flutter_try/page1/search_screen.dart';
import 'package:flutter_try/page1/subscribe_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String id = "HomePage";

  @override
  _MyAppState createState() => _MyAppState();

}
class _MyAppState extends State<HomePage>{
  late Future<FcJdata> HomeFcJdata;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HomeFcJdata = fetchFcJdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false, // for custom icon option setting down below
            backgroundColor: mainColor,
            title:Image.asset("assets/chario_logo.png",width:100,height:50),
            leading: Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.person_rounded),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            actions: [
              IconButton(
                  icon: Icon(Icons.search),
              //     onPressed: () => Navigator.of(context)
              //         .push(MaterialPageRoute(builder: (_) => Search_Screen())),
              onPressed: (){Navigator.pushNamed(context, PersonalScreen.id);},
              )
            ],
          ),
      drawer: Container(
        child: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/selfie.jpeg'),
                ),
                otherAccountsPictures: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/GDSCLOGO.jpg'),
                  )
                ],
                accountEmail: Text('assets/krischo1204@gmail.com'),
                accountName: Text('chosung hyun'),
                onDetailsPressed: () {
                  print('press details');
                },
                decoration: BoxDecoration(
                  // color:
                    color: mainColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    )),
              ),
              ListTile(
                leading:Icon(
                  Icons.home,
                  color:Colors.grey[850],
                ),
                title: Text('회원정보 보기'),

                onTap:()
                {
                  Navigator.pushNamed(context, PersonalScreen.id);

                  },
                trailing: Icon(Icons.arrow_forward_ios),
              ),

              // ListTile
              //   (
              //   title: Text('Item 2'),
              //   onTap: () {
              //     Navigator.pop(context);
              //   },
              // ),
              //

              ListTile(
                  leading:Icon(
                    Icons.image,
                    color:Colors.grey[850],
                  ),
                  title: Text('구독현황'),
                  // onTap:(){
                  //   Navigator.push(
                  //       context,
                  //       MaterialPageRoute(
                  //           builder: (context) =>Subscribe_Screen()
                  //       ));
                  //   },
                  onTap:()
                  {
                    Navigator.pushNamed(context, SubscribeScreen.id);
                  },
                  trailing: Icon(Icons.arrow_forward_ios)
              )
            ],
          ),
        ),
      ),

          body: ListView(
                  children:<Widget> [
                      FutureBuilder<FcJdata>(
                        future: HomeFcJdata,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Container(
                              child:Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                                  children:<Widget>
                                  [

                                    Row(
                                      children:[
                                        ClipOval(
                                            clipper : MyClipper()
                                            ,child: Image.network(
                                          "https://storage.googleapis.com/content_image/%EB%A1%9C%EA%B3%A0/%E1%84%8E%E1%85%A9%E1%84%85%E1%85%A9%E1%86%A8%E1%84%8B%E1%85%AE%E1%84%89%E1%85%A1%E1%86%AB.gif?authuser=1",
                                          width: 100,height: 100,
                                        )
                                        ),
                                        Text(snapshot.data!.data[0].f_name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                                        SizedBox(width: 300.0,),
                                        Text("더 알아보기",style: TextStyle(fontSize: 15),),
                                        IconButton(onPressed: (){
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(builder: (context) =>NoPoverty1())
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
                                              Image.network("https://storage.googleapis.com/content_image/Unicef_contents/Unicef_edu_01_13.jpg?authuser=1",width: 200,height: 200),
                                              Text(" "),
                                            ],
                                          ),
                                          SizedBox(width: 30.0,),

                                          SizedBox(width: 30.0,),
                                          // Column(
                                          //   children: [
                                          //     Image.asset("assets/rufi.jpg",width: 200,height: 200,),
                                          //     Text("이건 내 기사내용이다"),
                                          //   ],

                                          SizedBox(width: 30.0,),
                                        ],
                                      ),
                                    ),
                                  ]
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return Text('${snapshot.error}');
                          }
                          // By default, show a loading spinner.
                          return const CircularProgressIndicator(valueColor:AlwaysStoppedAnimation<Color>(Colors.white),);
                        },
                      ),
                      SizedBox(height: 30.0,),
                    FutureBuilder<FcJdata>(
                      future: HomeFcJdata,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Container(
                            child:Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children:<Widget> [
                                  Row(
                                    children:[
                                      ClipOval(
                                          clipper : MyClipper()
                                          ,child: Image.network(
                                        "https://storage.googleapis.com/content_image/%EB%A1%9C%EA%B3%A0/%EC%9C%A0%EB%8B%88%EC%84%B8%ED%94%84%EB%A1%9C%EA%B3%A0.jpg?authuser=1",
                                        width: 100,height: 100,
                                      )
                                      ),
                                      Text(snapshot.data!.data[1].f_name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                                      SizedBox(width: 300.0,),
                                      Text("더 알아보기",style: TextStyle(fontSize: 15),),
                                      IconButton(onPressed: (){
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) =>NoPoverty2())
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
                                            Image.network("https://storage.googleapis.com/content_image/Unicef_contents/Unicef_tonga_01_27.jpg?authuser=1",width: 200,height: 200),
                                            Text(" "),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ]
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }

                        // By default, show a loading spinner.
                        return const CircularProgressIndicator(valueColor:AlwaysStoppedAnimation<Color>(Colors.white),);
                      },
                    ),

                    SizedBox(height: 30.0,),
                    FutureBuilder<FcJdata>(
                      future: HomeFcJdata,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Container(
                            child:Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children:<Widget> [
                                  Row(
                                    children:[
                                      ClipOval(
                                          clipper : MyClipper()
                                          ,child: Image.network
                                        (
                                        "https://storage.googleapis.com/content_image/%EB%A1%9C%EA%B3%A0/%E1%84%80%E1%85%AE%E1%86%BA%E1%84%82%E1%85%A6%E1%84%8B%E1%85%B5%E1%84%87%E1%85%A5%E1%84%89%E1%85%B3.png",
                                        width: 100,height: 100,
                                      )
                                      ),
                                      Text(snapshot.data!.data[2].f_name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                                      SizedBox(width: 300.0,),
                                      Text("더 알아보기",style: TextStyle(fontSize: 15),),
                                      IconButton(onPressed: (){
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) =>NoPoverty3())
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

                                            Image.network(
                                              "https://storage.googleapis.com/content_image/%EB%A1%9C%EA%B3%A0/%E1%84%80%E1%85%AE%E1%86%BA%E1%84%82%E1%85%A6%E1%84%8B%E1%85%B5%E1%84%87%E1%85%A5%E1%84%89%E1%85%B3.png",
                                              width: 100,height: 100,
                                            ),
                                            Text(""),
                                          ],
                                        ),
                                        SizedBox(width: 30.0,),
                                        Column(
                                          children: [

                                            Text(""),
                                          ],
                                        ),
                                        SizedBox(width: 30.0,),
                                        Column(
                                          children: [

                                            Text(""),
                                          ],
                                        ),
                                        SizedBox(width: 30.0,),
                                      ],
                                    ),
                                  ),
                                ]
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }

                        // By default, show a loading spinner.
                        return const CircularProgressIndicator(valueColor:AlwaysStoppedAnimation<Color>(Colors.white),);
                      },
                    ),
                    SizedBox(height: 30.0,),
                    FutureBuilder<FcJdata>(
                      future: HomeFcJdata,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Container(
                            child:Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children:<Widget> [
                                  Row(
                                    children:[
                                      ClipOval(
                                          clipper : MyClipper()
                                          ,child: Image.network(
                                        "https://storage.googleapis.com/content_image/%EB%A1%9C%EA%B3%A0/%E1%84%86%E1%85%B5%E1%86%AF%E1%84%8B%E1%85%A1%E1%86%AF%E1%84%87%E1%85%A9%E1%86%A8%E1%84%8C%E1%85%B5%E1%84%8C%E1%85%A2%E1%84%83%E1%85%A1%E1%86%AB.png",
                                        width: 100,height: 100,
                                      )
                                      ),
                                      Text(snapshot.data!.data[3].f_name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                                      SizedBox(width: 300.0,),
                                      Text("더 알아보기",style: TextStyle(fontSize: 15),),
                                      IconButton(onPressed: (){
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) =>NoPoverty4())
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
                                            //
                                            Text("이건 내 기사내용이다"),
                                          ],
                                        ),
                                        SizedBox(width: 30.0,),
                                        Column(
                                          children: [
                                            //
                                            Text("이건 내 기사내용이다"),
                                          ],
                                        ),
                                        SizedBox(width: 30.0,),
                                        Column(
                                          children: [
                                            //
                                            Text("이건 내 기사내용이다"),
                                          ],
                                        ),
                                        SizedBox(width: 30.0,),
                                      ],
                                    ),
                                  ),
                                ]
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }

                        // By default, show a loading spinner.
                        return const CircularProgressIndicator(valueColor:AlwaysStoppedAnimation<Color>(Colors.white),);
                      },
                    ),
                    SizedBox(height: 30.0,),
                    FutureBuilder<FcJdata>(
                      future: HomeFcJdata,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Container(
                            child:Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children:<Widget> [
                                  Row(
                                    children:[
                                      ClipOval(
                                          clipper : MyClipper()
                                          ,child: Image.network(
                                        "https://storage.googleapis.com/content_image/%EB%A1%9C%EA%B3%A0/%E1%84%91%E1%85%AE%E1%84%85%E1%85%B3%E1%86%AB%E1%84%83%E1%85%B3%E1%86%BC%E1%84%83%E1%85%A2.gif",
                                        width: 100,height: 100,
                                      )
                                      ),
                                      Text(snapshot.data!.data[4].f_name,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                                      SizedBox(width: 300.0,),
                                      Text("더 알아보기",style: TextStyle(fontSize: 15),),
                                      IconButton(onPressed: (){
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) =>NoPoverty5())
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
                                            //
                                            Text("이건 내 기사내용이다"),
                                          ],
                                        ),
                                        SizedBox(width: 30.0,),
                                        Column(
                                          children: [
                                            //
                                            Text("이건 내 기사내용이다"),
                                          ],
                                        ),
                                        SizedBox(width: 30.0,),
                                        Column(
                                          children: [
                                            //
                                            Text("이건 내 기사내용이다"),
                                          ],
                                        ),
                                        SizedBox(width: 30.0,),
                                      ],
                                    ),
                                  ),
                                ]
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Text('${snapshot.error}');
                        }

                        // By default, show a loading spinner.
                        return const CircularProgressIndicator(valueColor:AlwaysStoppedAnimation<Color>(Colors.white),);
                      },
                    ),
                    SizedBox(height: 30.0,),

                  ]
              ),
            );




  }
}