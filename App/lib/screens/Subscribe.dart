import 'package:flutter/material.dart';

class Subscribe extends StatelessWidget {
  const Subscribe({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: Scaffold(
        appBar: AppBar(title: Text('your current subscribe')),
        body: Text('구독한 기럽 컨탠츠 기입 : 리스트 형'),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.favorite,
                  color: Colors.pink,
                  size: 24.0,
                ),
                Text('기부한 액수 :'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
