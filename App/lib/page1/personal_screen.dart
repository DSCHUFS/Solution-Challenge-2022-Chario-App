import 'package:flutter/material.dart';
import 'package:flutter_try/api/Userapi.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_try/page1/welcome_screen.dart';
import '../constants.dart';



class PersonalScreen extends StatefulWidget {
  static const String id = "personal_screen" ;
  @override
  _PersonalScreenState createState() => _PersonalScreenState();


}


class _PersonalScreenState extends State<PersonalScreen>
{
  late Future<Data> Userform;
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
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: FutureBuilder<Data>(
                  future: Userform,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      // Text(snapshot.data.u_Username);
                      return Container(
                        child: Column(
                          children: [
                            SizedBox(width: 300.0,),
                            Expanded(child:Text(snapshot.data!.u_Name)),
                            SizedBox(width: 300.0,),
                            Expanded(child:Text(snapshot.data!.u_Email)),
                            SizedBox(width: 300.0,),
                            Expanded(child:Text(snapshot.data!.u_Phone)),
                            SizedBox(width: 300.0,),
                            Expanded(child:Text(snapshot.data!.u_Birth)),
                            SizedBox(width: 300.0,),

                            TextButton(
                              onPressed: (){
                                _auth.signOut();
                                Navigator.pushNamed(context, WelcomeScreen.id);
                              },
                              child: Text(
                                'Logout',
                                style: TextStyle(color: TeamColor, fontSize: 15),
                              ),
                            ),

                          ],
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}'+'!!this is error');
                    }
                    return const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    );
                  },
                ),
              ),
            ),
          ],
        ),

    );
  }
}