import 'dart:core';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_try/constants.dart';
import '../api/Subscribeapi.dart';
import 'package:flutter_try/detailPage/FcDetail.dart';
import 'package:flutter_try/page1/HomePage.dart';

class SubscribeScreen extends StatefulWidget {
  static const String id = "subscribe_screen";

  @override
  _SubscribeScreenState createState() => _SubscribeScreenState();
}

class _SubscribeScreenState extends State<SubscribeScreen> {
  late Future<DataList> Fcinform;
  @override
  void initState()
  {
    super.initState();
    Fcinform = fetchSubJdata();
  }

  @override
  Widget build(BuildContext context) {
    // const PrimaryColor = const Color(0xFFffa8a8);
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<DataList>(
            future: Fcinform,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Column(

                  children: <Widget>[
                    Card(
                        child: ListTile(
                          leading: InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, HomePage.id);
                            },
                            child: Icon(Icons.arrow_back_ios),
                          ),
                          trailing: Text('Subscribe-page'),
                        )
                    ),
                    SizedBox(height: 30),

                    Expanded(
                      child:
                      ListView.separated(
                        itemCount: snapshot.data!.sub_count,
                        itemBuilder: (BuildContext context, index) {
                          return ListTile(
                              leading: ConstrainedBox(
                                constraints: BoxConstraints(
                                  minWidth: 44,
                                  minHeight: 44,
                                  maxWidth: 64,
                                  maxHeight: 64, //
                                ),
                                child: Image.network(
                                    snapshot.data!.sub_list[index].f_logo,
                                    fit: BoxFit.fill),
                              ),
                              title: Center(
                                child:
                                Text(snapshot.data!.sub_list[index].f_name),
                              ),
                              trailing: InkWell(
                                onTap: () {
                                  Navigator.pushNamedAndRemoveUntil(context, NoPoverty.id, (route) => false, arguments: (snapshot.data!.sub_list[index].f_id).toString());
                                },
                                child:Icon(Icons.favorite , color: TeamColor),
                              ),
                            );
                          },
                        separatorBuilder: (context, index)
                        {return Divider(color: Colors.black,);},
                      ),

                    ),
                  ],
                );
              } else if (snapshot.data == null) {
                return Center(
                  child: Text('there is no subscribe yet'),
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              } else {
                return CircularProgressIndicator();
              }
            }),
      ),
    );
  }
}