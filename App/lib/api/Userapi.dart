import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<UserJdata> fetchUserJdata() async {
  final response = await http.get(
      Uri.parse("http://34.134.67.181:8080/api/users/1"),
      headers: {
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      }
  );
  print(response.statusCode);

  if (response.statusCode == 200)
  {
    String jsonData = response.body;
    // var myJson = jsonDecode(jsonData)['data']['u_username'];
    // print(myJson);
    return UserJdata.fromJson(jsonDecode(jsonData));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load data');
  }
}


class UserJdata {
  final String u_username;
  final String u_name;
  final String u_email;
  final String u_phone;
  final int u_birth;


  UserJdata(this.u_username,this.u_name, this.u_email,this.u_phone,this.u_birth);

  UserJdata.fromJson(Map<String, dynamic> json)
      : u_username  = json['u_username'],
        u_name = json['u_name'],
        u_email = json['u_email'],
        u_phone = json['u_phone'],
        u_birth = json['u_birth'];

  Map<String, dynamic> toJson() =>
      {
        'u_username': u_username,
        'u_name': u_name,
        'u_email': u_email,
        'u_phone': u_phone,
        'u_birth': u_birth,
      };
}




