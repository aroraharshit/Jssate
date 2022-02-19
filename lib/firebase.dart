import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'constants.dart';

class Test extends StatelessWidget {
  final String documentId;
  Test(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('student');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }
        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget>[
              Text(
                "${data['name']}",
                style: TextStyle(
                  color: kColor,
                  fontStyle: FontStyle.italic,
                  fontSize: 25.0,
                ),
              ),
              Text(
                "${data['year']}",
                style: TextStyle(
                  color: kColor,
                  fontStyle: FontStyle.italic,
                  fontSize: 15.0,
                ),
              ),
            ] ,
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}

class ProfilePic extends StatelessWidget {
  final String documentId;
  ProfilePic(this.documentId);
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('student');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }
        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          return  CircleAvatar(
            radius: 42.0,
            backgroundColor: kColor,
            child: CircleAvatar(
              radius: 40.0,
              backgroundImage:NetworkImage( '${data['profilePic']}'),
            ),
          );
        }
        return CircularProgressIndicator();
      },
    );
  }
}