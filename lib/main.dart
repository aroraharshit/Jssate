
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test1/Location.dart';
import 'package:test1/MainScreen.dart';
import 'package:test1/Assignment/assignment.dart';
import 'package:test1/works/academic.dart';
import 'package:test1/works/attendence.dart';
import 'package:test1/loginScreen.dart';
import 'package:test1/profile.dart';
import 'package:test1/works/timeTable.dart';
import 'loginScreen.dart';
import 'MainScreen.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splash: Image.asset(''
            'images/JSS_Logo.png',
        ),
        nextScreen: LoginScreen(),
        backgroundColor: Colors.white,
        splashTransition: SplashTransition.rotationTransition,
        splashIconSize: 250.0,
      ),
      routes: {
        Academic.id:(context)=>Academic(),
        LoginScreen.id: (context)=>LoginScreen(),
        MainScreen.id:(context)=>MainScreen(),
        Attendence.id:(context)=>Attendence(),
        Profile.id:(context)=>Profile(),
        Assignment.id:(context)=>Assignment(),
        TimeTable.id:(context)=>TimeTable(),
        Location.id:(context)=>Location(),
      },
  ),
  );
}

class Test1 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen(),
    );
  }
}

