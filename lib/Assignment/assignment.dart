import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test1/constants.dart';
import '../profile.dart';
class Assignment extends StatefulWidget {
  static const String id ='assignment';
  @override
  _AssignmentState createState() => _AssignmentState();
}

class _AssignmentState extends State<Assignment> {
  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('assignment').snapshots();
    return StreamBuilder<QuerySnapshot>(
      stream: _usersStream,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text('Something went wrong');
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            title: Text(
              'Work',
            ),
            backgroundColor: kColor,
          ),
          body: ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
              return Material(
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 15.0,),
                        button(header: data['sub1'], footer: ''),
                        button(header: data['sub2'], footer: ''),
                        button(header: data['sub3'], footer: ''),
                        button(header: data['sub4'], footer: ''),
                        button(header: data['sub5'], footer: ''),
                        button(header: data['sub6'], footer: ''),
                      ],
                    ),
                  );
            }).toList(),
          ),
        );
      },
    );
  }
}
class button extends StatelessWidget {
  button({required this.header,required this.footer});
  final String header;
  final String footer;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(vertical: 4.0),
        child: Material(
          elevation: 5.0,
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.0),
          child: MaterialButton(
            splashColor: kColor,
            onPressed: (){},
            minWidth: 200.0,
            height: 42.0,
            child: Tile(header: header,footer: footer,),
            ),
          ),
        );
  }
}
