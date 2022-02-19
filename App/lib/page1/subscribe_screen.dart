import 'package:flutter/material.dart';
import 'package:flutter_try/api/Subscribeapi.dart';
import 'HomePage.dart';

class SubscribeScreen extends StatefulWidget {
  static const String id = "subscribe_screen";
  @override
  _SubscribeScreenState createState() => _SubscribeScreenState();
}

class _SubscribeScreenState extends State<SubscribeScreen> {
  late Future<SubJdata> Fcinform;

  @override
  void initState() {
    super.initState();
    Fcinform = fetchSubJdata();
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
                child: FutureBuilder<SubJdata>(
                  future: Fcinform,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.separated(
                        // itemCount: snapshot.data.length, //  정보를 20개 보여줍니다

                        itemCount: 7,//  정보를 7개 보여줍니다   / 수정 필요

                        itemBuilder: (context, index) {
                          // List<SubJdata> eachname = snapshot.data.f_name.toList();

                          return ListTile(
                              //leading:ImageIcon(AssetImage(snapshot.data!.data[index].f_logo), size: 50.0,),    -> url 받아와서 어떻게,,
                              title: Text(snapshot.data!.data[index].f_name)
                          //title: Text(eachname)
                            // subtitle:
                            // trailing:

                        );
                      },
                        separatorBuilder: (context, index) { return Divider(); },
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
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
