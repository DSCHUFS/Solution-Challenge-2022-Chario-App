import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Album> Factory() async {
  final response = await http.get(Uri.parse(
      "https://1e85ce8f-6ffc-402d-9365-0576000728de.mock.pstmn.io/api/members"));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load data');
  }
}

class Album {
  final int count;
  final List<Data> data;

  const Album({
    // required this.u_username,
    required this.count,
    required this.data,
  });

  factory Album.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    print(list.runtimeType);
    List<Data> dataList = list.map((i) => Data.fromJson(i)).toList();

    return Album(count: json['count'], data: dataList);
  }
}

class Data {
  final String u_username;
  final String u_name;
  final String u_email;
  final String u_phone;
  final String u_birth;
  final String u_sub;

  Data({
    required this.u_username,
    required this.u_name,
    required this.u_email,
    required this.u_phone,
    required this.u_birth,
    required this.u_sub,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
        u_username: json['u_username'],
        u_name: json['u_name'],
        u_email: json['u_email'],
        u_phone: json['u_phone'],
        u_birth: json['u_birth'],
        u_sub: json['u_sub']);
  }
}


void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp>
{
  late Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = Factory();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(child:Row(
                  children: [
                    Text(snapshot.data!.data[0].u_username)
                    ,Text(snapshot.data!.data[1].u_username)
                    ,Text(snapshot.data!.data[2].u_username)],
                ),
                );

              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }

              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}