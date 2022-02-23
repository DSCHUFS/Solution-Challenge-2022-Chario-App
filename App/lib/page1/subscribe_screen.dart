import 'package:flutter/material.dart';
import 'package:flutter_try/api/Subscribeapi.dart';
import 'HomePage.dart';

/// userapi 에서 data를 가져온다.


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
    /// 이름 맞는거만 받기 위해 string 을 넣자
    Fcinform = fetchSubJdata("shindh0429");
    print(Fcinform);
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
                        itemCount: int.parse(snapshot.data!.count), //  정보를 20개 보여줍니다
                        //  정보를 7개 보여줍니다   / 수정 필요
                        itemBuilder: (context, index) {

                          return ListTile(
                              // leading:ImageIcon(AssetImage(snapshot.data!.data[index].f_logo), size: 50.0,),
                              title: Text(snapshot.data!.data[0].f_name)
                        );
                      },
                        separatorBuilder: (context, index) { return Divider(); },
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot}");
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
