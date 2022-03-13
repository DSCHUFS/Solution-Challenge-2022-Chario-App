import 'package:flutter/material.dart';
import 'package:flutter_try/detailPage/FcDetail.dart';
import 'package:flutter_try/main.dart';
import 'package:flutter_try/page1/search_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api/CategoryfcApi.dart';
import '../api/ContentsApi.dart';
import '../color.dart';
import 'package:flutter_try/api/Fcapi.dart';
import 'package:flutter_try/page1/personal_screen.dart';
import 'package:flutter_try/page1/subscribe_screen.dart';
import 'donpersonal_screen.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbs;

import 'package:flutter_try/api/Userapi.dart';

class HomePage extends StatefulWidget {

  const HomePage({Key? key}) : super(key: key);
  static const String id = "HomePage";

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<HomePage> {
  late Future<CateFdata> CateFeJdata;
  late Future<UData> Userform;
  String? current_cate = '4';
  static const List<String> images = <String>[
    'assets/sdg/goal1.png',
    'assets/sdg/goal2.png',
    'assets/sdg/goal3.png',
    'assets/sdg/goal4.png',
    'assets/sdg/goal6.png',
    'assets/sdg/goal10.png',
    'assets/sdg/goal13.png',
    'assets/sdg/14,15goal.png'
  ];
  static const List<String> goals = <String>[
    'No Poverty',
    'Zero hunger',
    'Good Health and well-being',
    'Quality education',
    'Clean water and snitaion?',
    'reduced inequalities',
    'Climate action',
    'Saving Life'
  ];

  late fbs.User loggedInUser;

  @override
  void initState() {
    super.initState();
    // HomeFcJdata = fetchFcJdata();
    CateFeJdata = fetchCateFeJdata(current_cate!);
    Userform = fetchUserJdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          automaticallyImplyLeading: false,
          // for custom icon option setting down below
          backgroundColor: mainColor,
          title: Image.asset("assets/Logo_width.png", width: 100, height: 50),
          leading: Builder(
            builder: (context) =>
                IconButton(
                  icon: Icon(Icons.person_rounded),
                  onPressed: () => Scaffold.of(context).openDrawer(),

                ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                Navigator.pushNamed(context, SearchScreen.id);
              },
            )
          ],
        ),

        drawer: Container(
          child: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                FutureBuilder<UData>(
                  future: Userform,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return UserAccountsDrawerHeader(
                        currentAccountPicture: CircleAvatar(
                          backgroundImage: AssetImage('assets/Logo.png'),
                        ),
                        otherAccountsPictures: [
                          CircleAvatar(
                            backgroundImage: AssetImage('assets/Logo.png'),
                          )
                        ],
                        accountEmail: Text(snapshot.data!.u_Email),
                        accountName: Text(snapshot.data!.u_Name),
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
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}' + '!!this is error');
                    }
                    return const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    );
                  },
                ),
                ListTile(
                  leading: Icon(
                    Icons.person_rounded,
                    color: Colors.grey[850],
                  ),
                  title: Text('회원정보 보기'),
                  onTap: () {
                    Navigator.pushNamed(context, PersonalScreen.id);
                  },
                  trailing: Icon(Icons.arrow_forward_ios),
                ),
                ListTile(
                    leading: Icon(
                      Icons.image,
                      color: Colors.grey[850],
                    ),
                    title: Text('구독현황'),
                    onTap: () {
                      Navigator.pushNamed(context, SubscribeScreen.id);
                    },
                    trailing: Icon(Icons.arrow_forward_ios)),
                ListTile(
                    leading: Icon(
                      Icons.image,
                      color: Colors.grey[850],
                    ),
                    title: Text('기부현황'),
                    onTap: () {
                      Navigator.pushNamed(context, DonpersonalScreen.id);
                    },
                    trailing: Icon(Icons.arrow_forward_ios)),
              ],
            ),
          ),
        ),
        body:
        Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
          Text(
            "Where do you want to donate?",
            style: TextStyle(fontSize: 40),
          ),
          Wrap(
              alignment: WrapAlignment.center,
              spacing: 20.0,
              runSpacing: 20.0,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      current_cate = '1';
                      CateFeJdata = fetchCateFeJdata(current_cate!);
                    });
                  }
                  ,
                  child: CircleAvatar(
                      radius: 40.0, backgroundImage: AssetImage(images[0])),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      current_cate = '2';
                      CateFeJdata = fetchCateFeJdata(current_cate!);
                    });
                  }
                  ,
                  child: CircleAvatar(
                      radius: 40.0, backgroundImage: AssetImage(images[1])),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      current_cate = '3';
                      CateFeJdata = fetchCateFeJdata(current_cate!);
                    });
                  }
                  ,
                  child: CircleAvatar(
                      radius: 40.0, backgroundImage: AssetImage(images[2])),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      current_cate = '4';
                      CateFeJdata = fetchCateFeJdata(current_cate!);
                    });
                  }
                  ,
                  child: CircleAvatar(
                      radius: 40.0, backgroundImage: AssetImage(images[3])),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      current_cate = '6';
                      CateFeJdata = fetchCateFeJdata(current_cate!);
                    });
                  }
                  ,
                  child: CircleAvatar(
                      radius: 40.0, backgroundImage: AssetImage(images[4])),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      current_cate = '10';
                      CateFeJdata = fetchCateFeJdata(current_cate!);
                    });
                  }
                  ,
                  child: CircleAvatar(
                      radius: 40.0, backgroundImage: AssetImage(images[5])),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      current_cate = '13';
                      CateFeJdata = fetchCateFeJdata(current_cate!);
                    });
                  }
                  ,
                  child: CircleAvatar(
                      radius: 40.0, backgroundImage: AssetImage(images[6])),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      current_cate = '14';
                      CateFeJdata = fetchCateFeJdata(current_cate!);
                    });
                  }
                  ,
                  child: CircleAvatar(
                      radius: 40.0, backgroundImage: AssetImage(images[7])),
                ),
              ]),
         FutureBuilder<CateFdata>(
              future: CateFeJdata,
              builder: (context, snapshot) {
              if (snapshot.hasData) {
              print('current cate is ${current_cate}');
              print('전체길이는 ${snapshot.data!.count}');
              return Flexible(
                child: ListView.builder(
                shrinkWrap: true,
                  itemCount: snapshot.data!.count,
                  itemBuilder: (context, int index) {
                  print('index는 ${snapshot.data!.data[index].facility.fId}');
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ), shadowColor: Colors.red,
                      elevation:11.0,
                    child: Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 20.0,
                      runSpacing: 20.0, children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                        Row(
                          children: [
                          ClipOval(
                            clipper: MyClipper(),
                            child: Image.network(
                            snapshot.data!.data[index].facility.fLogo,
                            width: 100,
                            height: 100,
                          )),

                          Text(
                          snapshot.data!.data[index].facility.fName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                          ),


                          IconButton(
                              onPressed: () {
                              Navigator.push(
                              context,
                              MaterialPageRoute(
                              builder: (context) =>
                            NoPoverty(
                              fc_id: (snapshot.data!.data[index].facility.fId).toString(),
                              )));
                              },
                            icon: Icon(Icons.arrow_forward_ios),


              ),
              ],
              ),
                        Container(
                          child: ContentHome(fc_id:(snapshot.data!.data[index].facility.fId).toString()
                          ),
              ),
              ]),

              ]));
              }
              ),
              );
              } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              );
              },
              )


        ]
        )
    );
  }
}
class ContentHome extends StatefulWidget {
  final fc_id;
  const ContentHome({required this.fc_id});

  @override
  _ContentHomeState createState() => _ContentHomeState();
}

class _ContentHomeState extends State<ContentHome> {
  Future<ContentsApi>? ContentJdata;
  @override
  void initState() {
    super.initState();
    ContentJdata = fetchContJdata(widget.fc_id);
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ContentsApi>(
        future: ContentJdata,
        builder: (context, snapshot) {
          if(snapshot.hasData){
            return Column(children:[
             Image.network(snapshot.data!.contentsList[0].image),
              Text(snapshot.data!.contentsList[0].title)]
            );

          }
          else if (snapshot.hasError) {
          return Text('${snapshot.error}');
          }
          // By default, show a loading spinner.
          return const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          );
        }

    );
  }
}


