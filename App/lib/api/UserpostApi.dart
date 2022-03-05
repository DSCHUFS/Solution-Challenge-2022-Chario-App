import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';


createUserpost(String Authorization ,String u_birth, String u_email,String u_name,String u_phone,String u_username)
async{
  const String apiUrl = "http://34.134.67.181:8080/api/user";
  var requestbody = jsonEncode
    ({
    "Authorization" :Authorization,
    "u_birth": u_birth,
    "u_email":  u_email,
    "u_name": u_name,
    "u_phone":  u_phone,
    "u_username": u_username
    });

  final response = await http.post(Uri.parse(apiUrl),headers: {
    HttpHeaders.authorizationHeader: u_username
    ,"Content-type": "application/json",
    "Access-Control-Allow-Origin": "*"}
      ,body:
      requestbody
  );

  print(response.statusCode);

  if(response.statusCode == 200)
  {
    final String responseString = response.body;
    return true ;
  }
  else
  {
    return null;
  }
}
