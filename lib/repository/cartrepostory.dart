import 'dart:convert';

import 'package:ecommerceapp/models/cart.dart';
import 'package:ecommerceapp/models/userdata.dart';
import 'package:ecommerceapp/utils/alllinks.dart';
import 'package:http/http.dart' as http;

abstract class GetCartRepository {
  Future getCartRepository();
}

class GetCartReposioryItems implements GetCartRepository {
  @override
  Future getCartRepository() async {
    List<CartItem> _cartItemList = List();
    final response =
        await http.get(Utils.URL + Utils.getcartlist + userData.id);
    final jsondata = json.decode(response.body);
    if (response.statusCode > 200) {
      print("serverdown");
    }
    print(jsondata);
    if (jsondata['data'] == "NO") {
      return "NO";
    }
    jsondata["data"].forEach((ele) {
      final CartItem cartItem =
          CartItem(ele['itemid'].toString(), ele['qty'], ele['title']);
      _cartItemList.add(cartItem);
    });
    return _cartItemList;
  }
}
