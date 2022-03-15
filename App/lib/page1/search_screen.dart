import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_try/api/CategoryfcApi.dart';
import 'package:flutter_try/api/Subscribeapi.dart';
import 'package:flutter_try/color.dart';

import '../api/Fcapi.dart';
import '../api/SearchApi.dart';
import '../detailPage/FcDetail.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static const String id = "search_screen" ;
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _filter = TextEditingController();
  late Future<FcJdata> SearchResult;
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
      if (!snapshot.hasData) {
        return LinearProgressIndicator();
      }
      return Expanded(child: GridView.count(crossAxisCount: 2,
          childAspectRatio: 1 / 1.5,
          padding: EdgeInsets.all(3),
          children: [
          InkWell(
            // child: Image.network(snapshot.data!.data.),
            // onTap: () {
            // Navigator.of(context).push(MaterialPageRoute<Null>(
            //     fullscreenDialog: true,
            //     builder: (BuildContext context) {
            //       return NoPoverty(fc_id: snapshot.data!.data[index].f_id,);
            //     }));
          )
          ])

      );
    });
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          )
        ],
      ),
    );


  }
}