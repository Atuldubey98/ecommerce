import 'package:ecommerceapp/bloc/cart_bloc.dart';
import 'package:ecommerceapp/bloc/shop_bloc.dart';
import 'package:ecommerceapp/models/userdata.dart';
import 'package:ecommerceapp/repository/cartrepostory.dart';
import 'package:ecommerceapp/repository/groceryrep.dart';
import 'package:ecommerceapp/repository/nokiarep.dart';
import 'package:ecommerceapp/repository/springrep.dart';
import 'package:ecommerceapp/screens/homepage.dart';
import './repository/authenticaterep.dart';
import 'package:ecommerceapp/screens/loginscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ShopBloc(
            GetGroceryRepository(),
            GetNokiaRepository(),
            GetSpringRepository(),
          ),
        ),
        BlocProvider(
          create: (context) => CartBloc(GetCartReposioryItems()),
          child: Container(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Shop IT',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: FutureBuilder(
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                print(userData.uname);
                print(userData.id);
                if (snapshot.data == true) {
                  return MyHomePage();
                }
                return AuthenticateScreen();
              }
              return AuthenticateScreen();
            },
            future: authenticateMe.tryLogin()),
      ),
    );
  }
}
