import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'package:flutter_try/page1/dmoneyinput_screen.dart';

Future<Welcome?> createUser(String date, int price,String f_name) async{
  const String apiUrl = "http://34.134.67.181:8080/api/donation";
  var responsebody = jsonEncode({
    "donationDate": date,
    "donationPrice": price,
    "f_name": f_name
  });

  final response = await http.post(Uri.parse(apiUrl),headers: {
    HttpHeaders.authorizationHeader: '1'
    // ,"Accept": "application/json",
    //   "Access-Control-Allow-Origin": "*"}
  }
      ,body:
      responsebody
  );

  print(response.statusCode);

  if(response.statusCode == 200){
    final String responseString = response.body;
    return welcomeFromJson(responseString);
  }else{
    return null;
  }
}


// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);



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
