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

    //// need name
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
                              leading:ConstrainedBox(constraints: BoxConstraints(
                                minWidth: 44,
                                minHeight: 44,
                                maxWidth: 64,
                                maxHeight: 64, //
                                ),child: Image.network(snapshot.data!.datag[index].f_logo, fit: BoxFit.fill),

                              ),
                                title:new Center(child:new Text(snapshot.data!.datag[index].f_name),)
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
