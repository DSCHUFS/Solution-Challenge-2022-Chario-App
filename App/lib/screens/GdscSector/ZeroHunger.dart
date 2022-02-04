import 'package:flutter/material.dart';

class ZeroHunger extends StatefulWidget {
  @override
  State<ZeroHunger> createState() => _ZeroHungerState();
}

///// get information in server or database

final List<String> entries = <String>['A', 'B', 'C'];
final List<int> colorCodes = <int>[600, 500, 100];

class _ZeroHungerState extends State<ZeroHunger> {
  @override
  Widget build(BuildContext context) {
    return Scaffold
      (
        appBar: AppBar(
        automaticallyImplyLeading:
        false, // for custom icon option setting down below

          title: Image.asset('assets/GDSCLOGO.jpg', width: 150, height: 140),
        ),

        body: ListView.separated(
            padding: const EdgeInsets.symmetric(vertical: 30),
            itemCount: entries.length,
            separatorBuilder: (BuildContext context, int index) =>
            const Divider(thickness: 4),

            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 50,
                color: Colors.amber[colorCodes[index]],
                child: Center(child: Text('Entry ${entries[index]}')),
              );
            }
            )
    );
  }
}