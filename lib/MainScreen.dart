import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test1/Location.dart';
import 'package:test1/works/academic.dart';
import 'package:test1/works/attendence.dart';
import 'package:test1/constants.dart';
import 'package:test1/profile.dart';
import 'package:test1/works/timeTable.dart';
import 'loginScreen.dart';
import 'my_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:test1/Assignment/assignment.dart';
import 'firebase.dart';

class MainScreen extends StatefulWidget {
  static const String id = 'MainScreen';
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  double _opacity = 1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'JSSATE',
          textAlign: TextAlign.center,
        ),
        actions: <Widget>[
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Location.id);
              },
              icon: Icon(
                Icons.location_pin,
                color: Colors.white,
              ))
        ],
        backgroundColor: kColor,
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    AnimatedOpacity(
                      child: Text(
                        'WELCOME',
                        style: TextStyle(
                          fontSize: 50.0,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          color: kColor,
                        ),
                      ),
                      opacity: _opacity,
                      duration: Duration(seconds: 1),
                    ),
                    Test('viUKxGkirYPenVQc6dWvqDTA8kE2'),
                  ],
                ),
                SizedBox(
                  width: 40.0,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: getColor(Colors.white, kColor),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, Profile.id);
                  },
                  child: Hero(
                      tag: '123',
                      child: ProfilePic(
                        'viUKxGkirYPenVQc6dWvqDTA8kE2',
                      )),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50.0,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
                  color: kColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25.0),
                    topRight: Radius.circular(25.0),
                  )),
              child: Container(
                padding: EdgeInsets.all(24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: MyCard(
                            work: 'Attendence',
                            onPressed: () {
                              Navigator.pushNamed(context, Attendence.id);
                            },
                          ),
                        ),
                        SizedBox(
                          width: 30.0,
                        ),
                        Expanded(
                          child: MyCard(
                            work: 'Academic',
                            onPressed: () {
                              Navigator.pushNamed(context, Academic.id);
                            },
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: MyCard(
                            work: 'Work',
                            onPressed: () {
                              Navigator.pushNamed(context, Assignment.id);
                            },
                          ),
                        ),
                        SizedBox(
                          width: 30.0,
                        ),
                        Expanded(
                            child: MyCard(
                          work: 'Time Table',
                          onPressed: () {
                            Navigator.pushNamed(context, TimeTable.id);
                          },
                        )),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
