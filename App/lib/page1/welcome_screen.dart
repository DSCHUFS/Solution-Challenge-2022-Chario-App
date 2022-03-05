import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_try/page1/regisinput_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../api/FirebaseService.dart';
import 'registration_screen.dart';
import 'HomePage.dart';
import '../constants.dart';
import 'package:flutter_try/api/currentUserservice.dart';


class WelcomeScreen extends StatefulWidget {
  static const String id = "welcome_screen";

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final amountInputController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  late String email;
  late String password;

  late bool checkValue;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Container(child: Text("this is drawer")),
      body:
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: [
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('assets/Logo.png'),
                    height: 60.0,
                  ),
                ),
                Text(
                  'handy corn',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              onChanged: (value) {
                email= value;
              },
              decoration: InputDecoration(
                hintText: 'ID:example@gmail.com',
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide( color: TeamColor, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: TeamColor, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
              controller: amountInputController,
            ),
            SizedBox(
              height: 24.0,
            ),
            TextField(
              onChanged: (value) {
              password = value;

              },
              decoration: InputDecoration(
                hintText: 'PW',
                contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: TeamColor, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: TeamColor, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextButton(
              onPressed: (){
              },
              child: Text(
                'Forgot Password?',
                style: TextStyle(color: TeamColor, fontSize: 15),
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: TeamColor,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(

                  onPressed: () async{
                    try{
                    final user = await _auth.signInWithEmailAndPassword(email: email, password: password);
                if(user != null) {
                  print(amountInputController.text);
                  Navigator.pushNamedAndRemoveUntil(context, HomePage.id, (route) => false);
                }
                }catch(e){print(e);}
                  print(amountInputController.text);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Log In',
                  ),
                ),
              ),
            ),

            SignInButton(
              Buttons.Google,
              onPressed: () async {
                try {
                  await FirebaseService().signInwithGoogle();

                  CurrentUser().iscomplieteregis();

                  SharedPreferences pref_user = await SharedPreferences.getInstance();
                  checkValue = pref_user.getBool("login")!;
                  print("11");
                  print(checkValue);
                  print(checkValue.runtimeType);

                  if(checkValue == true)
                  {
                    Navigator.pushNamedAndRemoveUntil(context, HomePage.id, (route) => false);
                  }else // go to addtional sign
                    {
                      print("what");
                      Navigator.pushNamedAndRemoveUntil(context,Regisinput.id, (route) => false);
                    }
                  ////////////////////     shared preference need

                } catch (e) {print(e);}
                  },
            ),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Material(
                color: TeamColor,
                borderRadius: BorderRadius.circular(30.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
                    //Go to registration screen.
                    Navigator.pushNamed(context, RegistrationScreen.id);
                  },
                  minWidth: 200.0,
                  height: 42.0,
                  child: Text(
                    'Register',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

    );
  }
}


