import 'package:flutter/material.dart';
import 'Subscribe.dart';
import 'Search_Screen.dart';
import 'package:due_t_demo_proj/screens/GdscSector/NoPoverty.dart';
import 'package:due_t_demo_proj/screens/GdscSector/ZeroHunger.dart';
import 'package:due_t_demo_proj/screens/GdscSector/GoodHealth.dart';
import 'package:due_t_demo_proj/screens/GdscSector/QualityEducation.dart';
import 'package:due_t_demo_proj/screens/GdscSector/GenderEquality.dart';
import 'package:due_t_demo_proj/screens/GdscSector/CleanWater.dart';
import 'package:due_t_demo_proj/constants.dart';



class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // move to maybe  constant class
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, // for custom icon option setting down below
        // title:  AspectRatio(
        //     aspectRatio: 1.6,
        //     child: Image.asset(
        //       'assets/GDSCLOGO.jpg',
        //       fit: BoxFit.cover,
        //     ),
        //   ),
          title: Image.asset('assets/GDSCLOGO.jpg', width: 150, height: 140),

        // title: Image.asset('assets/GDSCLOGO.jpg'),

        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.person_rounded),
            onPressed: () => Scaffold.of(context).openDrawer(),
          ),
        ),

        actions: [
          IconButton(
              onPressed: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => Search_Screen())),
              icon: Icon(Icons.search))
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
                    color: tcolor,
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
                onTap:(){
                  print('회원정보 보기');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>Subscribe()
                      )
                  );
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
                  onTap:(){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>Subscribe()
                        )
                    );
                  }
                  ,trailing: Icon(Icons.arrow_forward_ios)
              )
            ],
          ),
        ),
      ),

////////////////////////////////////////
      body: SafeArea(
        child: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,


            children: <Widget>[
              // 1 ~2
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,


                  children: <Widget>[
                    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    Material(
                        elevation: 8,
                        borderRadius: BorderRadius.circular(28),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: InkWell(
                          splashColor: Colors.black26,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => NoPoverty()));
                          },
                          child: Ink.image(
                            image: AssetImage('assets/cat1.jpg'),
                            height: 200,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    Material(
                        elevation: 8,
                        borderRadius: BorderRadius.circular(28),
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: InkWell(
                          splashColor: Colors.black26,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ZeroHunger()));
                          },
                          child: Ink.image(
                            image: AssetImage('assets/cat2.jpg'),
                            height: 200,
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  ],
                ),
              ),




              // 3 ~4
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
                    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    Material(
                      elevation: 8,
                      borderRadius: BorderRadius.circular(28),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: InkWell(
                        splashColor: Colors.black26,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GoodHealth()));
                        },
                        child: Ink.image(
                          image: AssetImage('assets/cat3.jpg'),
                          height: 200,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    Material(
                      elevation: 8,
                      borderRadius: BorderRadius.circular(28),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: InkWell(
                        splashColor: Colors.black26,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => QualityEducation()));
                        },
                        child: Ink.image(
                          image: AssetImage('assets/cat4.jpg'),
                          height: 200,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  ],
                ),
              ),

////////

              // 5 ~6
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,

                  children: <Widget>[
                    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    Material(
                      elevation: 8,
                      borderRadius: BorderRadius.circular(28),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: InkWell(
                        splashColor: Colors.black26,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GenderEquality()));
                        },
                        child: Ink.image(
                          image: AssetImage('assets/cat5.jpg'),
                          height: 200,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),

                    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                    Material(
                      elevation: 8,
                      borderRadius: BorderRadius.circular(28),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: InkWell(
                        splashColor: Colors.black26,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CleanWater()));
                        },
                        child: Ink.image(
                          image: AssetImage('assets/cat6.jpg'),
                          height: 200,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      /////////Informattion sector for
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context)
            .push(MaterialPageRoute(builder: (_) => Subscribe())),
        child: const Icon(Icons.star),
      ),
    );
  }
}
