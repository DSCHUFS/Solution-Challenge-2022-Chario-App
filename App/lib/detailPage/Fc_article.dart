// // import 'package:flutter/material.dart';
// //
// // import '../api/ContentsApi.dart';
// //
// // class Fc_article extends StatefulWidget {
// //   const Fc_article({
// //     Key? key,
// //     required this.contents_id,}) : super(key: key);
// //
// //   @override
// //   _Fc_articleState createState() => _Fc_articleState();
// //   late Future<ContentsApi> ContentFcJdata;
// //   final int contents_id;
// // }
// //
// // class _Fc_articleState extends State<Fc_article> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Container();
// //   }
// // }
// import 'package:flutter/material.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   static const String _title = 'Flutter Code Sample';
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: _title,
//       home: Scaffold(
//         appBar: AppBar(title: const Text(_title)),
//         // body: const Center(
//           child: MyStatelessWidget(),
//         ),
//       ),
//     );
//   }
// }
//
// class MyStatelessWidget extends StatelessWidget {
//   const MyStatelessWidget({Key? key}) : super(key: key);
//
//
//   @override
//   Widget build(BuildContext context) {
//     return TextButton(
//       onPressed: () => showDialog<String>(
//         context: context,
//         builder: (BuildContext context) => AlertDialog(
//           title: const Text('AlertDialog Title'),
//           content: const Text('AlertDialog description'),
//           actions: <Widget>[
//             TextButton(
//               onPressed: () => Navigator.pop(context, 'Cancel'),
//               child: const Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () => Navigator.pop(context, 'OK'),
//               child: const Text('OK'),
//             ),
//           ],
//         ),
//       ),
//       child: const Text('Show Dialog'),
//     );
//   }
//   Future<void> _showMyDialog() async {
//     return showDialog<void>(
//       context: context,
//       barrierDismissible: false, // user must tap button!
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: const Text('AlertDialog Title'),
//           content: SingleChildScrollView(
//             child: ListBody(
//               children: const <Widget>[
//                 Text('This is a demo alert dialog.'),
//                 Text('Would you like to approve of this message?'),
//               ],
//             ),
//           ),
//           actions: <Widget>[
//             TextButton(
//               child: const Text('Approve'),
//               onPressed: () {
//                 Navigator.of(context).pop();
//               },
//             ),
//           ],
//         );
//       },
//     );
//   }
// }
//
