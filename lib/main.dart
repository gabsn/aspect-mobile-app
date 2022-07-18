/// --------------------------------------------------
/// main.dart
/// -> where it all begins ...
/// --------------------------------------------------
///
/// Imports ------------------------------------------
///External

import 'package:aspect_mobile_app/view/screens/main/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// View
import 'package:aspect_mobile_app/view_model/screens_view_model.dart';

/// Model
import 'package:aspect_mobile_app/model/constants/constants.dart';

/// Imports ------------------------------------------

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      home: const AspectMobileApp(),
    );
  }
}

class AspectMobileApp extends StatelessWidget {
  final String title = kAppTitle;
  //late bool isUserAuthenticated;
  final bool isUserAuthenticated = false;

  const AspectMobileApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => ScreensChangeNotifier(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          primaryColor: kStyleGuideColorViolet, //Color(0xFF0A0E21),
          scaffoldBackgroundColor: kStyleGuideColorOnyx, //Color(0xFF0A0D21),
        ),
        initialRoute: MainScreen.id,
        routes: {
          MainScreen.id: (context) => const MainScreen(title: kAppTitle),
        }, //MainScreen(title: title),
      ),
    );
  }
}
