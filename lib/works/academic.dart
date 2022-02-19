import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test1/constants.dart';


class Academic extends StatefulWidget {
  static const String id='Academic';

  @override
  State<Academic> createState() => _AcademicState();
}

class _AcademicState extends State<Academic> {
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('Academic');

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Academic',
        ),
        backgroundColor: kColor,
      ),
      body: Center(
        child: FutureBuilder<DocumentSnapshot>(
          future: users.doc('dbMkuL17kMd98IauCofj').get(),
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
              return Image.network('${data['Academic']}');
            }

            return Transform.scale(scale: .5,child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}