import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbs;
import 'package:flutter_try/page1/regisinput_screen.dart';
import '../api/FirebaseService.dart';
import '../constants.dart';
import '../methods/validators.dart';
import '../methods/toast.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'auth_screen.dart';


class RegistrationScreen extends StatefulWidget
{
  static const String id = "registration_screen" ;

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen>
{

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late String email;
  late String name;
  late String password;
  late String confirmpassword;


  TextEditingController emailInputController = TextEditingController();
  TextEditingController passwordInputController = TextEditingController();
  TextEditingController confirmPasswordInputController = TextEditingController();


  final _auth = fbs.FirebaseAuth.instance;

  bool _loading = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  initState() {
    super.initState();
  }

  Widget _loadingWidget () {
    return Center(
      child: CircularProgressIndicator(),
    );
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body:
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: _loading ? _loadingWidget() :
        SingleChildScrollView(
          child:Form(
              key: _formKey,

          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 120.0,
            ),
            Hero(
              tag: "logo",
              child: Container(
                height: 200.0,
                child: Image.asset('assets/Logo.png'),
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            SizedBox(
              height: 8.0,
            ),
            TextFormField(
              decoration: InputDecoration
                (
                hintText: 'Enter your email',
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

              onChanged: (value) {
                email = value;
                // need to check double email ifwhen made a user in same email
              },
              controller: emailInputController,
              keyboardType: TextInputType.emailAddress,
              validator:(email) {
                if (emailValidator(email!) == null)
                  return null;
                else
                  return 'Enter a valid email address';
              },


            ),
            SizedBox(
              height: 8.0,
            ),

            TextFormField(
              onChanged: (value) {
                password = value ;
              },
              decoration: InputDecoration(
                hintText: 'Enter your password', //least 6 digitnum
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
              controller: passwordInputController,
              obscureText: true,
              validator: (password){
                if (passwordValidator != null) return null;
                else
                  return '';
              },

            ),
            SizedBox(
              height: 24.0,
            ),
            TextFormField(
              onChanged: (value) {
                confirmpassword = value ;
              },
              decoration: InputDecoration(
                hintText: ''
                    'Pw again',
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
              controller: confirmPasswordInputController,
              obscureText: true,
              validator: (confirmpassword){
                if (passwordValidator!= null) return null;
                else
                  return 'Enter a valid password';
              },

            ),

            SizedBox(
              height: 24.0,
            ),

            SignInButtonBuilder
              (
              text: 'Sign up with Email',
              icon: Icons.email,
              backgroundColor: Colors.black12,
              onPressed: () async {
                if (!_formKey.currentState!.validate()) return;
                if (passwordInputController.text != confirmPasswordInputController.text) {
                  toastError(_scaffoldKey, PlatformException(code: 'signup', message: 'Please check your password again.'));
                  return;
                }
                try {
                  setState(() => _loading = true);
                  final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: confirmpassword);
                  //input name in firebase
                  if (newUser !=null) {
                    Navigator.pushNamedAndRemoveUntil(context, AuthPage.id, (route) => false);}}
                catch (e)
                {
                  toastError(_scaffoldKey, e);
                  print(e);
                } finally {
                  if (mounted) setState(() => _loading = false);
                }
              },
            ),

            SizedBox(
              height: 12.0,
            ),

            Text('or', textAlign: TextAlign.center,),
            SizedBox(
              height: 12.0,
            ),
            SignInButton(
              Buttons.Google,
              onPressed: () async {
                try {
                  setState(() => _loading = true);
                  await FirebaseService().signInwithGoogle();
                 Navigator.pushNamedAndRemoveUntil(context, Regisinput.id, (route) => false);
                } catch (e) {
                  toastError(_scaffoldKey, e);
                } finally {
                  setState(() => _loading = false);
                }
              },
            ),

          ],
        ),


          ),
        ),
      ),
    );
  }







}
