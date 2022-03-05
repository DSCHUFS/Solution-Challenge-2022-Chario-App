import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../api/Fcapi.dart';
import '../isLike_User.dart';
import 'package:flutter_try/methods/multi_select_dialog.dart';



class Regissub extends StatefulWidget {
  static const String id = "regissub_screen";
  @override
  _RegissubState createState() => _RegissubState();
}



class _RegissubState extends State<Regissub>{
  late Future<FcJdata> DetailFcJdata;

  final List<MultiSelectDialogItem<int>> items =
  List.generate(30,
        (index) => MultiSelectDialogItem(index + 1, 'Item Number: ${index + 1}'),
  );


  void  makelsit () async{
    late Future<FcJdata> g_data =  fetchFcJdata();
    print(g_data);
  }


  late Set<int> selectedValues;

  void submit() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Items(s) selected'),
          content: Container(
            color: Colors.grey[200],
            child: Wrap(
              spacing: 10.0,
              children: selectedValues.map((item) {
                return Chip(
                  backgroundColor: Colors.yellow,
                  label: Text('item $item'),
                );
              }).toList(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }

  void _showMultiSelect() async {
    selectedValues = await showDialog(
      context: context,
      builder: (context) {
        return MultiSelectDialog(
          title: 'Select Item(s)',
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
    selectedValues = {1};
    // selectedValues = { 1: {Chip(backgroundColor: Colors.yellow,label: Text('item 1'))}} as Set<int>;
    makelsit();
  }

  @override
  Widget build(BuildContext context) {
    // const PrimaryColor = const Color(0xFFffa8a8);
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
                                children: selectedValues == null ||
                                    selectedValues.length == 0
                                    ? [Container()]
                                    : selectedValues.map(
                                      (v) {
                                    return Chip(
                                      label: Text('item $v'),
                                      labelStyle:
                                      TextStyle(color: Colors.white),
                                      backgroundColor: Colors.redAccent,
                                      elevation: 6,
                                      onDeleted: () {
                                        setState(() {
                                          selectedValues.remove(v);
                                        });
                                      },
                                    );
                                  },
                                ).toList(),
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
                    onPressed: selectedValues == null || selectedValues.length == 0
                        ? null
                        : submit,
                  ),



        // Container(
        //     child: FutureBuilder<FcJdata>(
        //         future: DetailFcJdata,
        //
        //         builder: (context, snapshot) {
        //
        //           if (snapshot.hasData) {
        //             return  ListView.separated(
        //                 itemBuilder:(context, index)
        //                 {
        //                   return
        //                     ListTile(
        //                         leading:ConstrainedBox(constraints: BoxConstraints(
        //                           minWidth: 44,
        //                           minHeight: 44,
        //                           maxWidth: 64,
        //                           maxHeight: 64, //
        //                         ),child: Image.network(snapshot.data!.data[index].f_logo, fit: BoxFit.fill),
        //
        //                         ),
        //                         title:Center(child:Text(snapshot.data!.data[index].f_name),)
        //                     );
        //                 },
        //                 separatorBuilder: (context, index) { return Divider(); },
        //                 itemCount: snapshot.data!.count);
        //           }
        //           else if (snapshot.hasError) {
        //
        //             return Text('${snapshot.error}');
        //           }
        //           else {
        //             return CircularProgressIndicator();
        //           }})
        // ),





                ],
    ),
        ),



      ),
    );
  }
}