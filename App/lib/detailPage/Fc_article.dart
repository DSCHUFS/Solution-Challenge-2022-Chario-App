import 'package:flutter/material.dart';

import '../api/ContentsApi.dart';


class HomeScreen extends StatefulWidget {

  HomeScreen({
    Key? key,
    required this.fc_id,}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
  final String fc_id;

}

class _HomeScreenState extends State<HomeScreen> {
  late Future<ContentsApi> ContentFcJdata;

  @override
  void initstate() {
    String fcId = widget.fc_id.toString();
    ContentFcJdata = fetchContJdata(fcId);
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ContentsApi>(
        future: ContentFcJdata,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(snapshot.data!.contentsList[0].title),
                    content: Text(snapshot.data!.contentsList[0].body),

                    actions: <Widget>[
                      IconButton(
                        onPressed: () { Navigator.pop(context, 'Cancel'); },
                        icon: Icon(Icons.dangerous),

                      ),

                    ],
                  );
                }
            );
          }
          return Container();
        }

    );
  }
}