import 'package:http/http.dart' as http;
import 'dart:io';
import '../isLike_User.dart';


Future<UserModel?> createUser(String fc_id) async{

  // const String apiUrl = Uri.parse("http://34.134.67.181:8080/api/subscribe/" + fc_id);
  // var responsebody = jsonEncode({"count": count , "status": status});
  final response = await http.post(Uri.parse("http://34.134.67.181:8080/api/subscribe/" + fc_id),headers: {HttpHeaders.authorizationHeader: '1'},

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

  final response = await http.delete(Uri.parse("http://34.134.67.181:8080/api/subscribe/" + fc_id),headers: {HttpHeaders.authorizationHeader: '1'},

  );

  print(response.statusCode);

  if(response.statusCode == 200){
    final String responseString = response.body;
    return userModelFromJson(responseString);
  }else{
    return null;
  }
}