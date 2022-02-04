
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_try/color.dart';

class NoPoverty extends StatelessWidget
{
  final List<String> imageList = ["https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsZrtzlcoN_cbaZnq3ufcoPz6eMqeW2RYUm9GFzVkQFyrm-zmA7CPDkOS58NPWPTOjFUQ&usqp=CAU",
    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRsZrtzlcoN_cbaZnq3ufcoPz6eMqeW2RYUm9GFzVkQFyrm-zmA7CPDkOS58NPWPTOjFUQ&usqp=CAU",
  ];


  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
        appBar: AppBar(
          title: ListTile(
              trailing: Image.asset("assets/logolong.png", width: 100, height: 50)),
          // title:Image.asset("assets/logolong.png",width:100,height:50),
          // title:Image.asset("logolong.png",width:100,height:50),
          // centerTitle: true,
          backgroundColor: mainColor,
        ),
        body: Column(
          children:<Widget>[
            Center(
              child: SizedBox(
                height: 10,
                width: 200,
                child: Container( color: Colors.white),
              ),
            ),
            // logo
            Expanded(child:
            Container
              (
              child: Ink.image(
                image: AssetImage('assets/unisef.png'),
                fit: BoxFit.cover,
              ),
            ),
            ),
            // box and text
            Center(
              child: SizedBox(
                height: 10,
                width: 200,
                child: Container( color: Colors.white),
              ),
            ),

            Container(
              width: 240.0,
              height: 42.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                color: mainColor,
              ),
              child: Center(
                child: Text(
                  'Save the children',
                  style: TextStyle(
                    fontFamily: 'Arial',
                    fontSize: 18,
                    color: Colors.white,
                    height: 1,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

            ),

            Center(
              child: SizedBox(
                height: 10,
                width: 200,
                child: Container( color: Colors.white),
              ),
            ),


            CarouselSlider(
              options: CarouselOptions(
                enlargeCenterPage: false,
                enableInfiniteScroll: false,
                autoPlay: true,
              ),
              items: imageList.map((e) => ClipRRect(borderRadius: BorderRadius.circular(8),
                child: Stack(fit: StackFit.expand, children: <Widget>[Image.network(e, width: 1050, height: 350, fit: BoxFit.cover,)
                ],
                ),
              ))
                  .toList(),
            ),

            Center(
              child: SizedBox(
                height: 10,
                width: 200,
                child: Container( color: Colors.white),
              ),
            ),

            Container(
              child: RaisedButton(
                onPressed: () {},
                child: const Text('donation', style: TextStyle(fontSize: 20)),
                color: mainColor,
                textColor: Colors.white,
                elevation: 5,
              ),
            ),

            // BottomButton(
            //   buttonTitle: 'CALCULATE',
            //   onTap: () {},),

          ],
        )
    );
  }
}