import 'dart:convert';
import 'package:ecommerceapp/models/userdata.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ecommerceapp/utils/alllinks.dart';
import 'package:http/http.dart' as http;

class AuthenticateMe {
  Future tryLogin() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getString("uid") == null || prefs.getString("username") == null) {
      return false;
    }
    userData.uname = prefs.getString("username");
    userData.id = prefs.getString("uid");
    return true;
  }

  Future loginMe(String username, String password) async {
    final response = await http.post(Utils.URL + Utils.loginme,
        body: json.encode(
          {"user": username, "password": password},
        ),
        headers: Utils.headers2);
    if (response.statusCode > 200) {
      return "Down";
    }
    final jsondata = json.decode(response.body);
    if (jsondata['status'] == "notok") {
      return false;
    }
    final prefs = await SharedPreferences.getInstance();
    prefs.setString("username", username);
    prefs.setString("uid", jsondata['uid']);
    userData.uname = prefs.getString("username");
    userData.id = prefs.getString("uid");
    return true;
  }

  Future registerMe(String username, String password) async {
    final response = await http.post(Utils.URL + Utils.registerme,
        body: json.encode(
          {
            "user": username,
            "password": password,
            "uniqueid": username + DateTime.now().toString()
          },
        ),
        headers: Utils.headers2);
    print(response.statusCode);
    if (response.statusCode > 200) {
      return "Down";
    }

    final jsondata = json.decode(response.body);
    print(jsondata);
    if (jsondata['status'] == "notok") {
      return false;
    } else if (jsondata['status'] == "OK") {
      return true;
    }
  }
}

AuthenticateMe authenticateMe = new AuthenticateMe();
