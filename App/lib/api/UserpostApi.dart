import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';


Future<Welcome?> createUserpost(String u_birth, String u_email,String u_name,String u_phone,String u_username) async{
  const String apiUrl = "http://34.134.67.181:8080/api/user";
  var requestbody = jsonEncode
    ({
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

  if(response.statusCode == 200){
    final String responseString = response.body;
    return welcomeFromJson(responseString);
  }else{
    return null;
  }
}

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.donationDate,
    required this.donationPrice,
    required this.fName,
  });

  String donationDate;
  int donationPrice;
  String fName;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    donationDate: json["donationDate"],
    donationPrice: json["donationPrice"],
    fName: json["f_name"],
  );

  Map<String, dynamic> toJson() => {
    "donationDate": donationDate,
    "donationPrice": donationPrice,
    "f_name": fName,
  };
}