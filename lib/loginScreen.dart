import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test1/MainScreen.dart';
import 'RoundedButton.dart';
import 'constants.dart';
import 'MainScreen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';



class LoginScreen extends StatefulWidget {
  static const String id ='loginScreen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final auth = FirebaseAuth.instance;
  late String email;
  late String password;
  bool showSpinner = false;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'JSSATE',
              textAlign: TextAlign.center,
            ),
            backgroundColor: kColor,
          ),
          body: ModalProgressHUD(
            inAsyncCall: showSpinner,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children:<Widget>[
                Flexible(
                  child: Container(
                    height: 300.0,
                    child: Image.asset(
                      'images/JSS_Logo.png',
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.0,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.emailAddress,
                  cursorColor: Color(0xFFF8AD29),
                  onChanged: (value){
                    email=value;
                  },
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                  decoration: kTextField.copyWith(hintText: 'Enter your Email'),
                ),
                SizedBox(
                  height: 12.0,
                ),
                TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  onChanged: (value){
                    password=value;
                  },
                  style: TextStyle(
                    color: Colors.black87,
                  ),
                  decoration: kTextField.copyWith(hintText: 'Enter Password'),
                ),
                SizedBox(
                  height: 24.0,
                ),
                RoundedButton(
                  title: 'Log In',
                  color: Color(0xFFF8AD29),
                  onPressed: ()async{
                    setState(() {
                      showSpinner=true;
                    });
                    try{
                      final user = await auth.signInWithEmailAndPassword(email: email, password: password);
                      if(user!=null) {
                        Navigator.pushNamed(context, MainScreen.id);
                      }
                      setState(() {
                        showSpinner=false;
                      });
                    }
                    catch(e){
                      print(e);
                    }

                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
