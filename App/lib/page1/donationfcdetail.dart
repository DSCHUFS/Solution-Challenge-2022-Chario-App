import 'package:flutter/material.dart';


class DonfcdetailScreen extends StatefulWidget {
  static const String id = "donationfcdetail";
  @override
  _DonfcdetailScreenState createState() => _DonfcdetailScreenState();
}

class _DonfcdetailScreenState extends State<DonfcdetailScreen>
{

  @override
  Widget build(BuildContext context) {

    // if run servvice
    final arguments = ModalRoute.of(context)?.settings.arguments as Map;

    // // if make ui
    // Map arguments = {   'f_name' :   "초록 우산 어린이",
    //   'f_logo' :   "https://storage.googleapis.com/content_image/%EB%A1%9C%EA%B3%A0/%E1%84%8E%E1%85%A9%E1%84%85%E1%85%A9%E1%86%A8%E1%84%8B%E1%85%AE%E1%84%89%E1%85%A1%E1%86%AB.gif?authuser=1",
    //   'u_m_price' :   1000,
    //   'don_date' :  "22-01-01"
    // };

    return Scaffold(

      body:
      Container(
        child:
            Column(
              children: [
                SizedBox(),
                  Row(
                  children:[

                    Container(
                      constraints: BoxConstraints(
                        minWidth: 44,
                        minHeight: 44,
                        maxWidth: 64,
                        maxHeight: 64, //
                      ),
                      child: Image.network(arguments['f_logo'], fit: BoxFit.fill),
                              ),

                    Container(
                    child:
                        Text(arguments["f_name"]),
                    ),

                    Container(

                    ),

                    Container(
                    ),

                  ],
                  ),

                SizedBox(),  // 월별 얼마 ?
                SizedBox(),
                SizedBox(),
                Container(child:
                  Text("${arguments["u_m_price"] }"+"원"),
                ),

                Container(child:
                Text("date:"+arguments['don_date']),
                ),

              ],
      ),
      ),


    );
  }
}


