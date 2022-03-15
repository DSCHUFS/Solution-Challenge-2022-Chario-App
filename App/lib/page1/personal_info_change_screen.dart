
import 'package:flutter_try/page1/personal_screen.dart';
import '../constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_try/api/Userapi.dart';



class InfochangeScreen extends StatefulWidget
{
  static const String id = "personal_info_change_screen";
  @override
  _InfochangeScreenState createState() => _InfochangeScreenState();
}



class _InfochangeScreenState extends State<InfochangeScreen> {
  late Future<UData> Userform;


  @override
  void initState() {
    super.initState();
    Userform = fetchUserJdata();
  }


  @override
  Widget build(BuildContext context) {
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
                              Navigator.pushNamed(context, PersonalScreen.id);
                            },
                            child: Icon(Icons.arrow_back_ios),
                          ),
                          title: Text(snapshot.data!.u_Username + '-Info'),
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
                          "Name",
                          style: TextStyle(fontSize: 18),
                        ),
                        title: Text(snapshot.data!.u_Name,
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
                        leading: Text(
                          "Phone Number",
                          style: TextStyle(fontSize: 18),
                        ),
                        title: Text(snapshot.data!.u_Phone, textAlign: TextAlign.right),
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
                          "Birth",
                          style: TextStyle(fontSize: 18),
                        ),
                        title: Text(snapshot.data!.u_Birth, textAlign: TextAlign.right),
                      ),
                    ),

                    // Container(
                    //   decoration: BoxDecoration(
                    //     border: Border.all(
                    //       color: TeamColor,
                    //     ),
                    //   ),
                    //   child: ListTile
                    //     (
                    //     leading: Text(
                    //       "Personlal info",
                    //       style: TextStyle(fontSize: 18),
                    //     ),
                    //     trailing: Icon(Icons.arrow_forward_ios),
                    //   ),
                    // ),
                    //

                    Expanded(flex: 1,child: Container(),),

                    Card(
                      elevation: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                        [
                          TextButton(
                            onPressed: () async
                            {
                              Navigator.pushNamed(context, PersonalScreen.id);

                              },
                            child: Text("Confirm", style: TextStyle(fontWeight: FontWeight.bold,color: TeamColor),),
                          )
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