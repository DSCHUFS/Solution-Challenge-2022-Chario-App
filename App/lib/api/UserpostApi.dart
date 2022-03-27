import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart' as fbs;

final _auth =fbs.FirebaseAuth.instance;
Future<UserPostModel?> createUserpost(String u_name,String u_username,String u_phone,String u_birth)
async{
  final user = await _auth.currentUser!;
  final String Authorization = user.uid as String;
  final String u_email = user.email as String;
  const String apiUrl = "http://34.134.67.181:8080/api/user";
  var requestbody = jsonEncode
    ({

    "u_birth": u_birth,
    "u_email":  u_email,
    "u_name": u_name,
    "u_phone":  u_phone,
    "u_username": u_username
    });

  final response = await http.post(Uri.parse(apiUrl),
      headers: {
    HttpHeaders.authorizationHeader:Authorization,
    "Content-type": "application/json",
    "Access-Control-Allow-Origin": "*"}
      ,body: requestbody
  );

  print(response.statusCode);

  if(response.statusCode == 200)
  {
    final String responseString = response.body;
    return  UserPostModelFromJson(responseString) ;
  }
  else
  {
    return null;
  }
}



UserPostModel UserPostModelFromJson(String str) => UserPostModel.fromJson(json.decode(str));
String UserPostModelToJson(UserPostModel data) => json.encode(data.toJson());

class UserPostModel {
  String status;

  UserPostModel({
    required this.status,

  });

  factory UserPostModel.fromJson(Map<String, dynamic> json) => UserPostModel(
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
  };
}
