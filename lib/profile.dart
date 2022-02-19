import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'constants.dart';

class Profile extends StatelessWidget {
    static const String id ='profile';
    final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance.collection('info').snapshots();

    @override
    Widget build(BuildContext context) {
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
                'Info',
              ),
              backgroundColor: kColor,
            ),
            body: ListView(
              children: snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                return Material(
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 30.0,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          CircleAvatar(
                              radius: 82.0,
                              backgroundColor: Colors.white,
                              child: Hero(
                                tag: '123',
                                child: CircleAvatar(
                                  radius: 80.0,
                                  backgroundImage: NetworkImage(data['profilePic']),
                                ),
                              ),
                            ),
                        ],
                      ),
                      SizedBox(height: 30.0,),
                      Tile(header:data['name'],footer: 'Name'),
                      Tile(header:data['branch'],footer: 'Branch'),
                      Tile(header:data['Cource'],footer: 'Cource',),
                      Tile(header:data['Year'],footer: 'Year',),
                      Tile(header:data['Semester'],footer: 'Semester',),
                      Tile(header:data['Batch'],footer: 'Batch',),
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
class Tile extends StatelessWidget {

  final String header;
  final String footer;
  Tile({required this.header,required this.footer});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.0,vertical: 5.0),
      child: Column(
        children:<Widget>[
          Center(
            child: Container(
              child: ListTile(
                title: Text(
                  header,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
                subtitle: Text(footer),
              ),
            ),
          ),
          SizedBox(height: 20.0,),
        ],
      ),
    );
  }
}
