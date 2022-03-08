import 'package:flutter/material.dart';
import '../api/donationgetapi.dart';
import 'donationfcdetail.dart';

class DonpersonalScreen extends StatefulWidget {
  static const String id = "donpersonal_screen";
  @override
  _DonpersonalScreenState createState() => _DonpersonalScreenState();
}

class _DonpersonalScreenState extends State<DonpersonalScreen> {
  late Future<UserDonJdata> userDonform;
  // global 변수를 설정 하단 바에 정보 전
  late Map arg;

  @override
  void initState() {
    super.initState();
    /////////////////// 1 = u_id
    userDonform = fetchDonJdata();
  }

  @override
  Widget build(BuildContext context) {
    // const PrimaryColor = const Color(0xFFffa8a8);
    return Scaffold(
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: FutureBuilder<UserDonJdata>(
                  future: userDonform,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.separated(
                          itemBuilder: (context, index) {
                            return ListTile(
                              onTap: () { // send argument
                                arg =
                                { 'f_name': snapshot.data!.datag[index].f_name,
                                  'f_logo': snapshot.data!.datag[index].f_logo,
                                  'u_m_price': snapshot.data!.datag[index]
                                      .u_m_price,
                                  'don_date': snapshot.data!.datag[index]
                                      .don_date
                                };

                                Navigator.pushNamed(
                                    context, DonfcdetailScreen.id,
                                    arguments: arg);
                              },
                              leading: ConstrainedBox(
                                constraints: BoxConstraints(
                                  minWidth: 44,
                                  minHeight: 44,
                                  maxWidth: 64,
                                  maxHeight: 64, //
                                ),
                                child: Image.network(
                                    snapshot.data!.datag[index].f_logo,
                                    fit: BoxFit.fill),
                              ),
                              title: Center
                                (
                                child: Text
                                  (
                                    snapshot.data!.datag[index].f_name),
                              ),
                              trailing: Icon(Icons.arrow_forward_ios),

                            );
                          },
                          separatorBuilder: (context, index) {
                            return Divider();
                          },
                          itemCount: snapshot.data!.fac_count);
                      // } else if (snapshot.hasError) {
                      //   return Text('${snapshot.error}' + '    !!this is error');
                      // }
                    }else if (snapshot.data == null) {
                      return
                      Center(
                        child :
                        Text('there is no donation yet'),
                    );

                    }
                    return const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: BottomBar(userDonform),
    );
  }
}

class BottomBar extends StatelessWidget {
  var userDonform;

  BottomBar(this.userDonform);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.bla,
      child: Container(
        height: 100,
        child: FutureBuilder<UserDonJdata>(
          future: userDonform,
          builder: (context, snapshot)
          {
            if (snapshot.hasData) {
              return Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon( Icons.favorite , color: Colors.red),
                      SizedBox(width: 50.0,),
                      Text("기부금 :"+"${snapshot.data!.total_price}"+"원"),
                      SizedBox(width: 50.0,),
                    ],
                  )
              );

            } else if (snapshot.data == null) {
              return Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon( Icons.favorite , color: Colors.red),
                      SizedBox(width: 50.0,),
                      Text("기부금 :"+"0"+"원"),
                      SizedBox(width: 50.0,),
                    ],
                  )
              );
            }
            return const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            );
          },
        ),
      ),
    );
  }
}
