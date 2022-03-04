import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart' as fbs;
import 'package:shared_preferences/shared_preferences.dart';

class CurrentUser {
    final _auth =fbs.FirebaseAuth.instance;
    void iscomplieteregis()
          async {
            SharedPreferences pref_user = await SharedPreferences.getInstance();

            final user = await _auth.currentUser!;
            final String Authorization = user.uid as String;
            final response = await http.get(
                Uri.parse("http://34.134.67.181:8080/api/user/"),
                headers: {
                  "Authorization" : Authorization,
                  "Content-Type": "application/json",
                }
            );

            pref_user.setString('Authorization',Authorization);


            print(response.statusCode);

            if (response.statusCode == 200)
            {
              String jsonData = response.body;
              print(jsonDecode(jsonData));
              pref_user.setBool('login', true);
            }
            else if(response.statusCode == 400)
            {
              print("errorcheck");
               ////  navigate to regis  input page
              pref_user.setBool('login', false);

            }
            else
            {
              pref_user.setBool('login', false);
            }

          }

}