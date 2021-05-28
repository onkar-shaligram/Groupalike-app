import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:groupalike/Sign%20Up/cityandDOBForm.dart';
import 'package:groupalike/Sign%20Up/signupForm.dart';
import 'package:groupalike/Sign%20Up/signupLandingPage.dart';
import 'package:groupalike/UI/Homepage.dart';
import 'package:groupalike/UI/landingpage.dart';
import 'package:groupalike/UI/signin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      // home: CityandDOBForm(),
      
      routes: {
        "/": (BuildContext context) => CityandDOBForm(),
        "/signin": (BuildContext context) => SignIn(),
        "/signup": (BuildContext context) => SignupForm(),
        "/home": (BuildContext context) => HomeScreen(),
      },
      initialRoute: "/signin",
    );
  }
}