// import 'dart:async';
// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
//
//
//
//
//
//
//
//
//
// // reference :
// // https://changjoopark.medium.com/%ED%94%8C%EB%9F%AC%ED%84%B0-flutter-%EC%95%B1-%EB%A7%8C%EB%93%A4%EA%B8%B0-%EB%B8%94%EB%A1%9C%EA%B7%B8-%EA%B8%80-%EC%83%81%EC%84%B8-dc1ba68d4cef
//
// // maybe post class?
// //
// // class User {
// //   final int userId;
// //   final String name;
// //   final String email;
// //   final String phone;
// //
// //   // 사전 안에 포함된 사전. 디코딩을 했기 때문에 문자열이 아니라 사전(map)이 되어야 한다.
// //   // 이때 사전의 값으로는 여러 가지가 올 수 있기 때문에 dynamic 키워드가 온다.
// //   // 엣갈리면 앞에 나온 사용자 데이터에서 company 항목을 찾아서 확인해 볼 것.
// //   final Map<String, dynamic> company;
// //
// //   // class onit
// //   User({this.userId, this.name, this.email, this.phone, this.company});
// //
// //   // fromJson 생성자. 이 함수를 호출하면 User 객체를 만들 수 있기 때문에 생성자라고 부른다.
// //   // factory는 클래스 함수로 생성자를 만들 때 사용하는 키워드.
// //   // 전역 함수처럼 동작하기 때문에 this 키워드를 사용할 수 없다.
// //   factory User.fromJson(Map<String, dynamic> userMap) {
// //     return User(
// //       userId: userMap['id'],
// //       name: userMap['name'],
// //       email: userMap['email'],
// //       phone: userMap['phone'],
// //       company: userMap['company'],
// //     );
// //   }
// //
// // // 위와 동일한 방법으로 factory 키워드를 생략할 수 있다.
// // // User.fromJson(Map<String, dynamic> userMap)
// // //     : userId = userMap['id']
// // //     , name = userMap['name']
// // //     , email = userMap['email']
// // //     , phone = userMap['phone']
// // //     , company = userMap['company']
// // }
// //
// // // json 서버로부터 사용자 데이터 중에서 첫 번째 데이터 1개만 가져옴
// // Future<User> fetchUser() async {
// //   // 첫 번째를 가져오기 때문에 주소 마지막에 '1'이 붙어있다.
// //   // http 프로토콜의 get 방식으로 데이터를 가져온다.
// //   // get은 가져온다는 뜻이 아나리 어떤 방식으로 데이터를 가져올지를 알려주는 방식(method)을 의미한다.
// //   final response = await http.get('https://jsonplaceholder.typicode.com/users/1');
// //
// //   // 웹 서버로부터 정상(200) 데이터 수신
// //   if (response.statusCode == 200) {
// //     // json 데이터를 수신해서 User 객체로 변환
// //     final userMap = json.decode(response.body);
// //     return User.fromJson(userMap);
// //
// //     // fromJson 생성자를 만들지 않고 직접 User 객체를 생성할 수도 있다.
// //     // return User(
// //     //    userId: userMap['id'],
// //     //    name: userMap['name'],
// //     //    email: userMap['email'],
// //     //    phone: userMap['phone'],
// //     //    company: userMap['company']
// //     //);
// //   }
// //
// //   // ok가 아니라면 예외 발생.
// //   // 실제 상황에서는 데이터 수신에 실패했을 때의 처리를 제공해야 한다.
// //   // 다시 읽어야 한다던가 빈 데이터 또는 에러를 표시한다던가.
// //   throw Exception('데이터 수신 실패!');
// // }
// //
// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     final style = TextStyle(fontSize: 21, height: 2.0);
// //     return Column(
// //       children: <Widget>[
// //         FutureBuilder(
// //           future: fetchUser(),
// //           builder: (context, snapshot) {
// //             if (snapshot.hasData) {
// //               // 변수에 저장할 필요없이 Text 위젯에 바로 전달해도 된다.
// //               // userId는 int 자료형을 갖기 때문에 문자열 변환이 필요하다.
// //               final userId = snapshot.data.userId.toString();
// //               final name = snapshot.data.name;
// //               final email = snapshot.data.email;
// //               final phone = snapshot.data.phone;
// //               final company = snapshot.data.company;
// //
// //               return Column(
// //                 children: <Widget>[
// //                   Center(child: Text(userId, style: style)),
// //                   Center(child: Text(name, style: style)),
// //                   Center(child: Text(email, style: style)),
// //                   Center(child: Text(phone, style: style)),
// //                   Center(child: Text(company['name'], style: style)),
// //                   Center(child: Text(company['catchPhrase'], style: style)),
// //                   Center(child: Text(company['bs'], style: style)),
// //                 ],
// //               );
// //             } else if (snapshot.hasError) {
// //               return Text('${snapshot.error}');
// //             }
// //
// //             return CircularProgressIndicator();
// //           },
// //         ),
// //       ],
// //     );
// //   }
// // }
// //
// //
