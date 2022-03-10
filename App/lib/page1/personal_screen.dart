import 'package:flutter/material.dart';
import 'package:flutter_try/api/Userapi.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_try/page1/HomePage.dart';

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
  Widget build(BuildContext context) {
    // const PrimaryColor = const Color(0xFFffa8a8);
    return Scaffold(
      body: FutureBuilder<UData>(
        future: Userform,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
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
                )),
                SizedBox(height: 30),
                CircleAvatar(
                  maxRadius: 100,
                  backgroundImage: AssetImage('assets/logo_char.png'),
                ),
                SizedBox(height: 30),
                // Card(
                //   child: ListTile(
                //     title: Text('One-line with trailing widget'),
                //     trailing: Icon(Icons.more_vert),
                //   ),
                // ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: TeamColor,
                    ),
                  ),
                  child: ListTile(
                    leading: Text(
                      "Name",
                      style: TextStyle(fontSize: 18),
                    ),
                    title:
                        Text(snapshot.data!.u_Name, textAlign: TextAlign.right),
                    // Center(child:Text(snapshot.data!.u_Name, textAlign: TextAlign.right)),
                    trailing: Icon(Icons.arrow_forward_ios),
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
                    title: Text(snapshot.data!.u_Username,
                        textAlign: TextAlign.right),
                    // Center(child:Text(snapshot.data!.u_Name, textAlign: TextAlign.right)),
                    trailing: Icon(Icons.arrow_forward_ios),
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
                      "Personlal info",
                      style: TextStyle(fontSize: 18),
                    ),
                    // Center(child:Text(snapshot.data!.u_Name, textAlign: TextAlign.right)),
                    trailing: Icon(Icons.arrow_forward_ios),
                  ),
                ),
                // Container(
                // decoration: BoxDecoration(
                //   border: Border.all(color: TeamColor),
                // ),
                //   child:
                // Card(
                //   child: ListTile(
                //     leading:Text("UserName",style: TextStyle(fontSize: 18),),
                //     subtitle:Center(child:Text(snapshot.data!.u_Username)),
                //     trailing: Icon(Icons.more_vert),),
                //       ),
                // ),
                // Card(
                //   child: ListTile(
                //     title: Text('One-line dense ListTile'),
                //     dense: true,
                //   ),
                // ),
                // Card(
                //   child: ListTile(
                //     leading: FlutterLogo(size: 56.0),
                //     title: Center(child: Text('Login - email')),
                //     subtitle: Center(child: Text(snapshot.data!.u_Email)),
                //     trailing: Icon(Icons.more_vert),
                //   ),
                // ),
                // Card(
                //   child: ListTile(
                //     leading: FlutterLogo(size: 72.0),
                //     title: Text('Three-line ListTile'),
                //     subtitle: Text(
                //         'A sufficiently long subtitle warrants three lines.'),
                //     trailing: Icon(Icons.more_vert),
                //     isThreeLine: true,
                //   ),
                // ),


              ],
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
    );
  }
}
