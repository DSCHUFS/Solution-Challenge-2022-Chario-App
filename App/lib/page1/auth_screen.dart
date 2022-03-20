import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbs;
import 'package:flutter_try/page1/regisinput_screen.dart';
import 'package:flutter_try/page1/welcome_screen.dart';
import 'dart:async';
import '../methods/toast.dart';


class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);
  static const String id = "auth_screen" ;

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>
{

  late StreamSubscription<fbs.User> _subscriptionAuth;
  final _auth =fbs.FirebaseAuth.instance;
  String _message = 'loading...';
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isEmailVerified = false;
  late fbs.User _firebaseUser;

  @override
  void initState()
    {
    isEmailVerified = fbs.FirebaseAuth.instance.currentUser!.emailVerified;
    getinitUser();
    _streamOpen();
    super.initState();
    }

  void getinitUser() async{
    try {
      final user = _auth.currentUser!;
      _firebaseUser = user;
      if (user!= null && !user.emailVerified) {
        await user.sendEmailVerification();
      }

    }catch(e)
    {
      print(e);
    }
  }


  @override
  void dispose() {
    _subscriptionAuth.cancel();
    super.dispose();
  }

  _streamOpen()
  {
    fbs.FirebaseAuth.instance.authStateChanges().listen((fbs.User? user)
    {
          if (user == null) {
            Navigator.pushReplacementNamed(context, WelcomeScreen.id);
            return;
          }
          setState(() => _firebaseUser = user);

          if (!isEmailVerified) {
            setState(() => _message = 'Email is not authenticated yet check your email or Please press it again');
            return;
          }
        }
        );
  }


  Widget _buildReloadButton() {
    return ElevatedButton(
      child: Text('Email Confirmed'),
      onPressed: () async {
        final fu = await fbs.FirebaseAuth.instance.currentUser!;
        await fu.reload();
        if (!fu.emailVerified) {
          toastError(_scaffoldKey, 'Email is not authenticated. please check your mail box');
          return;
        }
        Navigator.pushNamedAndRemoveUntil(context, Regisinput.id, (route) => false);
      },
    );
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Account check')
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  child: Image.asset('assets/Logo.png'),
                  height: 60.0,
                ),
              ),
              Text(_message),
              SizedBox(height: 10,),
              _firebaseUser == null ? CircularProgressIndicator() : _buildReloadButton()
            ],
          ),
        ),
      ),
    );
  }



}