import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_try/api/isLikedapi.dart';
import 'package:flutter_try/color.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_try/api/Fcapi.dart';
import '../api/ContentsApi.dart';
import '../isLike_User.dart';
import '../page1/donationask_screen.dart';
import 'Fc_article.dart';

_launchURL(String url) async {

    await launch(url);
  // } else {
  //   throw "could not lunch";
  // }
}

class NoPoverty extends StatefulWidget
{
  const NoPoverty({Key? key, required this.fc_id}) : super(key: key);

  static const String id = "FcDetail" ;

  @override
  _MyAppState createState() => _MyAppState();
  final String fc_id;

}


bool isLike = true;
class _MyAppState extends State<NoPoverty>
{

  UserModel? _like;
  UserModel? _delete;
  late Future<FcJdata> DetailFcJdata;
  late Future<ContentsApi> ContentFcJdata;

  List<String> imageList = [];
  Map<String,int> image_index = {};
  void makelist()
  async{
    ContentsApi gdata = await fetchContJdata(widget.fc_id);
    for (int i = 0; i < gdata.contentsList.length; i++) {
      imageList.add(gdata.contentsList[i].image);
      image_index[gdata.contentsList[i].image] = i;
      // print('${i}는 ${imageList[i]}');
    }
    print(imageList);
  }

  @override
  void initState()
  {
    // TODO: implement initState
    super.initState();
    DetailFcJdata = fetchFcJdata();
    String fcId = widget.fc_id.toString();
    ContentFcJdata = fetchContJdata(fcId) ;
    makelist();

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
            trailing: Image.asset("assets/logo_word.png",
                width: 150, height: 50)),
        // centerTitle: true,
        backgroundColor: mainColor,
      ),
      body:
      Container(

        child:
        FutureBuilder<ContentsApi>(
          future: ContentFcJdata,
          builder: (context, snapshot) {

            if (snapshot.hasData) {
              // f_name_don = snapshot.data!.data[widget.fc_id].f_name;
              return Container(child: Column(
                  children:[
                    Center(
                      child: SizedBox(
                        height: 10,
                        width: 200,
                        child: Container(color: Colors.white),
                      ),
                    ),
                    // logo
                    Expanded(
                      child: Container(
                        child: Container(
                          child: InkWell(
                            onTap: () {
                              _launchURL(snapshot.data!.facDto.fHome);
                            },
                            child: Image.network(
                              snapshot.data!.facDto.fLogo,
                              fit: BoxFit.fitWidth,
                              height: 100,
                              // fit: BoxFit.fill,
                            ),

                          ),
                        ),
                      ),
                    ),
                    // box and text


                    Container(
                      width: 200.0,
                      height: 42.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.0),
                        color: mainColor,
                      ),
                      child: Center(
                        child: Text(
                          snapshot.data!.facDto.fName,
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
                          .map((i){
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.symmetric(horizontal: 5.0),
                                decoration: BoxDecoration(color: Colors.amber),
                                child: GestureDetector(
                                    child: Image.network(i, fit: BoxFit.fill),
                                    onTap: () {
                                      int index = image_index[i]!.toInt();
                                      Navigator.push<Widget>(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => HomeScreen(content: snapshot.data!.contentsList[index]),
                                        ),
                                      );
                                    })
                            );
                          },
                        );
                      }).toList(),

                    ),

                    Center(
                      child: SizedBox(
                        height: 10,
                        width: 200,
                        child: Container(color: Colors.white),
                      ),
                    ),

                    Center(
                      child: Row(
                          children:[
                            RaisedButton(
                              onPressed: () {
                                _launchURL(snapshot.data!.facDto.fPay);
                                Navigator.pushNamed(context, Donationask.id,arguments: snapshot.data!.facDto.fName);
                              },
                              child: const Text('donation', style: TextStyle(fontSize: 20)),
                              color: mainColor,
                              textColor: Colors.white,
                              elevation: 5,
                            ),
                            IconButton(
                                icon: Icon(isLike? Icons.favorite : Icons.favorite_border),
                                color: isLike? Colors.red:null,
                                onPressed: () async {
                                  setState(()  {
                                    if (isLike) {
                                      isLike = false;
                                    } else {
                                      isLike = true;
                                    }
                                  });
                                  print(isLike);
                                  if (isLike){
                                    String LikeId = (widget.fc_id).toString();
                                    final UserModel? like = await createUser(LikeId);
                                    setState(() {
                                      _like = like!;
                                    });
                                    print("dlqhk~~");
                                  }else{
                                    String LikeId = (widget.fc_id).toString();
                                    final UserModel? delete = await deleteUser(LikeId);
                                    setState(() {
                                      _delete = delete!;
                                    });
                                  }

                                  print(_like?.status);print(_delete?.status);


                                }
                            ),


                          ]
                      ),),
                  ]
              ),);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator(valueColor:AlwaysStoppedAnimation<Color>(Colors.white),);
          },
        ),

      ),
    );


  }
}