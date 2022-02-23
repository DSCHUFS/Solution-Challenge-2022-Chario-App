import 'dart:core';
import 'package:flutter/material.dart';
import '../api/Subscribeapi.dart';


class SubscribeScreen extends StatefulWidget
{
  static const String id = "Subscribe_screen";
  @override
  _SubscribeScreenState createState() => _SubscribeScreenState();
}

class _SubscribeScreenState extends State<SubscribeScreen>
{
  late Future <DataList> Fcinform;
  @override
  void initState()
  {
    super.initState();
    Fcinform  = fetchSubJdata("shindh0429");
  }

  @override
  Widget build(BuildContext context) {
    // const PrimaryColor = const Color(0xFFffa8a8);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, // for custom icon option setting down below
        ),

        body: Container(
            child: FutureBuilder<DataList>(
                future: Fcinform,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    // return Text(snapshot.data!.datag[1].f_name);
                    return ListView.separated(
                        itemBuilder:(context, index)
                        {
                          return
                            ListTile(
                              leading:ImageIcon(
                                AssetImage("logo.png"), size: 50.0,
                                // AssetImage(snapshot.data!.datag[index].f_logo),size: 50.0,
                              ),
                              title: Text(snapshot.data!.datag[index].f_name),
                            );
                        },
                        separatorBuilder: (context, index) { return Divider(); },
                        itemCount: snapshot.data!.datag.length);
                  }
                  else if (snapshot.hasError) {

                    return Text('${snapshot.error}');
                  }
                  else {
                    return CircularProgressIndicator();
                  }})
        ),
      ),
    );
  }
}
