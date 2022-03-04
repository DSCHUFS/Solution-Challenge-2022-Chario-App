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
        // "Authorization" :Authorization,
        "Authorization" :"2",
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





//
// final response = await http.get
// (
// Uri.parse("http://34.134.67.181:8080/api/subscribes"),
// headers: {
// "Accept": "application/json",
// "Access-Control-Allow-Origin": "*"
// }
// );
// String jsonData = response.body;
// print("----------");
// var countofdata = jsonDecode(jsonData)['count'];
// print(countofdata);
// var uname = jsonDecode(jsonData)['data'][0]['user']['u_username'];
// print(uname);
// print(jsonDecode(jsonData)['data'][8]['user']['u_username']);
//
//
// Map <String,dynamic> givedata ={};
// List Subfc_list =[];
// int cnt = 0;
// for(var i = 0  ; i < countofdata ; i++)
// {
// uname = jsonDecode(jsonData)['data'][i]['user']['u_username'] ;
// if (uname == g_name)
// {
// cnt++;
// Map<String, String> mapli = {};
// mapli['f_name'] = jsonDecode(jsonData)['data'][i]['f_name'] as String;
// mapli['f_logo'] = jsonDecode(jsonData)['data'][i]['f_logo'] as String;
// Subfc_list.add(mapli);
// }
// }
//
// print("check---after for loop");
//
// print(Subfc_list.runtimeType);
// givedata['data'] = Subfc_list;
//
// print("this is answ");
// print(givedata);
// print(givedata.runtimeType);
//
// print("this is answ2");
// String datafinal = json.encode(givedata);
// print(datafinal.runtimeType);
// print(datafinal);
// Map <String,dynamic> ourjson = jsonDecode(datafinal);
// print(ourjson);
// print(ourjson.runtimeType);