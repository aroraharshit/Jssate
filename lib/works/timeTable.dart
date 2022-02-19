import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test1/constants.dart';

class TimeTable extends StatefulWidget {
  static const String id='timeTable';

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('timeTable');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Time Table',
        ),
        backgroundColor: kColor,
      ),
      body: Center(
        child: FutureBuilder<DocumentSnapshot>(
          future: users.doc('9J5KQz9IgCcqc0zvyejv').get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

            if (snapshot.hasError) {
              return Text("Something went wrong");
            }

            if (snapshot.hasData && !snapshot.data!.exists) {
              return Text("Document does not exist");
            }

            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
              return Image.network('${data['timeTable']}');
            }

            return Transform.scale(scale: .5,child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}