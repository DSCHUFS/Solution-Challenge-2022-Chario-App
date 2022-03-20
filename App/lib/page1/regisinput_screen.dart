import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../methods/toast.dart';


import 'package:flutter_try/page1/regissub_screen.dart';
import 'package:flutter/services.dart';
import '../constants.dart';
import '../methods/validators.dart';
import 'package:flutter_try/api/UserpostApi.dart';
import 'package:intl/intl.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class Regisinput extends StatefulWidget {
  static const String id = "regisinpudt_screen";

  @override
  _RegisinputState createState() => _RegisinputState();
}

class _RegisinputState extends State<Regisinput> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String name;
  late String username;
  late String phone;

  // final String u_email = CurrentUser().u_email as String;
  // final String u_token = CurrentUser().Authorization as String;



  TextEditingController nameInputController = TextEditingController();
  TextEditingController usernameInputController = TextEditingController();
  TextEditingController phoneInputController = TextEditingController();
  var maskFormatter = MaskTextInputFormatter(mask: '###-####-####',filter: { "#": RegExp(r'[0-9]') });

  bool _loading = false;
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool isDateSelected= false;
  String birth = "2022-03-04";

  DateTime _dateTime = DateTime.now();


  final snackBar = SnackBar(
      content: Text("Thanks for join us")
  );

  @override
  initState() {
    super.initState();
  }

  Widget buildDatePicker() => SizedBox(
        height: 120,
        child: CupertinoDatePicker
          (
          minimumYear: 1500,
          maximumYear: 2200,
          mode: CupertinoDatePickerMode.date,
          initialDateTime: _dateTime,
          onDateTimeChanged: (dateTime) =>
              setState(() => this._dateTime = dateTime
              ),
        ),
      );

  static void showSheet(
    BuildContext context, {
    required Widget child,
    required VoidCallback onPressed,
  }) =>
      showCupertinoModalPopup(
        context: context,
        builder: (context) => CupertinoActionSheet(
          actions: [
            child,
          ],
          cancelButton: CupertinoActionSheetAction(
            child: Text('Done'),
            onPressed: onPressed,
          ),
        ),
      );

  Widget _loadingWidget() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: _loading
            ? _loadingWidget()
            : SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Center(
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
                          height: 52.0,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter your Name',
                            contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(32.0)),),
                            enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: TeamColor, width: 1.0),
                              borderRadius: BorderRadius.all(Radius.circular(32.0)),),
                            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: TeamColor, width: 2.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32.0)),
                            ),
                          ),
                          onChanged: (value) {
                            name = value;
                            // need to check double email ifwhen made a user in same email
                          },
                          controller: nameInputController,
                          keyboardType: TextInputType.name,
                          validator: (name) {
                            if (nameValidator(name!) == null)
                              return null;
                            else
                              return 'Enter a valid name in just english or korean';
                          },
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter your UserName',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: TeamColor, width: 1.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: TeamColor, width: 2.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32.0)),
                            ),
                          ),
                          onChanged: (value) {
                            username = value;
                          },
                          controller: usernameInputController,
                          keyboardType: TextInputType.text,
                          validator: (username) {
                            if (usernameValidator(username!) == null)
                              return null;
                            else
                              return 'Enter a valid  username';
                          },
                        ),
                        SizedBox(
                          height: 8.0,
                        ),

                        ///////    핸드폰 입력 이후   키보드 done and display - auto
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter your phone',
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 20.0),
                            border: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: TeamColor, width: 1.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32.0)),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: TeamColor, width: 2.0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(32.0)),
                            ),
                          ),
                          onChanged: (value) {
                            phone = value;
                            // need to check double email ifwhen made a user in same email
                          },
                          controller: phoneInputController,
                          keyboardType: TextInputType.numberWithOptions(signed: true,decimal: true),
                          inputFormatters: [maskFormatter],
                          validator: (phone) {
                            if (phoneValidator(phone!) == null)
                              return null;
                            else
                              return 'Enter a valid  phone';
                          },
                        ),
                        SizedBox(height: 24),


                        ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: TeamColor,
                                onPrimary: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32.0),
                                ),
                              ),
                              onPressed: () => showSheet(
                                context,
                                child: buildDatePicker(),
                                onPressed: () {
                                 final valueb = DateFormat('yyyy-MM-dd').format(_dateTime);

                                  if(valueb!=null && valueb!=birth)
                                  {
                                  setState(()      // for syn
                                  {
                                  isDateSelected=true;
                                    birth = valueb; // 08/14/2019
                                });
                                }
                                 print(valueb.runtimeType);
                                 birth=valueb;
                                 print(birth.runtimeType);
                                 Navigator.pop(context);
                                },
                              ),
                              child: Text(
                                'birthday : $birth ',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),

                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: Material(
                            color: TeamColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0)),
                            elevation: 5.0,
                            child: MaterialButton(
                              onPressed: () async {
                                if (!_formKey.currentState!.validate()) return;
                                try {
                                  setState(() => _loading = true);
                                  createUserpost(name,username,phone,birth);
                                  //_scaffoldKey.currentState?.showSnackBar(snackBar);
                                  Navigator.pushNamedAndRemoveUntil(context,Regissub.id, (route) => false);

                                } catch (e) {
                                  toastError(_scaffoldKey, e);
                                  print(e);
                                }
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
                          height: 50,
                          child: ElevatedButton(
                            child: Text('nexttemp'),
                            onPressed: () {
                              Navigator.pushNamedAndRemoveUntil(context,Regissub.id, (route) => false);
                            },
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
