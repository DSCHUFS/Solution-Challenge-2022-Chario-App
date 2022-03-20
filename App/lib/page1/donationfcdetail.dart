import 'package:flutter/material.dart';
import 'package:flutter_try/constants.dart';
import 'package:flutter_try/page1/donpersonal_screen.dart';
import 'package:flutter_try/detailPage/FcDetail.dart';

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
    return Scaffold(
      body:SafeArea(

        child: Column(
          children: [
            Card(
                child: ListTile(
                  leading: InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, DonpersonalScreen.id);
                    },
                    child: Icon(Icons.arrow_back_ios),
                  ),
                  trailing:
                  Wrap(
                    spacing: 12,
                    children:[
                      TextButton(onPressed: () { Navigator.pushNamed(context, NoPoverty.id,arguments: widget.arguments["f_id"].toString() );},
                        child: Text(widget.arguments["f_name"],style: TextStyle(fontWeight: FontWeight.bold,color: TeamColor),)
                      )
                    ],
                  ),

                )),
            Expanded(
            flex: 5, // 60% of space => (6/(6 + 4)
            child :Container(
              child: Image.network(widget.arguments['f_logo'], fit: BoxFit.fill),),
            ) ,

            Expanded(
                flex: 5,
              child :Container(
              child: Column(
                children :[
                  SizedBox(height: 15),
                  Container(child: Text("Name of organization :"+widget.arguments["f_name"]),),
                  SizedBox(height: 15),
                  Container(child: Text("\$"+"${widget.arguments["u_m_price"] }"),),
                  SizedBox(height: 15),
                  Container(child: Text("date:"+widget.arguments['don_date']),),
            ],
            ),
        )
          ),
          ],
      ),




      ),
    );
  }
}




