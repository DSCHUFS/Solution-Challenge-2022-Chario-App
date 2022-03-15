import 'package:flutter/material.dart';
import 'package:flutter_try/api/Userapi.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_try/page1/HomePage.dart';
import 'package:flutter_try/page1/personal_info_change_screen.dart';
import 'package:flutter_try/page1/welcome_screen.dart';
import '../constants.dart';

class PersonalScreen extends StatefulWidget {
  static const String id = "personal_screen";
  @override
  _PersonalScreenState createState() => _PersonalScreenState();
}

class _PersonalScreenState extends State<PersonalScreen> {
  late Future<UData> Userform;
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    Userform = fetchUserJdata();
  }

  @override
  Widget build(BuildContext context)
  {
    // const PrimaryColor = const Color(0xFFffa8a8);
    return Scaffold(
      body:
      SafeArea(
        child :
      FutureBuilder<UData>(
            future: Userform,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  child: Column(
                  children: <Widget>[

                    Card(
                        child: ListTile(
                      leading: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, HomePage.id);
                        },
                        child: Icon(Icons.arrow_back_ios),
                      ),
                      title: Text('My-page'),
                      trailing: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, HomePage.id);
                        },
                        child: Icon(Icons.home),
                      ),
                    )
                    ),

                    SizedBox(height: 30),
                    CircleAvatar(
                      maxRadius: 100,
                      backgroundImage: AssetImage('assets/logo_char.png'),
                    ),
                    SizedBox(height: 30),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: TeamColor,
                        ),
                      ),
                      child: ListTile(
                        leading: Text(
                          "Login-Id",
                          style: TextStyle(fontSize: 18),
                        ),
                        title: Text(snapshot.data!.u_Email,
                            textAlign: TextAlign.right),
                        ),
                      ),

                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: TeamColor,
                        ),
                      ),
                      child: ListTile(
                        leading: Text(
                          "UserName",
                          style: TextStyle(fontSize: 18),
                        ),
                        title: Text(snapshot.data!.u_Username, textAlign: TextAlign.right),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: TeamColor,
                        ),
                      ),
                      child: ListTile(
                        onTap :() {Navigator.pushNamed(context, InfochangeScreen.id);},
                        leading: Text(
                          "Personlal info",
                          style: TextStyle(fontSize: 18),
                        ),
                        // Center(child:Text(snapshot.data!.u_Name, textAlign: TextAlign.right)),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                    Expanded(flex: 1,child: Container(),),

                    Card(
                      elevation: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Logout",
                            style: TextStyle(fontWeight: FontWeight.bold,color: TeamColor),
                          ),
                          IconButton(
                              icon: Icon(Icons.logout,color: TeamColor),
                              onPressed: () async {
                                await _auth.signOut();
                                Navigator.pushNamedAndRemoveUntil(context,
                                    WelcomeScreen.id, (route) => false);
                              }),
                        ],
                      ),
                    ),
                  ],
                  ),
                );
              } else if (snapshot.hasError) // there will be no null info
              {
                return Text('${snapshot.error}' + '!!this is error');
              }
              return const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              );
            },
          ),

      ),
    );



  }
}
