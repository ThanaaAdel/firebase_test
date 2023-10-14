//
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
// class FirebaseMessage extends StatefulWidget {
//   const FirebaseMessage({super.key});
//
//   @override
//   State<FirebaseMessage> createState() => _FirebaseMessageState();
// }
//
// class _FirebaseMessageState extends State<FirebaseMessage> {
//   final FirebaseMessaging _firebaseMessage = FirebaseMessaging();
//   @override
//   void initState() {
//    configureCallback();
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       body: Container(),
//     );
//   }
//
//   void configureCallback() {
//     _firebaseMessage.configure(
//       onMessage : (message) async{
//         print('onMessage: $message');
//       }
//     );
//
//   }
// }
