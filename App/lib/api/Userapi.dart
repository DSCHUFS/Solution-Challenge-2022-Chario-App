import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;



Future<UserJdata> fetchUserJdata() async {
  final response = await http.get(
      Uri.parse("http://34.134.67.181:8080/api/users/"+"1"),
      headers: {
        "Accept": "application/json",
        "Access-Control-Allow-Origin": "*"
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

    return UserJdata.fromJson(myJson);
  } else {
    throw Exception('Failed to load data');
  }
}




class UserJdata
{


  Data datag;

  UserJdata({
    required this.datag
  });

  factory UserJdata.fromJson(Map<String, dynamic> json)
  {
    return UserJdata(
        datag: Data.fromJson(json['data'])
    );

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




