import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future <ContentList>fetchContJdata(var g_name,var fcId)async {

  final response = await http.get
    (
      Uri.parse("https://1e85ce8f-6ffc-402d-9365-0576000728de.mock.pstmn.io/api/facility/"+fcId),
      headers: {
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      }
  );
  String jsonData_c = response.body;
  var countofcontent = jsonDecode(jsonData_c)['contentsList'];

  var uname = jsonDecode(jsonData_c)['facDto']['user']['u_username'];


  Map <String,dynamic> giveContent ={};
  List Confc_list =[];
  int num = 0;
  for(var i = 0  ; i < countofcontent ; i++)
  {
    num++;
    Map<String, String> contli = {};
    contli['c_title'] = jsonDecode(jsonData_c)['facDto']['c_title'] as String;
    contli['c_contents'] = jsonDecode(jsonData_c)['facDto']['c_contents'] as String;
    contli['c_image'] = jsonDecode(jsonData_c)['facDto']['c_image'] as String;
    contli['c_url'] = jsonDecode(jsonData_c)['facDto']['c_url'] as String;
    contli['c_pub_date'] = jsonDecode(jsonData_c)['facDto']['c_pub_date'] as String;

    Confc_list.add(contli);

  }

  print("check---after for loop");

  print(Confc_list.runtimeType);
  giveContent['facDto'] = Confc_list;

  print("this is answ");
  print(giveContent);
  print(giveContent.runtimeType);

  print("this is answ2");
  String contFinal = json.encode(giveContent);
  print(contFinal.runtimeType);
  print(contFinal);
  Map <String,dynamic> contJson = jsonDecode(contFinal);
  print(contJson);
  print(contJson.runtimeType);

  return ContentList.fromJson(contJson);
}


class ContentList
{

  final List<Content> contentg;


  ContentList({required this.contentg});

  factory ContentList.fromJson(Map<String, dynamic> json)
  {
    var list = json['contentsList'] as List;
    List<Content> contentList = list.map((i) => Content.fromJson(i)).toList();
    return ContentList(contentg: contentList);
  }


}


class Content {

  final String f_name;
  final String f_logo;
  Content({
    required this.f_name,
    required this.f_logo,

  });
  factory Content.fromJson(Map<String, dynamic> json)
  {
    return Content(
        f_name: json['f_name'],
        f_logo: json['f_logo']
    );
  }
}
