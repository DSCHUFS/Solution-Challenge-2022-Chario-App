import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_try/detailPage/FcDetail.dart';
import 'package:flutter_try/main.dart';
import 'package:flutter_try/page1/search_screen.dart';
import '../api/CategoryfcApi.dart';
import '../api/ContentsApi.dart';
import '../color.dart';
import 'package:flutter_try/page1/personal_screen.dart';
import 'package:flutter_try/page1/subscribe_screen.dart';
import 'donpersonal_screen.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbs;
import 'package:flutter_try/api/Userapi.dart';

import 'package:flutter_try/methods/stacked.dart';



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
  static const goals_color = {
    '1': sdg1,
    '2': sdg2,
    '3': sdg3,
    '4': sdg4,
    '6': sdg6,
    '10': sdg10,
    '13': sdg13,
    '14': sdg14
  };
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
          title: Row(
            children: [
              Image.asset("assets/logo_char.png", width: 50, height: 50),
              Image.asset("assets/logo_word.png", width: 120, height: 100),
            ],
          ),
          leading: Builder(
            builder: (context) => IconButton(
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
                      Icons.favorite,
                      color: Colors.grey[850],
                    ),
                    title: Text('구독현황'),
                    onTap: () {
                      Navigator.pushNamed(context, SubscribeScreen.id);
                    },
                    trailing: Icon(Icons.arrow_forward_ios)),
                ListTile(
                    leading: Icon(
                      Icons.volunteer_activism,
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
        body: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <Widget>[
          Text(
            " Donation part",
            style: TextStyle(fontSize: 40, fontFamily: 'Ubuntu'),
          ),
          Text(
            "   click your sdgs",
            style:
                TextStyle(fontSize: 20, fontFamily: 'Ubuntu', color: mainColor),
          ),
          SizedBox(height: 10),
          Container(
            child: Wrap(
              alignment: WrapAlignment.center,
              spacing: 30.0,
              runSpacing: 20.0,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      current_cate = '1';
                      CateFeJdata = fetchCateFeJdata(current_cate!);
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                        width: 70,
                        child: Image.asset(images[0], fit: BoxFit.cover)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      current_cate = '2';
                      CateFeJdata = fetchCateFeJdata(current_cate!);
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                        width: 70,
                        child: Image.asset(images[1], fit: BoxFit.cover)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      current_cate = '3';
                      CateFeJdata = fetchCateFeJdata(current_cate!);
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                        width: 70,
                        child: Image.asset(images[2], fit: BoxFit.cover)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      current_cate = '4';
                      CateFeJdata = fetchCateFeJdata(current_cate!);
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                        width: 70,
                        child: Image.asset(images[3], fit: BoxFit.cover)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      current_cate = '6';
                      CateFeJdata = fetchCateFeJdata(current_cate!);
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                        width: 70,
                        child: Image.asset(images[4], fit: BoxFit.cover)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      current_cate = '10';
                      CateFeJdata = fetchCateFeJdata(current_cate!);
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                        width: 70,
                        child: Image.asset(
                          images[5],
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      current_cate = '13';
                      CateFeJdata = fetchCateFeJdata(current_cate!);
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                        width: 70,
                        child: Image.asset(images[6], fit: BoxFit.cover)),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      current_cate = '14';
                      CateFeJdata = fetchCateFeJdata(current_cate!);
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                        width: 70,
                        child: Image.asset(images[7], fit: BoxFit.cover)),
                  ),
                ),
              ]),
            ),
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
                      itemBuilder: (context, int index)
                      {
                        print('index는 ${snapshot.data!.data[index].facility.fId}');
                        return
                          Padding(
                          padding: const EdgeInsets.all(8.0),

                          child:
                          Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder
                              (
                              //side: BorderSide(color: (Colors.blue[300])!, width: 0.5),
                              side: BorderSide(color: (goals_color[current_cate!])!, width: 0.5),

                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            //shadowColor: goals_color[current_cate!],
                            elevation: 11.0,
                            child:
                            Column(
                                children :[
                                  Wrap(
                                      alignment: WrapAlignment.center,
                                      spacing: 20.0,
                                      runSpacing: 20.0,
                                      children: [
                                        Column(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              SizedBox(height: 5,),
                                              Container
                                                (
                                                child: ContentHome(fc_id: (snapshot.data!.data[index].facility.fId).toString()),
                                              ),
                                            ]
                                        ),


                                        ListTile(
                                          leading:ClipOval(
                                              clipper: MyClipper(),
                                              child: Image.network(snapshot.data!.data[index].facility.fLogo, width: 100, height: 100,)),
                                          title:Text(snapshot.data!.data[index].facility.fName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                                          trailing: InkWell(
                                            onTap:()
                                            {
                                              Navigator.pushNamed(context, NoPoverty.id,arguments:(snapshot.data!.data[index].facility.fId).toString() );
                                            },
                                            child: Icon(Icons.arrow_forward_ios),
                                          ),
                                        ),

                                      ]
                                  )
                                ]),
                          ),
                        );
                      }),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              );
            },
          ),















          // FutureBuilder<CateFdata>(
          //   future: CateFeJdata,
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       print('current cate is ${current_cate}');
          //       print('전체길이는 ${snapshot.data!.count}');
          //       return Flexible(
          //         child: ListView.builder(
          //             shrinkWrap: true,
          //             itemCount: snapshot.data!.count,
          //             itemBuilder: (context, int index)
          //             {
          //               print('index는 ${snapshot.data!.data[index].facility.fId}');
          //               return Padding(
          //                 padding: const EdgeInsets.all(8.0),
          //
          //                 child: Card(
          //                     color: Colors.white,
          //                     shape: RoundedRectangleBorder
          //                       (
          //                       //side: BorderSide(color: (Colors.blue[300])!, width: 0.5),
          //                       side: BorderSide(color: (goals_color[current_cate!])!, width: 0.5),
          //
          //                       borderRadius: BorderRadius.circular(20.0),
          //                       ),
          //                     //shadowColor: goals_color[current_cate!],
          //                     elevation: 11.0,
          //                     child:
          //                     Column(
          //                     children :[
          //                     Wrap(
          //                         alignment: WrapAlignment.center,
          //                         spacing: 20.0,
          //                         runSpacing: 20.0,
          //                         children: [
          //                           Column(
          //                               mainAxisAlignment:
          //                               MainAxisAlignment.spaceEvenly,
          //                               children: <Widget>[
          //                                 SizedBox(height: 5,),
          //                                 Container
          //                                   (
          //                                   child: ContentHome(fc_id: (snapshot.data!.data[index].facility.fId).toString()),
          //                                 ),
          //                               ]
          //                           ),
          //
          //
          //                           ListTile(
          //                             leading:ClipOval(
          //                                 clipper: MyClipper(),
          //                                 child: Image.network(snapshot.data!.data[index].facility.fLogo, width: 100, height: 100,)),
          //                             title:Text(snapshot.data!.data[index].facility.fName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
          //                             trailing: InkWell(
          //                               onTap:()
          //                               {
          //                                 Navigator.pushNamed(context, NoPoverty.id,arguments:(snapshot.data!.data[index].facility.fId).toString() );
          //                               },
          //                               child: Icon(Icons.arrow_forward_ios),
          //                             ),
          //                           ),
          //
          //                         ]
          //                     )
          //                     ]),
          //                 ),
          //
          //
          //               );
          //             }),
          //       );
          //     } else if (snapshot.hasError) {
          //       return Text('${snapshot.error}');
          //     }
          //     // By default, show a loading spinner.
          //     return const CircularProgressIndicator(
          //       valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          //     );
          //   },
          // )




        ]));
  }
}




class ContentHome extends StatefulWidget
{
  final fc_id;
  const ContentHome({required this.fc_id});

  @override
  _ContentHomeState createState() => _ContentHomeState();
}

class _ContentHomeState extends State<ContentHome>
{
  Future<ContentsApi>? ContentJdata;
  @override
  void initState() {
    super.initState();
    ContentJdata = fetchContJdata(widget.fc_id);
  }

  @override
  Widget build(BuildContext context)
  {
    return FutureBuilder<ContentsApi>(
        future: ContentJdata,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            try {
              return
                Column(
                  children : [
                    SizedBox(height : 5),
                          GridView.count(
                          shrinkWrap: true,
                          crossAxisCount: 2,
                          children: List.generate(snapshot.data!.contentsList.length, (index) {
                            return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.network(snapshot.data!.contentsList[index].image, fit: BoxFit.fitWidth,),
                                  Text(snapshot.data!.contentsList[index].title, style: TextStyle(fontFamily: 'Ubuntu', fontSize: 12),)
                                ]);
                                              }
                          ),

                          ),

                    Container(
                      alignment: Alignment.bottomRight,
                      child:
                      Text('Start Donate :'+'  ${snapshot.data!.facDto.fMinimal}     ',
                        style: TextStyle(fontFamily: 'Ubuntu', fontSize: 10),
                      ),),

                  ],
                      );


            } on RangeError
            {
              print("hey! api!");
            }
          }
          else if (snapshot.data == null)
          {
            return   Text('There is no contents yet');
          }
          else
          {
            return Text('${snapshot.error}');
          }
          // By default, show a loading spinner.
          return const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          );
        });
  }
}
