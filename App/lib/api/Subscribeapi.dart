import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
Future <DataList>fetchSubJdata(var g_name)async
{
  List <String> Subfc_list =[];

  final response = await http.get
    (
      Uri.parse("http://34.134.67.181:8080/api/subscribes"),
      headers: {
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      }
  );
  String jsonData = response.body;

  var countofdata = jsonDecode(jsonData)['count'];
  print(countofdata);
  var uname = jsonDecode(jsonData)['data'][0]['user']['u_username'];
  print(uname);
  print(jsonDecode(jsonData)['data'][8]['user']['u_username']);
  print(g_name);

  int cnt = 0;
  for(var i = 0  ; i < countofdata ; i++)
  {
    uname = jsonDecode(jsonData)['data'][i]['user']['u_username'] ;
    if (uname == g_name)
    {
      cnt++;
      Subfc_list.add(jsonDecode(jsonData)['data'][i]['f_name']);
    }
  }

  print("check---after for loop");
  print(Subfc_list);
  print(Subfc_list.runtimeType);


  print (DataList(listdata: Subfc_list).listdata[1]);
  return DataList(listdata: Subfc_list);

}

class DataList
{

  List<String> listdata;
  DataList({required this.listdata});

}
