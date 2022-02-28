import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbs;
import 'dart:async';
import '../methods/toast.dart';
import 'HomePage.dart';

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
            Navigator.pushReplacementNamed(context, '/signin');
            return;
          }
          setState(() => _firebaseUser = user);

          if (!isEmailVerified) {
            setState(() => _message = 'Email is not authenticated yet check your email.');
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
          toastError(_scaffoldKey, 'Email is not authenticated. please try again');
          return;
        }
        Navigator.pushReplacementNamed(context,HomePage.id , arguments: fu);
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