import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart' as fbs;

class CurrentUser
{
final _auth =fbs.FirebaseAuth.instance;
late fbs.User loggedInUser;
late String Authorization;
late String u_email;

@override
void initState()
{
  getUserid(Authorization,_auth,loggedInUser,u_email);
}


  getUserid(Authorization,_auth,loggedInUser,u_email) async {
  try {
    final user = await _auth.currentUser!;
    Authorization = user.uid as String;
    print(user);
    print(Authorization);
    if (user != null) {
      loggedInUser = user;
      print(loggedInUser.email);
      u_email = loggedInUser.email as String;
    }
  } catch (e) {
    print(e);
  }
}




  iscomplieteregis()
      async {
        final response = await http.get(
            Uri.parse("http://34.134.67.181:8080/api/user/"),
            headers: {
              "Authorization" : Authorization,
              "Content-Type": "application/json",
            }
        );

        print(response.statusCode);

        if (response.statusCode == 200)
        {
          String jsonData = response.body;
          print(jsonDecode(jsonData));
          return true;
        }
        else if(response.statusCode == 404)
        {
           ////  navigate to regis  input page
          return false;

        }
        else
        {
          throw Exception('Failed to load data');
          return false;
        }

        //return false;  // false 받고 register input 으로 ㄱㄱ
      }

}