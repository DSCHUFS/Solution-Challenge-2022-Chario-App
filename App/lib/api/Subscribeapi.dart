import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future <DataList>fetchSubJdata(var g_name)async {

  final response = await http.get
    (
      Uri.parse("http://34.134.67.181:8080/api/subscribes"),
      headers: {
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      }
  );
  String jsonData = response.body;
  print("----------");
  var countofdata = jsonDecode(jsonData)['count'];
  print(countofdata);
  var uname = jsonDecode(jsonData)['data'][0]['user']['u_username'];
  print(uname);
  print(jsonDecode(jsonData)['data'][8]['user']['u_username']);



  Map <String,dynamic> givedata ={};
  List Subfc_list =[];
  int cnt = 0;
  for(var i = 0  ; i < countofdata ; i++)
  {
    uname = jsonDecode(jsonData)['data'][i]['user']['u_username'] ;
    if (uname == g_name)
    {
      cnt++;
      Map<String, String> mapli = {};
      mapli['f_name'] = jsonDecode(jsonData)['data'][i]['f_name'] as String;
      mapli['f_logo'] = jsonDecode(jsonData)['data'][i]['f_logo'] as String;
      Subfc_list.add(mapli);
    }
  }

  print("check---after for loop");

  print(Subfc_list.runtimeType);
  givedata['data'] = Subfc_list;

  print("this is answ");
  print(givedata);
  print(givedata.runtimeType);

  print("this is answ2");
  String datafinal = json.encode(givedata);
  print(datafinal.runtimeType);
  print(datafinal);
  Map <String,dynamic> ourjson = jsonDecode(datafinal);
  print(ourjson);
  print(ourjson.runtimeType);

  return DataList.fromJson(ourjson);
}


class DataList
{

  final List<Data> datag;

  DataList({required this.datag});

  factory DataList.fromJson(Map<String, dynamic> json)
  {
    var list = json['data'] as List;
    List<Data> dataList = list.map((i) => Data.fromJson(i)).toList();
    return DataList(datag: dataList);
  }

}


class Data {

  final String f_name;
  final String f_logo;
  Data({
    required this.f_name,
    required this.f_logo,
  });
  factory Data.fromJson(Map<String, dynamic> json)
  {
    return Data(
        f_name: json['f_name'],
        f_logo: json['f_logo']
    );
  }
}