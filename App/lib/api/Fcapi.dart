import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<FcJdata> fetchFcJdata() async
{
  final response = await http.get(
      Uri.parse("http://34.134.67.181:8080/api/facilities/"),
      headers: {
      "Accept": "application/json",
      "Access-Control-Allow-Origin": "*"
      }
      );
  if (response.statusCode == 200)
  {

    String jsonData = response.body;
    return FcJdata.fromJson(jsonDecode(jsonData));
  } else
  {
    throw Exception('Failed to load data');
  }
}

class FcJdata {
  final int count;

  final List<Data> data;

  const FcJdata({

    required this.count,
    required this.data,
  });

  factory FcJdata.fromJson(Map<String, dynamic> json)
  {
    var list = json['data'] as List;
    List<Data> dataList = list.map((i) => Data.fromJson(i)).toList();

    return FcJdata(count: json['count'], data: dataList);
  }
}


class Data {
  final int f_id;
  final String f_name;
  final String f_intro;
  final int f_minimal;
  final String f_home;
  final String f_ars;
  final String f_phone;
  final String f_pay;
  final String f_logo;

  Data({
    required this.f_id,
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
        f_id: json['f_id'],
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



