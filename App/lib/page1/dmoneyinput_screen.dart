import 'package:flutter/material.dart';
import 'package:flutter_try/api/donationpostapi.dart';
import 'package:flutter_try/constants.dart' as colort;
import 'package:intl/intl.dart';

import '../api/isLikedapi.dart';
import '../constants.dart';
import '../detailPage/FcDetail.dart';

class Donationmoneyinput extends StatefulWidget
{
  const Donationmoneyinput({Key? key}) : super(key: key);
  static const String id = "Donationmoneyinput";

  @override
  _DonationmoneyinputState createState() => _DonationmoneyinputState();

}

class _DonationmoneyinputState extends State<Donationmoneyinput> {
  final amountInputController = TextEditingController();
  Welcome? _welcome;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 600.0,
          height: 400.0,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          ),
          // alignment: Alignment.center,
          margin: EdgeInsets.all(50),

          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 80),
                Text("기부  감사합니다."),
                Text("월별 기부 액수를 입력해주세요"),
                SizedBox(height: 80),

                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 350,
                      child:accountField(),
                    ),
                    Container(
                        child:Text("원")
                    )
                  ],
                ),

                Container(
                  padding: EdgeInsets.all(15),
                  height: 80,
                  // color: Colors.white,  // 영역
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //////////////////////////////////!!!///////////////
                      ElevatedButton(
                        onPressed: () async {
                          final int price = int.parse(amountInputController.text);
                          String dateTime = DateFormat('yy/MM/dd').format(DateTime.now());
                          final Welcome? welcome = await createDonation(dateTime, price,"유니세프");
                          setState(() {
                            _welcome = welcome!;
                          });
                          print("The user ${_welcome?.donationPrice}, ${_welcome?.donationDate}");
                          //action 3   go back to Fc_detail page
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NoPoverty(fc_id: '1',))
                          );
                        },
                        child: Text("confirm"),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              colort.TeamColor),
                        ),
                      ),
                      //////////////////////////////////!!!///////////////

                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () async {
                          // action 2

                          // action 3
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => NoPoverty(fc_id: '1',))
                          );
                        },
                        child: Text("tmp button"),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              colort.TeamColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),


        ),
      ),
    );
  }


  Widget accountField()
  {
    return TextField(
      controller: amountInputController,
      onChanged: (value) {
        // final int price = int.parse(amountInputController.text);
        String dateTime = DateFormat('yy/MM/dd').format(DateTime.now());
      },

      keyboardType: TextInputType.number,
      textAlign: TextAlign.end,
      decoration: InputDecoration
        (
        filled: true,
        hintText: 'ex :10000',
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
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

    );
  }


}