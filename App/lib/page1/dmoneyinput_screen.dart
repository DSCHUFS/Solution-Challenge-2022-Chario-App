import 'package:flutter/material.dart';
import 'package:flutter_try/api/donationpostapi.dart';
import 'package:flutter_try/constants.dart' as colort;
import 'package:flutter_try/page1/HomePage.dart';
import 'package:intl/intl.dart';
import '../constants.dart';


class Donationmoneyinput extends StatefulWidget
{
  const Donationmoneyinput({Key? key,required this.f_name}) : super(key: key);
  static const String id = "Donationmoneyinput";
  @override
  _DonationmoneyinputState createState() => _DonationmoneyinputState();
  final String f_name;

}

class _DonationmoneyinputState extends State<Donationmoneyinput> {

  final amountInputController = TextEditingController();
  bool _welcome = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: BoxConstraints(
            maxHeight: double.infinity,
          ),
          width: 600.0,
          height: 400.0,
          decoration:
          BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(10),
            ),

            margin: EdgeInsets.all(50),
            child: Column(
              children: [
                SizedBox(height: 80),
                Text("Thank you for your donation."),
                Text("please enter your monthly donation ammount"),
                SizedBox(height: 80),


                Row(
                  children:
                    [
                      Expanded(
                          flex: 1,
                          child: Container(
                              child:Text("",  style: TextStyle(fontWeight: FontWeight.bold),))),

                      Expanded(
                        flex: 9,
                        child: Container(child : accountField(),
                      ),
                      ),
                      Expanded(
                          flex: 1,
                          child: Container(
                          child:Text("\$",  style: TextStyle(fontWeight: FontWeight.bold),))),
                    ],
                ),

                Container(
                  padding: EdgeInsets.all(15),
                  height: 80,
                  // color: Colors.white,  // 영역
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      ElevatedButton(
                        onPressed: () async
                        {
                          final int price = int.parse(amountInputController.text);
                          String dateTime = DateFormat('yy/MM/dd').format(DateTime.now());
                          String fname = widget.f_name.toString();

                          donpost parm = donpost();
                          await parm.createDonation(dateTime, price,fname);
                          var re = parm.resultc ;

                          print(re);


                          if (re == true)
                          {
                            setState(() {_welcome = re;});
                            Navigator.pushNamedAndRemoveUntil(context, HomePage.id, (route) => false);
                          }
                          else
                          {
                            print("It shoot  error in dmoney");
                          }



                        },
                        child: Text("confirm"),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              colort.TeamColor),
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
              ],
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
