import 'package:flutter/material.dart';
import 'package:flutter_try/api/Userapi.dart';



class PersonalScreen extends StatefulWidget {
  static const String id = "personal_screen" ;
  @override
  _PersonalScreenState createState() => _PersonalScreenState();
}


class _PersonalScreenState extends State<PersonalScreen>
{
  late Future<UserJdata> Userform;

  @override
  void initState() {
    super.initState();
    Userform = fetchUserJdata();

  }

  @override
  Widget build(BuildContext context) {
    // const PrimaryColor = const Color(0xFFffa8a8);
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: FutureBuilder<UserJdata>(
                  future: Userform,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      // Text(snapshot.data.u_Username);
                      return Container(
                        child: Column(
                            children: [
                              SizedBox(width: 300.0,),
                              Expanded(child:Text(snapshot.data!.datag.u_Name)),
                              SizedBox(width: 300.0,),
                              Expanded(child:Text(snapshot.data!.datag.u_Email)),
                              SizedBox(width: 300.0,),
                              Expanded(child:Text(snapshot.data!.datag.u_Phone)),
                              SizedBox(width: 300.0,),
                              Expanded(child:Text(snapshot.data!.datag.u_Birth)),
                              SizedBox(width: 300.0,),
                            ],
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}'+'    !!this is error');
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
      ),
    );
  }
}
