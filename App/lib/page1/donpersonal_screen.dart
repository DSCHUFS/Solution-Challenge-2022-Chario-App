import 'package:flutter/material.dart';
import 'package:flutter_try/page1/HomePage.dart';
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
    userDonform = fetchDonJdata();
  }

  @override
  Widget build(BuildContext context) {
    // const PrimaryColor = const Color(0xFFffa8a8);
    return Scaffold(
      bottomNavigationBar: BottomBar(userDonform),
      body: SafeArea(
        child: FutureBuilder<UserDonJdata>(
          future: userDonform,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: <Widget>[
                  Card(
                      child: ListTile(
                        leading: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, HomePage.id);
                          },
                          child: Icon(Icons.arrow_back_ios),
                        ),
                        trailing:
                        Wrap(
                          spacing: 12,
                          children:[
                            Text('Donation-page'),
                            Icon(
                              Icons.volunteer_activism,
                              color: Colors.grey[850],
                            ),
                          ],
                        ),

                      )),
                  SizedBox(height: 30),
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return ListTile(
                            onTap: () {
                              arg =
                              { 'f_id': snapshot.data!.datag[index].f_id,
                                'f_name': snapshot.data!.datag[index].f_name,
                                'f_logo': snapshot.data!.datag[index].f_logo,
                                'u_m_price': snapshot.data!.datag[index].u_m_price,
                                'don_date': snapshot.data!.datag[index].don_date
                              };
                              print("1-----------1");
                              print(arg);

                              Navigator.pushNamed(context, DonfcdetailScreen.id,
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
                            title: Center(
                              child: Text(snapshot.data!.datag[index].f_name),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Divider(color: Colors.black,);
                        },
                        itemCount: snapshot.data!.fac_count),
                  ),
                ],
              );
            } else if (snapshot.data == null) {
              return Center(
                child: Text('there is no donation yet'),
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
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.favorite, color: Colors.red),
                      SizedBox(
                        width: 50.0,
                      ),
                      Text("donation :"+ "\$" + "${snapshot.data!.total_price}"),
                      SizedBox(
                        width: 50.0,
                      ),
                    ],
                  ));
            } else if (snapshot.data == null) {
              return Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.favorite, color: Colors.red),
                      SizedBox(
                        width: 50.0,
                      ),
                      Text("donation :"+ "\$" + "0" ),
                      SizedBox(
                        width: 50.0,
                      ),
                    ],
                  ));
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
