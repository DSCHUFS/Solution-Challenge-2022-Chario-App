import 'package:flutter/material.dart';
import 'Subscribeapi.dart';
class SubscribeScreen extends StatefulWidget {
  static const String id = "Subscribe_screen";
  @override
  _SubscribeScreenState createState() => _SubscribeScreenState();
}

class _SubscribeScreenState extends State<SubscribeScreen> {

  late Future <DataList> Fcinform;

  @override
  void initState()
  {
    super.initState();
    Fcinform  = fetchSubJdata("shindh0429");
    print("check 1");
    print(Fcinform);
    print("check 2");
    print(Fcinform.runtimeType);

  }

  @override
  Widget build(BuildContext context) {
    // const PrimaryColor = const Color(0xFFffa8a8);
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
              automaticallyImplyLeading: false, // for custom icon option setting down below
            // title: Text(Fcinform),
          ),

        body: Container(
            child: FutureBuilder(
                future: Fcinform,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text("${snapshot}");
                    // return Text(snapshot.data!.);


                  } else if (snapshot.hasError) {
                    return Text("this is error");
                  }
                  else {
                    return CircularProgressIndicator();
                  }})
    ),
    ),
    );
  }
}
