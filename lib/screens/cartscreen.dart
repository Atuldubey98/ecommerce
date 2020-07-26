import 'package:ecommerceapp/widgets/primarywidget.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("My Cart", true),
    );
  }
}
