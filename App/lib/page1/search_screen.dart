import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_try/color.dart';
import '../api/Fcapi.dart';
import '../api/SearchApi.dart';
import '../detailPage/FcDetail.dart';
import '../main.dart';
import 'HomePage.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static const String id = "search_screen" ;
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final snackBar = SnackBar(
      content: Text("검색하신 기관을 찾을수없습니다.")
  );
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _filter = TextEditingController();
  Future<FcJdata>? SearchResult;
  FocusNode focusNode = FocusNode();
  String _searchText = "";
  _SearchScreenState(){
    _filter.addListener(() {
      setState(() {
        _searchText = _filter.text;
        SearchResult = fetchSearchdata(_searchText);


      });
    });}
  Widget _buildBody(BuildContext context){
    return FutureBuilder<FcJdata>(
        future: SearchResult,
        builder:(context,snapshot)
        {
          if(!snapshot.hasData){
            return Container(
              child: Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ),
            );
          }
          // if (snapshot.hasData == null) {
          //
          //   _scaffoldKey.currentState?.showSnackBar(snackBar);
          //
          // }
          return Expanded(
           child:
           Column(
             children:[
               Text('찾고 싶은 기부기관명을 검색해보세요!',style: TextStyle(color: mainColor),),
               ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.count,
                  itemBuilder: (context, int index) {
                    return Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          // side: BorderSide(width: 0.5),
                          borderRadius: BorderRadius.circular(30.0),),

                        elevation: 11.0,

                        child: Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 20.0,
                            runSpacing: 20.0, children: [
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Row(
                                  children: [
                                    ClipOval(
                                        clipper: MyClipper(),
                                        child: Image.network(
                                          snapshot.data!.data[index].f_logo,
                                          width: 100,
                                          height: 100,
                                        )),
                                    Text(
                                      snapshot.data!.data[index].f_name,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    NoPoverty(
                                                      fc_id: (snapshot.data!.data[index].f_id).toString(),
                                                    )));
                                      },
                                      icon: Icon(Icons.arrow_forward_ios),


                                    ),
                                  ],
                                ),
                                Container (
                                  child:  ContentHome(fc_id:(snapshot.data!.data[index].f_id).toString()
                                  ),

                                ),
                              ]),

                        ]));
                  }
              ),
            ]
           )

          );
        });
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _scaffoldKey,
      body: Column(
        children: <Widget>[
          Padding(
            padding:EdgeInsets.all(10),

          ),
          Container(
              color: mainColor,
              padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
              child:Row(
                children: <Widget> [
                  Expanded(flex: 6,child:TextField(
                    focusNode: focusNode,
                    style: TextStyle(
                        fontSize: 15
                    ),
                    autofocus: true,
                    controller: _filter,
                    decoration: InputDecoration(
                      filled:true,
                      fillColor: Colors.white12,
                      prefixIcon: Icon(
                        Icons.search,
                        color:Colors.white60,
                        size:20,
                      ),
                      suffixIcon: focusNode.hasFocus
                          ? IconButton(
                        icon: Icon(
                          Icons.cancel,
                          size:20,
                          color: Colors.white,
                        ), onPressed: () { setState(() {
                        _filter.clear();
                        _searchText = "";
                      }); },



                      ) : Container(),
                      hintText: '검색',
                      labelStyle:TextStyle(color:Colors.white),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius : BorderRadius.all(Radius.circular(10)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius : BorderRadius.all(Radius.circular(10)),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius : BorderRadius.all(Radius.circular(10)),
                      ),
                    ),
                  ),

                  ),

                ],
              )
          ), _buildBody(context)
        ],
      ),
    );


  }
}