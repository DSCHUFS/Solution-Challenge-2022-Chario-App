import '../api/CategoryfcApi.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_try/detailPage/FcDetail.dart';

import '../api/ContentsApi.dart';
import '../color.dart';

class StackedList extends StatelessWidget {
  late Future<CateFdata> CateFeJdata;
  final List<Color> _colors = Colors.primaries;
  static const _minHeight = 16.0;
  static const _maxHeight = 120.0;

  static const goals_color = {
    '1': sdg1,
    '2': sdg2,
    '3': sdg3,
    '4': sdg4,
    '6': sdg6,
    '10': sdg10,
    '13': sdg13,
    '14': sdg14
  };

  @override
  Widget build(BuildContext context) => CustomScrollView(
    slivers: _colors.map((color) => StackedListChild(minHeight: _minHeight, maxHeight: _colors.indexOf(color) == _colors.length - 1 ? MediaQuery.of(context).size.height : _maxHeight,
      pinned: true,
      child:FutureBuilder<CateFdata>(
  future: CateFeJdata,
  builder: (context, snapshot) {
  if (snapshot.hasData) {
  return
  ListView.builder(
          shrinkWrap: true,
          itemCount: snapshot.data!.count,
          itemBuilder: (context, int index)
          {
            print('index는 ${snapshot.data!.data[index].facility.fId}');
            return
              Padding(
                padding: const EdgeInsets.all(8.0),

                child:
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder
                    (
                    //side: BorderSide(color: (Colors.blue[300])!, width: 0.5),
                    side: BorderSide(color: (goals_color[current_cate!])!, width: 0.5),

                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  //shadowColor: goals_color[current_cate!],
                  elevation: 11.0,
                  child:
                  Column(
                      children :[
                        Wrap(
                            alignment: WrapAlignment.center,
                            spacing: 20.0,
                            runSpacing: 20.0,
                            children: [
                              Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    SizedBox(height: 5,),
                                    Container
                                      (
                                      child: ContentHome(fc_id: (snapshot.data!.data[index].facility.fId).toString()),
                                    ),
                                  ]
                              ),


                              ListTile(
                                leading:ClipOval(
                                    clipper: MyClipper(),
                                    child: Image.network(snapshot.data!.data[index].facility.fLogo, width: 100, height: 100,)),
                                title:Text(snapshot.data!.data[index].facility.fName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                                trailing: InkWell(
                                  onTap:()
                                  {
                                    Navigator.pushNamed(context, NoPoverty.id,arguments:(snapshot.data!.data[index].facility.fId).toString() );
                                  },
                                  child: Icon(Icons.arrow_forward_ios),
                                ),
                              ),

                            ]
                        )
                      ]),
                ),
              );
          });
  } else if (snapshot.hasError) {
  return Text('${snapshot.error}');
  } return const CircularProgressIndicator(
  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
  );},
      ),
    ),
    ).toList(),
  );
}



class StackedListChild extends StatelessWidget {
  final double minHeight;
  final double maxHeight;
  final bool pinned;
  final bool floating;
  final Widget child;

  SliverPersistentHeaderDelegate get _delegate => _StackedListDelegate(
      minHeight: minHeight, maxHeight: maxHeight, child: child);

  const StackedListChild({required this.minHeight, required this.maxHeight, required this.child, this.pinned = false, this.floating = false,})  : assert(child != null),
        assert(minHeight != null),
        assert(maxHeight != null),
        assert(pinned != null),
        assert(floating != null);


  @override
  Widget build(BuildContext context) => SliverPersistentHeader(
      key: key, pinned: pinned, floating: floating, delegate: _delegate);
}

class _StackedListDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;
  final Widget child;

  _StackedListDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_StackedListDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}





class ContentHome extends StatefulWidget
{
  final fc_id;
  const ContentHome({required this.fc_id});

  @override
  _ContentHomeState createState() => _ContentHomeState();
}

class _ContentHomeState extends State<ContentHome>
{
  Future<ContentsApi>? ContentJdata;
  @override
  void initState() {
    super.initState();
    ContentJdata = fetchContJdata(widget.fc_id);
  }

  @override
  Widget build(BuildContext context)
  {
    return FutureBuilder<ContentsApi>(
        future: ContentJdata,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            try {
              return
                Column(
                  children : [
                    SizedBox(height : 5),
                    GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      children: List.generate(snapshot.data!.contentsList.length, (index) {
                        return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(snapshot.data!.contentsList[index].image, fit: BoxFit.fitWidth,),
                              Text(snapshot.data!.contentsList[index].title, style: TextStyle(fontFamily: 'Ubuntu', fontSize: 12),)
                            ]);
                      }
                      ),

                    ),

                    Container(
                      alignment: Alignment.bottomRight,
                      child:
                      Text('Start Donate :'+'  ${snapshot.data!.facDto.fMinimal}     ',
                        style: TextStyle(fontFamily: 'Ubuntu', fontSize: 10),
                      ),),

                  ],
                );


            } on RangeError
            {
              print("hey! api!");
            }
          }
          else if (snapshot.data == null)
          {
            return   Text('There is no contents yet');
          }
          else
          {
            return Text('${snapshot.error}');
          }
          // By default, show a loading spinner.
          return const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          );
        });
  }
}
