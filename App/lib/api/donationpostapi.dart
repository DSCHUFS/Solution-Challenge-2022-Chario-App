import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart' as fbs;


Future<Welcome?> createDonation(String date, int price,String f_name) async{
  final _auth =fbs.FirebaseAuth.instance;
  final user = await _auth.currentUser!;
  final String Authorization = user.uid as String;



  const String apiUrl = "http://34.134.67.181:8080/api/donation";
  var resquestbody = jsonEncode({
    "donationDate": date,
    "donationPrice": price,
    "f_name": f_name
  });

  final response = await http.post(Uri.parse(apiUrl),headers:
      {
      "Authorization" :Authorization,
      "Content-type": "application/json",
      "Access-Control-Allow-Origin": "*"
      }
  ,body: resquestbody

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

  });

  String donationDate;
  int donationPrice;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    donationDate: json["donationDate"],
    donationPrice: json["donationPrice"],

  );

  Map<String, dynamic> toJson() => {
    "donationDate": donationDate,
    "donationPrice": donationPrice,

  };
}