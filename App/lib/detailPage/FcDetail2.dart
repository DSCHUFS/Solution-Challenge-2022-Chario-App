import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_try/color.dart';
import 'package:flutter_try/main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_try/api.dart';
_launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw "could not lunch";
  }
}
// unisef
class NoPoverty2 extends StatefulWidget {
  const NoPoverty2({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}
class _MyAppState extends State<NoPoverty2>{
  late Future<Album> DetailAlbum;
  final List<String> imageList =
  ["https://storage.googleapis.com/content_image/Unicef_contents/Unicef_tonga_01_27.jpg?authuser=1",
    "assets/bts.png",
    "https://storage.googleapis.com/content_image/%EB%A1%9C%EA%B3%A0/%EC%9C%A0%EB%8B%88%EC%84%B8%ED%94%84%EB%A1%9C%EA%B3%A0.jpg?authuser=1"
  ];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DetailAlbum = fetchAlbum();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
            trailing: Image.asset("assets/chario_logo.png",
                width: 100, height: 50)),
        // centerTitle: true,
        backgroundColor: mainColor,
      ),
      body:
      FutureBuilder<Album>(
        future: DetailAlbum,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(child: Column(
                children:[Center(
                  child: SizedBox(
                    height: 10,
                    width: 200,
                    child: Container(color: Colors.white),
                  ),
                ),
                  // logo
                  Expanded(
                    child: Container(
                      child: InkWell(
                        onTap: () {
                          _launchURL(snapshot.data!.data[2].f_home);
                        },
                        child: Image.network(
                          "https://storage.googleapis.com/content_image/%EB%A1%9C%EA%B3%A0/%EC%9C%A0%EB%8B%88%EC%84%B8%ED%94%84%EB%A1%9C%EA%B3%A0.jpg?authuser=1",
                          fit: BoxFit.fill,
                        ),

                      ),
                    ),
                  ),
                  // box and text
                  Center(
                    child: SizedBox(
                      height: 10,
                      width: 200,
                      child: Container(color: Colors.white),
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
                        snapshot.data!.data[1].f_name,
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
                      child: Container(color: Colors.white),
                    ),
                  ),

                  CarouselSlider(
                    options: CarouselOptions(
                      enlargeCenterPage: false,
                      enableInfiniteScroll: false,
                      autoPlay: true,
                    ),
                    items: imageList
                        .map((e) => ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Stack(
                        fit: StackFit.expand,
                        children: <Widget>[
                          Image.network(
                            e,
                            width: 1050,
                            height: 350,
                            fit: BoxFit.cover,
                          )
                        ],
                      ),
                    ))
                        .toList(),
                  ),

                  Center(
                    child: SizedBox(
                      height: 10,
                      width: 200,
                      child: Container(color: Colors.white),
                    ),
                  ),

                  Container(
                    child: RaisedButton(
                      onPressed: () {
                        _launchURL(snapshot.data!.data[1].f_pay);
                      },
                      child: const Text('donation', style: TextStyle(fontSize: 20)),
                      color: mainColor,
                      textColor: Colors.white,
                      elevation: 5,
                    ),
                  ),]));
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator(valueColor:AlwaysStoppedAnimation<Color>(Colors.white),);
        },
      ),

    );
  }
}