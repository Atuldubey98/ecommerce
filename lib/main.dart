import 'package:ecommerceapp/bloc/shop_bloc.dart';
import 'package:ecommerceapp/repository/groceryrep.dart';
import 'package:ecommerceapp/repository/nokiarep.dart';
import 'package:ecommerceapp/repository/springrep.dart';
import 'package:ecommerceapp/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShopBloc(
          GetGroceryRepository(), GetNokiaRepository(), GetSpringRepository()),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop IT',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
