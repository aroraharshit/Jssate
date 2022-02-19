import 'package:flutter/material.dart';
const kColor =Color(0xFFF8AD29);
const kTextField =InputDecoration(
  hintText: 'Enter a value',
  hintStyle: TextStyle(
    color: Colors.black38,
  ),
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFF8AD29), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xFFF8AD29), width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);
MaterialStateProperty<Color> getColor(Color color,Color colorPressed){
  final getColor = (Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return colorPressed;
    } else {
      return color;
    }
  };
  return MaterialStateProperty.resolveWith(getColor);
}

MaterialStateProperty<BorderSide> getBorder(Color color,Color colorPressed){
  final getBorder = (Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return BorderSide(color: colorPressed,width: 2);
    } else {
      return BorderSide(color: color,width: 2);
    }
  };
  return MaterialStateProperty.resolveWith(getBorder);
}
MaterialStateProperty<OutlinedBorder> getOborder(Color color,Color colorPressed){
  final getOborder = (Set<MaterialState> states) {
    if (states.contains(MaterialState.pressed)) {
      return RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));
    } else {
      return RoundedRectangleBorder(borderRadius: BorderRadius.circular(20));
    }
  };
  return MaterialStateProperty.resolveWith(getOborder);
}