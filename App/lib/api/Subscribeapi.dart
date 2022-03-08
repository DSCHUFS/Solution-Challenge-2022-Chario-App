import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart' as fbs;

Future <DataList>fetchSubJdata( )async
{
  final _auth =fbs.FirebaseAuth.instance;
  final user = await _auth.currentUser!;
  final String Authorization = user.uid as String;

  final response = await http.get(
      Uri.parse("http://34.134.67.181:8080/api/subscribe/"),
      headers: {
        "Authorization" :Authorization,
        "Content-Type": "application/json",
      }
  );

  print(response.statusCode);

  if (response.statusCode == 200)
  {
    String jsonData = response.body;
    var myJson = jsonDecode(jsonData);

    return DataList.fromJson(myJson);
  } else {
    throw Exception('Failed to load data');
  }
}


class DataList
{
  final int   sub_count;
  final List<Data> sub_list;


  DataList({
    required this.sub_list,
    required this.sub_count
  });

  factory DataList.fromJson(Map<String, dynamic> json)
  {
    var list = json['sub_list'] as List;
     List<Data> dataList = list.map((i) => Data.fromJson(i)).toList();
    return DataList(sub_list: dataList,sub_count:json['sub_count'] );
  }


}


class Data {

  final String f_name;
  final String f_logo;
  final int f_id;

  Data({
    required this.f_name,
    required this.f_logo,
    required this. f_id ,
  });
  factory Data.fromJson(Map<String, dynamic> json)
  {
    return Data(
    f_name: json['f_name'],
    f_logo: json['f_logo'],
      f_id: json['f_id'] ,
    );
  }
}


