import 'package:flutter/material.dart';




class DonfcdetailScreen extends StatefulWidget {
  static const String id = "donationfcdetail";

  const DonfcdetailScreen({Key? key,required this.arguments}) : super(key: key);

  final Map arguments;

  @override
  _DonfcdetailScreenState createState() => _DonfcdetailScreenState();
}

class _DonfcdetailScreenState extends State<DonfcdetailScreen>
{
  @override
  Widget build(BuildContext context) {

    // final arguments = ModalRoute.of(context)?.settings.arguments as Map;
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
                      child: Image.network(widget.arguments['f_logo'], fit: BoxFit.fill),
                              ),

                    Container(
                    child:
                        Text(widget.arguments["f_name"]),
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
                  Text("${widget.arguments["u_m_price"] }"+"원"),
                ),

                Container(child:
                Text("date:"+widget.arguments['don_date']),
                ),

              ],
      ),


      ),
    );
  }
}


