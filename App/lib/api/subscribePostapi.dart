import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';

// get one more arguments
postsubs(String Authorization)
async{
  const String apiUrl = "http://34.134.67.181:8080/api/";
  var requestbody = jsonEncode
    ({
    "Authorization" :Authorization,
  });

  final response = await http.post(Uri.parse(apiUrl),
      headers: {
        HttpHeaders.authorizationHeader: Authorization,
        "Content-type": "application/json",
        "Access-Control-Allow-Origin": "*"},
      body:requestbody
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
