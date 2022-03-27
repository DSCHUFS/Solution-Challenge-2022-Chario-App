import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart' as fbs;

class donpost
{
        var resultc =false;

        createDonation(String date, int price,String f_name)
        async
        {
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


        if(response.statusCode == 200)
        {
            print("this is true");
           resultc = true;
           print(resultc);
           return ;
        }
        else
        {
          resultc = false;
          return ;
        }
      }
}