import 'package:firebase_auth/firebase_auth.dart' as fbs;

//1 uid

//2 auth

//3 User check true or false if false go registraitio


class CurrentUser
{
final _auth =fbs.FirebaseAuth.instance;
late fbs.User loggedInUser;
late String u_id;

    void getCurrentUser() async
    {
      try {
        final user = await _auth.currentUser!;
        u_id = user.uid as String;
        print(user);
        print(u_id);
        if (user != null) {
          loggedInUser = user;
          print(loggedInUser.email);
        }
      }catch(e)
      {
        print(e);
      }
    }

     iscomplieteregis() async
    {
      return false;  // false 받고 register input 으로 ㄱㄱ
    }

}