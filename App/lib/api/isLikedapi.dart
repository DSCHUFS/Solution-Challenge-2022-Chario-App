import 'package:http/http.dart' as http;
import 'dart:io';
import '../isLike_User.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbs;

Future<UserModel?> createUser(String fc_id) async
{
  final _auth =fbs.FirebaseAuth.instance;
  final user = await _auth.currentUser!;
  final String Authorization = user.uid as String;


  final response = await http.post(Uri.parse("http://34.134.67.181:8080/api/subscribe/" + fc_id),
    headers: {HttpHeaders.authorizationHeader: Authorization},
  );

  print(response.statusCode);

  if(response.statusCode == 200){
    final String responseString = response.body;
    return userModelFromJson(responseString);
  }else{
    return null;
  }
}

Future<UserModel?> deleteUser(String fc_id) async
{

  final _auth =fbs.FirebaseAuth.instance;
  final user = await _auth.currentUser!;
  final String Authorization = user.uid as String;

  final response = await http.delete(Uri.parse("http://34.134.67.181:8080/api/subscribe/" + fc_id),
    headers: {HttpHeaders.authorizationHeader: Authorization},

  );

  print(response.statusCode);

  if(response.statusCode == 200){
    final String responseString = response.body;
    return userModelFromJson(responseString);
  }else{
    return null;
  }
}
