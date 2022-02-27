import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;



Future<Data> fetchUserJdata() async {
  final response = await http.get(
      Uri.parse("http://34.134.67.181:8080/api/user/"),
      headers: {
        "Authorization" :"1",
        "Content-Type": "application/json",
      }
  );

  print(response.statusCode);

  if (response.statusCode == 200)
  {
    String jsonData = response.body;

    var myJson = jsonDecode(jsonData);

    print(myJson.runtimeType);
    print(myJson);
    print(myJson['data']);

    //return myJson;

    return Data.fromJson(myJson);
  } else {
    throw Exception('Failed to load data');
  }
}

class Data {
  final String u_Username;
  final String u_Name;
  final String u_Email;
  final String u_Phone;
  final String u_Birth;
  Data({required this.u_Username,required this.u_Name, required this.u_Email,required this.u_Phone,required this.u_Birth});
  factory Data.fromJson(Map<String, dynamic> json)
  {
    return Data(
        u_Username: json["u_username"],
        u_Name: json["u_name"],
        u_Email: json["u_email"],
        u_Phone: json["u_phone"],
        u_Birth: json["u_birth"]
    );
  }
}




