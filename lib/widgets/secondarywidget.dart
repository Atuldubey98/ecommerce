import 'package:ecommerceapp/widgets/primarywidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Container buildContainerforText(String item, double left, double right,
    double size, Alignment align, FontWeight fontWeight) {
  return Container(
    child: Text(
      item,
      style: TextStyle(fontWeight: fontWeight, fontSize: size),
    ),
    alignment: align,
    padding: EdgeInsets.only(
      left: left,
      right: right,
    ),
  );
}

SizedBox buildSizedBox(double height, double width) {
  return SizedBox(
    height: height,
    width: width,
  );
}

Text buildTextItem(String item, double size, Color c, FontWeight fw) {
  return Text(
    item,
    style: TextStyle(fontSize: size, color: c, fontWeight: fw),
  );
}

Container buildContainerButton(String item, Color color, Color txtCo,
    double radius, double width, Alignment align) {
  return Container(
    alignment: align,
    padding: EdgeInsets.only(left: 8, right: 8, top: 8, bottom: 8),
    width: width,
    child: Text(
      item,
      style: TextStyle(color: txtCo),
    ),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius), color: color),
  );
}

Drawer buildDrawer() {
  return Drawer(
    elevation: 0,
    child: Container(
      padding: EdgeInsets.only(top: 30),
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 60,
            backgroundColor: getPrimaryColor(),
          ),
        ],
      ),
    ),
  );
}

TextField buildTextField(TextEditingController controller, String item) {
  return TextField(
    controller: controller,
    cursorRadius: Radius.circular(20),
    decoration: InputDecoration(
      hintText: item,
      border: InputBorder.none,
      contentPadding: EdgeInsets.only(right: 8, left: 8),
      focusColor: getPrimaryColor(),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
  );
}
