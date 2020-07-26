import 'package:ecommerceapp/models/spring.dart';
import 'package:ecommerceapp/widgets/primarywidget.dart';
import 'package:ecommerceapp/widgets/secondarywidget.dart';
import 'package:flutter/material.dart';

class SpringScreen extends StatelessWidget {
  final List<Spring> springList;
  const SpringScreen({this.springList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Spring", true),
      body: ListView.separated(
          itemBuilder: (context, i) {
            return buildColumnOut(springList[i]);
          },
          separatorBuilder: (context, i) {
            return Divider();
          },
          itemCount: springList.length),
    );
  }

  Widget buildColumnOut(Spring spring) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          buildContainerforText(
              spring.name, 8, 8, 20, Alignment.centerLeft, FontWeight.bold),
          buildContainerforText(
              spring.brand, 8, 8, 15, Alignment.centerLeft, FontWeight.normal),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              buildContainerforText(spring.rating, 0, 8, 15,
                  Alignment.bottomRight, FontWeight.normal),
              Icon(
                Icons.star,
                color: Colors.yellow,
              )
            ],
          ),
          buildContainerforText("Rs " + spring.price, 8, 8, 20,
              Alignment.bottomLeft, FontWeight.normal),
          buildContainerforText(
              spring.colorS, 8, 8, 20, Alignment.bottomLeft, FontWeight.normal)
        ],
      ),
    );
  }
}
