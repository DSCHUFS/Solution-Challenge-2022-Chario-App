import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_try/api/CategoryfcApi.dart';
import 'package:flutter_try/api/Subscribeapi.dart';
import 'package:flutter_try/color.dart';

import '../detailPage/FcDetail.dart';


class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static const String id = "search_screen" ;
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _filter = TextEditingController();
  FocusNode focusNode = FocusNode();
  String _searchText = "";
  _SearchScreenState(){
    _filter.addListener(() {
      setState(() {
        _searchText = _filter.text;
      });
    });}
    // Widget _buildBody(BuildContext context){
    //   return StreamBuilder<QuerySnapshot>(
    //     stream: Firestore.instance.collection('movie').snapshots(),
    //     builder:(context,snapshot){
    //       if(!snapshot.hasData) return LinearProgressIndicator();
    //       return _buildList(context,snapshot.data?.documents);
    //     }
    //   );
    // }
    // Widget _buildList(BuildContext context, List<DocumentSnapshot> snapshot){
    //   List<DocumentSnapshot> searchResults = [];
    //   for(DocumentSnapshot d in snpashot){
    //     if(d.data.toString().contains(_searchText)){
    //       searchResults.add(d);
    //     }
    //   }
    //   return Expanded(child:GridView.count(
    //     crossAxisCount: 3,
    //     childAspectRatio:1/1.5,
    //     padding: EdgeInsets.all(3),
    //     children: searchResults.map((data)=>_buildListItem(context,data)),
    //   ),
    //   );
  // }
  // Widget _buildListItem(BuildContext context, DocumentSnapshot data){
  //     final movie = Data.fromSnapshot(data);
  //     return InkWell(
  //       child: Image.network(movie.fLogo),
  //       onTap: (){
  //         Navigator.of(context).push(MaterialPageRoute<Null>(
  //             fullscreenDialog: true,
  //             builder: BuildContext context){
  //           return NoPoverty(fc_id:'1');
  //         }
  //         })
  //       },
  //     )
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
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
                  // focusNode.hasFocus ? Expanded(child:FlatButton(onPressed: () {  setState(() {
                  //   _filter.clear();
                  //   _searchText = "";
                  //   focusNode.unfocus();
                  // });},
                  //   child: Text('취소', style: TextStyle(fontSize: 12),),),):Expanded(flex: 0, child: Container(),)
                ],
              )
          )
        ],
      ),
    );


  }
}