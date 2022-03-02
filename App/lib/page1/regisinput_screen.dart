import 'package:flutter/material.dart';
import 'package:flutter_try/constants.dart' as colort;
import 'HomePage.dart';
import 'dmoneyinput_screen.dart';
import '../detailPage/FcDetail.dart';
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


class Regisinput extends StatefulWidget {
  // const Regisinput({Key? key}) : super(key: key);
  static const String id = "regisinput_screen";

  @override
  _RegisinputState createState() => _RegisinputState();
}

class _RegisinputState extends State<Regisinput> {

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
  Widget build(BuildContext context)
  {
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
            child:Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Hero(
                  tag: "logo",
                  child: Container(
                    height: 200.0,
                    child: Image.asset('assets/logo.png'),
                  ),
                ),
                SizedBox(
                  height: 48.0,
                ),TextField(
                  onTap: ()
                  {},
                  decoration: InputDecoration(
                    hintText: 'Enter your Name',
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
                TextFormField(
                  decoration: InputDecoration
                    (
                    hintText: 'Enter your phone',
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


                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    color: TeamColor,
                    borderRadius: BorderRadius.all(Radius.circular(30.0)),
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: () async{
                        try {
                          final newUser = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                          if (newUser !=null)
                            {
                              Navigator.pushNamed(context, HomePage.id);
                            }
                        }catch(e){print(e);}
                        },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'confirm',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),

                SizedBox(
                  height: 24.0,
                ),






                SizedBox(
                  width: double.infinity,
                  height:50,
                  child: ElevatedButton(
                    child:Text('nexttemp'),
                    onPressed: (){Navigator.pushNamed(context, Regisinput.id);},
                  ),
                ),
              ],
            ),

          ),
          ),
        ),
      ),
    );
  }


}
