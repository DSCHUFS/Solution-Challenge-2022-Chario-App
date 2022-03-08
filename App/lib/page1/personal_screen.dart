import 'package:flutter/material.dart';
import 'package:flutter_try/api/Userapi.dart';
import 'package:firebase_auth/firebase_auth.dart';


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
      body:
        FutureBuilder<UData>(
        future: Userform,
        builder: (context, snapshot) {
      if (snapshot.hasData) {
        // Text(snapshot.data.u_Username);
        return
          ListView(
            children:  <Widget>[
              Card(child: ListTile(title: Text('My-page'))),

              SizedBox(height:120 ) ,
              Card(
                child:
                ListTile(

                  title: Text('One-line with trailing widget'),
                  trailing: Icon(Icons.more_vert),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Column(
                    children: [
                      Text("이름"),
                      Text(snapshot.data!.u_Name),
                    ],
                  ),  // nedd onther  logo  to showthis fild is nam
                  title: Text("이름"),
                  subtitle:Center(child:Text(snapshot.data!.u_Name)),
                  trailing: Icon(Icons.more_vert),
                ),
              ),

              Card(
                child: ListTile(
                  leading: FlutterLogo(),  // nedd onther  logo  to showthis fild is nam
                  title: Text("이름"),
                  subtitle:Center(child:Text(snapshot.data!.u_Name)),
                  trailing: Icon(Icons.more_vert),
                ),
              ),
              Card(
                child: ListTile(
                  title: Text('One-line dense ListTile'),
                  dense: true,
                ),
              ),
              Card(
                child: ListTile(
                  leading: FlutterLogo(size: 56.0),
                  title: Center(child:Text('Login - email')),
                  subtitle: Center(child:Text(snapshot.data!.u_Email)),
                  trailing: Icon(Icons.more_vert),
                ),
              ),
              Card(
                child: ListTile(
                  leading: FlutterLogo(size: 72.0),
                  title: Text('Three-line ListTile'),
                  subtitle: Text(
                      'A sufficiently long subtitle warrants three lines.'),
                  trailing: Icon(Icons.more_vert),
                  isThreeLine: true,
                ),
              ),
            ],
          );


          } else if (snapshot.hasError)  // there will be no null info
          {
          return Text('${snapshot.error}'+'!!this is error');
          }
          return const CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          );
        },
        ),



    );
  }
}
