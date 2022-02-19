import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'constants.dart';

class MyCard extends StatelessWidget {
  MyCard({required this.work,required this.onPressed});
  final String work;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: getColor(Colors.white, kColor),
          foregroundColor: getColor(kColor, Colors.white),
          side: getBorder(kColor, Colors.white),
          shape: getOborder(kColor, Colors.white),
        ),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                width: 150.0,
                height: 130.0,
                child: Center(
                  child: Text(
                    work,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: kColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
    );
  }
}

