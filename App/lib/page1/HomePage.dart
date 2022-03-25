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


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const String id = "HomePage";

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<HomePage> {
  late Future<CateFdata> CateFeJdata;
  late Future<UData> Userform;
  String? current_cate = '1';
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
  List<String> category = <String>['1','2','3','4','6','10','13','14'];
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
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).primaryColor,
        // for custom icon option setting down below
        // backgroundColor: mainColor,
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
                title: Text('My-Page'),
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
                  title: Text('Subscribe'),
                  onTap: () {
                    Navigator.pushNamed(context, SubscribeScreen.id);
                  },
                  trailing: Icon(Icons.arrow_forward_ios)),
              ListTile(
                  leading: Icon(
                    Icons.volunteer_activism,
                    color: Colors.grey[850],
                  ),
                  title: Text('Donation'),
                  onTap: () {
                    Navigator.pushNamed(context, DonpersonalScreen.id);
                  },
                  trailing: Icon(Icons.arrow_forward_ios)),
            ],
          ),
        ),
      ),
      //////////////////////////////////////////////////////////////////////////////////////////////////
      body:
      Container
        (
        decoration:
        BoxDecoration
          (
            color: Colors.white,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              SizedBox(height: 20),
              Container(
                height: 115,
                child:
                ListView.separated(
                  padding: const EdgeInsets.all(1),
                  itemCount: 8,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context,index){
                    return
                      Container(
                        padding: const EdgeInsets.all(10),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              current_cate = (index+1).toString() ;
                              CateFeJdata = fetchCateFeJdata(category[int.parse(current_cate!)-1]);});},
                          child:
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                                width: 100,
                                child: Image.asset(images[index], fit: BoxFit.cover)),),),
                      );
                  },
                  separatorBuilder: (BuildContext context,int index) =>const Divider(),
                ),
              ),

              Flexible(
                fit: FlexFit.tight,
                child: Container(
                  height: 100,
                  child: FutureBuilder<CateFdata>(
                    future: CateFeJdata,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return
                          ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.count,
                              itemBuilder: (context, int index) {
                                print('index는 ${snapshot.data!.data[index].facility.fId}');

                                return Padding(padding: const EdgeInsets.all(8.0),
                                  child: Card(
                                    color: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      // side: BorderSide(width: 0.5),
                                      borderRadius: BorderRadius.circular(30.0),),
                                    shadowColor: goals_color[category[int.parse(current_cate!)-1]],
                                    elevation: 11.0,
                                    child:
                                    Column(
                                        children: [
                                          Wrap(
                                              alignment: WrapAlignment.center, spacing: 20.0, runSpacing: 20.0,
                                              children: [

                                                ContentHome(fc_id: (snapshot.data!.data[index].facility.fId.toString()),),

                                                ListTile(
                                                  leading: ClipOval(
                                                      clipper: MyClipper(),
                                                      child: Image.network(
                                                        snapshot.data!.data[index].facility.fLogo,
                                                        width: 100,
                                                        height: 100,
                                                      )),
                                                  title: Text(
                                                    snapshot.data!.data[index]
                                                        .facility.fName,
                                                    style: TextStyle(
                                                        fontWeight:
                                                        FontWeight.bold,
                                                        fontSize: 20),
                                                  ),
                                                  trailing: InkWell(
                                                    onTap: () {
                                                      Navigator.pushNamed(
                                                          context,
                                                          NoPoverty.id,
                                                          arguments: (snapshot
                                                              .data!
                                                              .data[index]
                                                              .facility
                                                              .fId)
                                                              .toString());
                                                    },
                                                    child: Icon(Icons
                                                        .arrow_forward_ios),
                                                  ),
                                                ),
                                              ])
                                        ]),
                                  ),
                                );
                              }
                              );
                      } else if (snapshot.hasError) {
                        return Text('${snapshot.error}');
                      }
                      // By default, show a loading spinner.
                      return const CircularProgressIndicator(
                        valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.white),
                      );
                    },
                  ),
                ),
              ),
            ]
        ),
      ),
    );

  }
}

class ContentHome extends StatefulWidget {
  final fc_id;
  const ContentHome({Key? key,required this.fc_id
  }): super(key: key);

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
          if (snapshot.hasData) {
            try {
              return
                Column(
                  children: [
                    Stack(
                      children: <Widget>
                      [
                        ClipRRect(
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0)),
                          child:   Image.network(snapshot.data!.contentsList[0].image, fit: BoxFit.cover,),
                        ),

                        Positioned(
                          bottom: 0,
                          left: 0,
                          child :Text(
                            snapshot.data!.contentsList[0].title,
                            style:
                            TextStyle(fontFamily: 'Ubuntu', fontSize: 14,color: Colors.white),
                          ),
                        ),
                      ],),

                    Container(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        'Start Donate :' + '  ${snapshot.data!.facDto.fMinimal}'+'KRW  ',
                        style: TextStyle(fontFamily: 'Ubuntu', fontSize: 18),
                      ),
                    ),
                  ],
                );
            } on RangeError {
              print("hey! api!");
            }
          } else if (snapshot.data == null) {
            return Text('There is no contents yet');
          } else {
            return Text('${snapshot.error}');
          }
          // By default, show a loading spinner.
          return const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          );
        });
  }
}