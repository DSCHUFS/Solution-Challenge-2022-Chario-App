import 'package:http/http.dart' as http;
import 'package:firebase_auth/firebase_auth.dart' as fbs;

class CurrentUser {
    final _auth =fbs.FirebaseAuth.instance;

    bool checkvalide = false;

    iscomplieteregis()
          async {
            final user = await _auth.currentUser!;
            final String Authorization = user.uid as String;
            final response = await http.get(
                Uri.parse("http://34.134.67.181:8080/api/user/"),
                headers: {
                  "Authorization" : Authorization,
                  "Content-Type": "application/json",
                }
            );

            print("this is  response code ");
            print(response.statusCode);
            if (response.statusCode == 200)
            {
              checkvalide = true;
              print("thisi is check val:");
              print(checkvalide);
              return ;

            }
            else if(response.statusCode == 500)
            {
              print("no account in spring server");
              checkvalide = false;
              return ;
            }
            else {
              print('servererror');
              checkvalide = false;
              return ;
            }
          }



}