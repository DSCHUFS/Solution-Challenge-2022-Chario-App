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
  print(Subfc_list);
  print(Subfc_list.runtimeType);

  var jdata = jsonEncode(Subfc_list);

  print(jdata.runtimeType);

  //Subfc_list   encode to json



  return DataList.fromJson(jdata);
}

class DataList
{

  final String f_name;
  final String f_logo;

  // List<String> listdata;

  DataList({required this.f_name,required this.f_logo});

  factory DataList.fromJson(Map<String, dynamic> give)
  {
    return DataList(
        f_name: give["f_name"],
        f_logo: give['f_logo']);
  }

}
