import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../api/Fcapi.dart';
import 'package:flutter_try/methods/multi_select_dialog.dart';

import '../constants.dart';
import 'HomePage.dart';



class Regissub extends StatefulWidget {
  static const String id = "regissub_screen";
  @override
  _RegissubState createState() => _RegissubState();
}



class _RegissubState extends State<Regissub>
{
  late Future<FcJdata> DetailFcJdata;
  late Set<String> selectedValues;
  List<MultiSelectDialogItem<String>> items = List.generate(7, (index) => MultiSelectDialogItem('$index+1', '미정입니다'),);

  late List <String> namecheck = [];
  late List <int> requestid = [];

  void makelist()
  async {

    FcJdata gdata = await fetchFcJdata();
    for (int i = 0; i < 7; i++) {
      items[i].value = gdata.data[i].f_name;
      items[i].label = gdata.data[i].f_name;
    }

    for (int i = 0; i < 7; i++) {
      namecheck.add(items[i].value);
    }
    print("dfd");
    print(namecheck);



  }




  void submit() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('선택하신 기관은 다음과 같습니다'),
          content: Container(
            color: Colors.grey[200],
            child: Wrap(
              spacing: 10.0,
              children: selectedValues.map((item) {
                return Chip(
                  backgroundColor: Colors.yellow,
                  label: Text('$item'),
                );
              }).toList(),
            ),
          ),
          actions: <Widget>[
            TextButton(
                child: Text('OK'),
                onPressed: () {
                  final requestpost = selectedValues.toList();

                  print(requestpost);
                  print(requestpost.runtimeType);

                  print(namecheck);
                  print(namecheck.runtimeType);

                  requestid = []; // init for re use
                  for (int i = 0; i < requestpost.length; i++)
                  {
                    for (int j = 0; j < namecheck.length; j++)
                    {
                      if (requestpost[i] == namecheck[j])
                      {
                        requestid.add(j+1);
                      }
                    }
                  }
                  requestid.sort();
                  print(requestid);

                  // Navigator.pushNamedAndRemoveUntil(context, HomePage.id, (route) => false);
                }
            ),
          ],
        );
      },
    );
  }

  void _showMultiSelect() async {
    selectedValues = await showDialog(context: context,
      builder: (context) {
        return MultiSelectDialog
          (
          title: '구독할 기관을 선택해 주세요',
          items: items,
          initialSelectedValues: selectedValues,
        );
      },
    );

    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    DetailFcJdata = fetchFcJdata();
    selectedValues = {"초록우산어린이재단"};
    makelist();
  }



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false, // for custom icon option setting down below
        ),

        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                onTap: _showMultiSelect,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(
                      color: Colors.black54,
                      width: 1.0,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Wrap(
                            spacing: 10.0,
                            children: selectedValues == null || selectedValues.length == 0 ? [Container()]
                                : selectedValues.map((v) {
                              return Chip(label: Text('$v'), labelStyle: TextStyle(color: Colors.white),
                                backgroundColor: TeamColor,
                                elevation: 6,
                                onDeleted: () {
                                  setState(() {
                                    selectedValues.remove(v);});
                                },
                              );
                            },).toList(),
                          ),
                        ),
                        Container(
                          height: 60.0,
                          child: Icon(Icons.list),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              ElevatedButton(
                child: Text('SUBMIT'),
                onPressed: selectedValues == null || selectedValues.length == 0 ? null
                    : submit,

              ),
            ],
          ),
        ),
      ),
    );
  }
}

