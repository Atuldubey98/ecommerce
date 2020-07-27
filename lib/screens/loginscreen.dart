import 'package:ecommerceapp/repository/authenticaterep.dart';
import 'package:ecommerceapp/screens/homepage.dart';
import 'package:ecommerceapp/screens/registerscreen.dart';
import 'package:ecommerceapp/widgets/primarywidget.dart';
import 'package:ecommerceapp/widgets/secondarywidget.dart';
import 'package:flutter/material.dart';

class AuthenticateScreen extends StatefulWidget {
  @override
  _AuthenticateScreenState createState() => _AuthenticateScreenState();
}

class _AuthenticateScreenState extends State<AuthenticateScreen> {
  final formkey = GlobalKey<FormState>();

  TextEditingController usernameController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  loginMyself() {
    authenticateMe.loginMe(usernameController.text, passController.text).then(
      (value) {
        if (value == false) {
          showDialog(
            context: (context),
            builder: (context) => AlertDialog(
              content: Text("Username incorect"),
            ),
          );
        }
        if (value == "Down") {
          showDialog(
            context: (context),
            builder: (context) => AlertDialog(
              content: Text("Server Down"),
            ),
          );
        }
        if (value == true) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => MyHomePage(),
            ),
          );
        }
      },
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    passController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Login Screen", true),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(41, 128, 185, 0.2),
        ),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  Column(
                    children: <Widget>[
                      buildSizedBox(20, 0),
                      Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              buildSizedBox(20, 0),
                              _UsernameEntry(
                                  usernameController: usernameController),
                              buildSizedBox(20, 0),
                              _PasswordEntry(passController: passController),
                              buildSizedBox(20, 0),
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          loginMyself();
                        },
                        child: buildContainerButton(
                            "Login",
                            Color.fromRGBO(41, 128, 185, 1),
                            Colors.white,
                            20,
                            100,
                            Alignment.center),
                      ),
                      buildSizedBox(10, 0),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ),
                          );
                        },
                        child: buildContainerButton(
                            "Register Screen",
                            Color.fromRGBO(41, 128, 185, 1),
                            Colors.white,
                            20,
                            250,
                            Alignment.center),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _PasswordEntry extends StatelessWidget {
  const _PasswordEntry({
    Key key,
    @required this.passController,
  }) : super(key: key);

  final TextEditingController passController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: true,
        validator: (value) {
          return value.length > 6
              ? null
              : "Please Provide passowrd greater than 6 character";
        },
        controller: passController,
        decoration: simpleInputDecoration("Password"));
  }
}

class _UsernameEntry extends StatelessWidget {
  const _UsernameEntry({
    Key key,
    @required this.usernameController,
  }) : super(key: key);

  final TextEditingController usernameController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: usernameController,
      style: TextStyle(
        fontSize: 20,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(8),
        hintText: "Enter username",
        hintStyle: TextStyle(fontSize: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
