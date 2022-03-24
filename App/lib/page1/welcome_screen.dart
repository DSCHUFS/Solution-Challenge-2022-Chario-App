import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:flutter_try/color.dart';
import 'package:flutter_try/page1/regisinput_screen.dart';

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

  //// scaffold key for snack bar
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final snackBar = SnackBar(content: Text("There is no login info please sign up to start"));
  late String email;
  late String password;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset : false,
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      drawer: Container(child: Text("this is drawer")),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Hero(
              tag: 'logo',
              child: Container(
                  child: Row(children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: Container(
                        child: Image.asset('assets/logo_char.png'),
                      ),
                    ),
                    Flexible(
                      flex: 2,
                      child: Container(child: Image.asset('assets/logo_word.png')),
                    ),
                  ])),
            ),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              onChanged: (value) {
                email = value;
              },
              decoration: InputDecoration(
                hintText: 'ID:example@gmail.com',
                contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: mainColor, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: mainColor, width: 2.0),
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
                  borderSide: BorderSide(color: mainColor, width: 1.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: mainColor, width: 2.0),
                  borderRadius: BorderRadius.all(Radius.circular(32.0)),
                ),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                'Forgot Password?',
                style: TextStyle(color: mainColor, fontSize: 15),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                elevation: 5.0,
                color: mainColor,
                borderRadius: BorderRadius.circular(30.0),
                child: MaterialButton(
                  onPressed: () async {
                    try {
                      final user = await _auth.signInWithEmailAndPassword(
                          email: email, password: password);
                      if (user != null) {
                        print(amountInputController.text);
                        CurrentUser cucheck = CurrentUser();
                        await cucheck.iscomplieteregis();
                        if (cucheck.checkvalide == true) {
                          print("there is account");
                          Navigator.pushNamedAndRemoveUntil(
                              context, HomePage.id, (route) => false);
                        } else // go to addtional sign
                            {
                          print("no account");
                          Navigator.pushNamedAndRemoveUntil(
                              context, Regisinput.id, (route) => false);
                        }
                      }
                    } catch (e) {
                      print("this is after auth");
                      _scaffoldKey.currentState?.showSnackBar(snackBar);
                      print(e);
                    }
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
                await FirebaseService().signInwithGoogle();
                CurrentUser cucheck = CurrentUser();
                await cucheck.iscomplieteregis();
                if (cucheck.checkvalide == true) {
                  print("there is account");
                  Navigator.pushNamedAndRemoveUntil(
                      context, HomePage.id, (route) => false);
                } else // go to addtional sign
                    {
                  print("no account");
                  Navigator.pushNamedAndRemoveUntil(
                      context, Regisinput.id, (route) => false);
                }
              },
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Material(
                color: mainColor,
                borderRadius: BorderRadius.circular(30.0),
                elevation: 5.0,
                child: MaterialButton(
                  onPressed: () {
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