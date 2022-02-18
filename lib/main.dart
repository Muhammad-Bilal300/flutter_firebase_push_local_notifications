import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:my_app/red.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_app/services/local_notification_services.dart';
import 'package:my_app/signIn.dart';
import 'package:my_app/translations/codegen_loader.g.dart';
import 'firebase_options.dart';

import 'green.dart';

// Receive message when the app is in background solution for on Message
Future<void> backgroundHandler(RemoteMessage message) async {
  print(message.data.toString());
  print(message.notification!.title);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Recieve message when app is in background , solution for onMessage
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  runApp(
    EasyLocalization(
        saveLocale: true,
        supportedLocales: [Locale('en'), Locale('ar')],
        path:
            'assets/translations', // <-- change the path of the translation files
        fallbackLocale: Locale('en'),
        assetLoader: CodegenLoader(),
        child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        title: "Push Notification",
      ),
      routes: {"red": (_) => RedPage(), "green": (_) => GreenPage()},
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    LocalNotificationServices.initialize(context);

    // FirebaseMessaging.instance.getInitialMessage();

// Gives you the message on which user taps and it gives the app from terminatedState
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        final routeFromMesssage = message.data["route"];
        Navigator.of(context).pushNamed(routeFromMesssage);
      }
    });

// Foreground Work
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        print(message.notification!.title);
        print(message.notification!.body);
      }
// This work for heads of notification for both when the app is in foreground or in background
      LocalNotificationServices.display(message);
    });

// When the app is in background but opened and user taps on the notification

    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      final routeFromMesssage = message.data["route"];

      Navigator.of(context).pushNamed(routeFromMesssage);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Container(
          child: Center(
            child: Text(
              "You will recieve message soon",
              style: TextStyle(fontSize: 34),
            ),
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
