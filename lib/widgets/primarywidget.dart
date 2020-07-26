import 'package:flutter/material.dart';

AppBar buildAppBar(String heading, bool isCentre) {
  return AppBar(
    centerTitle: isCentre,
    elevation: 0,
    backgroundColor: getPrimaryColor(),
    title: Text(heading),
  );
}

Color getPrimaryColor() {
  return Color.fromRGBO(107, 105, 214, 1);
}

Color getSeconDaryColor() {
  return Colors.white;
}
