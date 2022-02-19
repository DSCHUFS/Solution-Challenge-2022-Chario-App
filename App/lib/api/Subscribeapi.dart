import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<SubJdata> fetchSubJdata() async {
  final response = await http.get(
      Uri.parse("http://34.134.67.181:8080/api/subscribes"),
      headers: {
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      }
  );
  print(response.statusCode);

  if (response.statusCode == 200)
  {
    String jsonData = response.body;
    var myJson = jsonDecode(jsonData)['data'][0]['f_name'];
    print(myJson);
    return SubJdata.fromJson(jsonDecode(jsonData));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load data');
  }
}

class SubJdata {
  final int count;
  final List<Data> data;
  const SubJdata({
    // required this.u_username,
    required this.count,
    required this.data,
  });

  factory SubJdata.fromJson(Map<String, dynamic> json)
  {
    var list = json['data'] as List;
    List<Data> dataList = list.map((i) => Data.fromJson(i)).toList();

    return SubJdata(count: json['count'], data: dataList);
  }



}



class Data {
  final String f_name;
  final String f_intro;
  final int f_minimal;
  final String f_home;
  final String f_ars;
  final String f_phone;
  final String f_pay;
  final String f_logo;

  Data({
    required this.f_name,
    required this.f_intro,
    required this.f_minimal,
    required this.f_home,
    required this.f_ars,
    required this.f_phone,
    required this.f_pay,
    required this.f_logo,
  });

  factory Data.fromJson(Map<String, dynamic> json)
  {
    return Data(
        f_name: json['f_name'],
        f_intro: json['f_intro'],
        f_minimal: json['f_minimal'],
        f_home: json['f_home'],
        f_ars: json['f_ars'],
        f_phone: json['f_phone'],
        f_pay: json['f_pay'],
        f_logo: json['f_logo']);

  }
}



