import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final fireStore=FirebaseFirestore.instance;
final auth = FirebaseAuth.instance;
User ?loggedInUser;

class Attendence extends StatefulWidget {
  static const String id ='attendence';
  @override
  _AttendenceState createState() => _AttendenceState();
}

class _AttendenceState extends State<Attendence> {
  late Function holidays;
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  CalendarFormat format= CalendarFormat.month;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }
  void getCurrentUser()async{
    try{
      final user = await auth.currentUser;
      if(user!=null){
        loggedInUser=user;
      }
    }
    catch(e){
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kColor,
        title: Text(
          'ATTENDENCE',
        ),
      ),
      body: Column(
        children:<Widget> [
          TableCalendar(
          firstDay: DateTime(2000,12,22),
          focusedDay: focusedDay,
          lastDay:DateTime(2030,12,31),
          calendarFormat: format,
          onFormatChanged: (CalendarFormat _format){
            setState(() {
              format=_format;
            });
          },
          startingDayOfWeek: StartingDayOfWeek.monday,
          daysOfWeekVisible: true,
          onDaySelected: (DateTime selectedDay,DateTime focusedDay){
            setState(() {
              selectedDay=selectedDay;
              focusedDay=focusedDay;
            });
            print(selectedDay);
        },
          selectedDayPredicate: (DateTime date){
            return isSameDay(selectedDay,date);
          },
          calendarStyle: CalendarStyle(
            isTodayHighlighted: true,
           selectedDecoration: BoxDecoration(
             color: kColor,
             shape: BoxShape.circle,
           ),
            selectedTextStyle: TextStyle(color: Colors.white),
            todayDecoration: BoxDecoration(
              color: kColor,
              shape: BoxShape.rectangle,
            ),
            defaultDecoration:  BoxDecoration(
              shape: BoxShape.circle,
            ),
            weekendDecoration:  BoxDecoration(
              color: Colors.blueAccent,
              shape: BoxShape.circle,
            ),
          ),
          headerStyle: HeaderStyle(
            formatButtonVisible: true,
            titleCentered: true,
            formatButtonDecoration: BoxDecoration(
              color: kColor,
              borderRadius: BorderRadius.circular(10.0),
            ),
              formatButtonTextStyle: TextStyle(
              color: Colors.white,
          )
          ),
        ),
          Column(
            children: <Widget>[
              Row(
                children:<Widget> [
                  Icon(
                    Icons.circle,
                  size: 45.0,
                  color: Colors.blueAccent,
                  ),
                  Text(
                    'Holiday'
                  ),
                ],
              ),
              Row(
                children:<Widget> [
                  Icon(
                    Icons.circle,
                    size: 45.0,
                    color: Colors.green,
                  ),
                  Text(
                      'Present'
                  ),
                ],
              ),
              Row(
                children:<Widget> [
                  Icon(
                    Icons.circle,
                    size: 45.0,
                    color: Colors.red,
                  ),
                  Text(
                      'Absent'
                  ),
                ],
              ),
            ],
          ),
       ],
      ),

    );
  }
}

