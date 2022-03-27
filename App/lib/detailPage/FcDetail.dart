import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_try/api/isLikedapi.dart';
import 'package:flutter_try/color.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_try/api/Fcapi.dart';
import '../api/ContentsApi.dart';
import '../isLike_User.dart';
import '../page1/HomePage.dart';
import '../page1/donationask_screen.dart';
import 'Fc_article.dart';

_launchURL(String url) async {

    await launch(url);

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
    for (int i = 0; i < gdata.contentsList.length; i++)
    {
      imageList.add(gdata.contentsList[i].image);
      image_index[gdata.contentsList[i].image] = i;
    }
  }

  @override
  void initState()
  {
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
        title: Text(""),
        actions:[
          IconButton
            (
          icon :Image.asset("assets/Logo.png"),
            onPressed: () {Navigator.pushNamed(context, HomePage.id);}
          ),
        ],
        backgroundColor: mainColor,
        // centerTitle: true,
      ),
      body:
      Container(

        child:
        FutureBuilder<ContentsApi>(
          future: ContentFcJdata,
          builder: (context, snapshot) {

            if (snapshot.hasData) {
              // f_name_don = snapshot.data!.data[widget.fc_id].f_name;
              return
                SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                // Container(

                child: Column(
                  children:[
                    // logo
                   InkWell(
                            onTap: () {
                              _launchURL(snapshot.data!.facDto.fHome);
                            },
                            child: Image.network(
                              snapshot.data!.facDto.fLogo,
                              fit: BoxFit.fitWidth,
                              // fit: BoxFit.fill,
                            ),

                          ),


                    // box and text
                    Padding(padding: EdgeInsets.all(10)),
                    Container(
                      width: 240.0,
                      height: 42.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(24.0),
                        color: mainColor,
                      ),
                      child: Center(
                        child:
                              Text(
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
                    // Padding(padding: EdgeInsets.all(10)),

                    Container(
                      margin: const EdgeInsets.all(15.0),
                      child:
                      Text(snapshot.data!.facDto.fIntro,style: TextStyle(fontSize: 18),),
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
      bottomNavigationBar:
      FutureBuilder<ContentsApi>(
        future: ContentFcJdata,
        builder: (context, snapshot) {

        if (snapshot.hasData) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:[
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: mainColor, // background
                  onPrimary: Colors.white, // foreground
                ),
                onPressed: () {
                  _launchURL(snapshot.data!.facDto.fPay);
                  Navigator.pushNamed(context, Donationask.id,arguments: snapshot.data!.facDto.fName);
                },
                child: const Text('donation', style: TextStyle(fontSize: 20)),
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

                    if (isLike){
                      String LikeId = (widget.fc_id).toString();
                      final UserModel? like = await createUser(LikeId);
                      setState(() {
                        _like = like!;
                      });
                    }
                    else
                    {
                      String LikeId = (widget.fc_id).toString();
                      final UserModel? delete = await deleteUser(LikeId);
                      setState(() {
                        _delete = delete!;
                      });
                    }
                  }
              ),
            ]
        );
        }
        else if (snapshot.data == null)
        {
          return Center(
            child: Text('there is no contents yet we will be soon update'),
          );
        }
          else if (snapshot.hasError)
          {
          return Text('${snapshot.error}');
          }
          return const CircularProgressIndicator(valueColor:AlwaysStoppedAnimation<Color>(Colors.white),);
        }
      ),
    );


  }
}
