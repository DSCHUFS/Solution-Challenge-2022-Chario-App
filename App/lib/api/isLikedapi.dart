import 'dart:convert';

import 'package:http/http.dart' as http;
import 'dart:io';
import '../isLike_User.dart';


Future<UserModel?> createUser(int count, String status) async{

  const String apiUrl = "http://34.134.67.181:8080/api/subscribe/3";
  var responsebody = jsonEncode({"count": count , "status": status});
  final response = await http.post(Uri.parse(apiUrl),headers: {HttpHeaders.authorizationHeader: '1'},
    body: responsebody
  );

  print(response.statusCode);

  if(response.statusCode == 200){
    final String responseString = response.body;
    return userModelFromJson(responseString);
  }else{
    return null;
  }
}
Future<UserModel?> deleteUser(int count, String status) async{

  const String apiUrl = "http://34.134.67.181:8080/api/subscribe/3";
  var responsebody = jsonEncode({"count": count as int, "status": status});
  final response = await http.delete(Uri.parse(apiUrl),headers: {HttpHeaders.authorizationHeader: '1'},
    body: responsebody
  );

  print(response.statusCode);

  if(response.statusCode == 200){
    final String responseString = response.body;
    return userModelFromJson(responseString);
  }else{
    return null;
  }
}
