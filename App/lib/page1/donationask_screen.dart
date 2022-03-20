import 'package:flutter/material.dart';
import 'package:flutter_try/constants.dart' as colort;
import 'dmoneyinput_screen.dart';
import '../detailPage/FcDetail.dart';

class Donationask extends StatefulWidget
{
  const Donationask({Key? key ,required this.f_name}) : super(key: key);
  static const String id = "Donationask";
  @override
  _DonationaskState createState() => _DonationaskState();
  final String f_name;

}

class _DonationaskState extends State<Donationask>
{
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
          child:
          Column(
            children: [
              SizedBox(height: 80),
              Text("Did you complete the donation?"),
              SizedBox(height:80),
                  Container(
                  padding: EdgeInsets.all(15),
                  height:80,
                  // color: Colors.white,  // 영역
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            onPressed: ()
                            {
                              //// Navigator.push(context, MaterialPageRoute(builder: (context) =>Donationmoneyinput()));
                              Navigator.pushNamed(context, Donationmoneyinput.id,arguments:widget.f_name);
                            },
                            child: Text("O"),
                            style:  ButtonStyle(
                                backgroundColor: MaterialStateProperty.all<Color>(colort.TeamColor),
                      ),
                          ),
                          SizedBox(width: 10),
                          ElevatedButton(
                            onPressed: () {
                              // Navigator.push(context, MaterialPageRoute(builder: (context) =>NoPoverty(f_name: '1',)));
                              // Navigator.pushNamed(context, NoPoverty.id,arguments:widget.f_name);
                              Navigator.pop(context);
                              },
                            child: Text("x"),
                            style:  ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(colort.TeamColor),
                            ),
                          ),
                        ],
                      ),
                      ),
            ],
          ),
        ),
      ),
    );
  }
}
