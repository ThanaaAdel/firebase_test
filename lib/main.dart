import 'dart:developer';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message ) async{
  if(kDebugMode){
    print(message.messageId);
  }
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await FirebaseMessaging.instance.setAutoInitEnabled(true);
  final fcmToken = await FirebaseMessaging.instance.getToken();
  log("FCMToken $fcmToken");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
void requestPermission() async{
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  if(settings.authorizationStatus == AuthorizationStatus.authorized){
    print('user Granted permission');
  }
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print(
      'Title :${message.notification?.title} | Body : ${message.notification?.body}');
  });
  print('User granted permission: ${settings.authorizationStatus}');
}
@override
  void initState() {

    // TODO: implement initState
    super.initState();
    requestPermission();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Demo Home Page'),centerTitle: true,),
      body: Column(
        children: [
          const Center(
            child: Text('notifications'),
          ),
          TextButton(onPressed: () async{
            await FirebaseMessaging.instance.getToken().then((token){
              print('my token : $token');
            });
                      }, child: const Text('Get Token ')),
        ],
      ),
    );
  }
}

