import 'dart:convert';
import 'package:http/http.dart' as http;
import 'Fcapi.dart';

Future<Searchdata> fetchSearchdata(String search) async
{
  final response = await http.get(
      Uri.parse("http://34.134.67.181:8080/api/search?facName="+search),
      headers: {
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      }
  );
  print("searchapi는 ${response.body}");
  print("searchapi는 ${response.statusCode}");

  if (response.statusCode == 200)
  {

    String jsonData = response.body;
    print(jsonData.runtimeType);
    print('나왔다 searchapi는 ${Searchdata.fromJson(jsonDecode(jsonData))}');

    return Searchdata.fromJson(jsonDecode(jsonData));
  } else
  {
    throw Exception('Failed to load data');
  }
}

class Searchdata {
  final int count;

  final List<F_data> data;

  const Searchdata({
    // required this.u_username,
    required this.count,
    required this.data,
  });

  factory Searchdata.fromJson(Map<String, dynamic> json)
  {
    var list = json['data'] as List;
    List<F_data> dataList = list.map((i) => F_data.fromJson(i)).toList();

    return Searchdata(count: json['count'], data: dataList);
  }
}


class F_data {
  final int f_id;
  final String f_name;
  final String f_intro;
  final int f_minimal;
  final String f_home;
  final String f_ars;
  final String f_phone;
  final String f_pay;
  final String f_logo;

  F_data({
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

  factory F_data.fromJson(Map<String, dynamic> json)
  {
    return F_data(
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
