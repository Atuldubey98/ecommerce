import 'dart:convert';

import 'package:ecommerceapp/models/grocery.dart';
import 'package:ecommerceapp/utils/alllinks.dart';

import 'package:http/http.dart' as http;

abstract class GetGroceryList {
  Future getGroceryItem();
}

class GetGroceryRepository implements GetGroceryList {
  @override
  Future getGroceryItem() async {
    List<GroceryModel> _groceryModelList = List<GroceryModel>();
    final response = await http.get(Utils.URL + Utils.GROCERY);
    if (response.statusCode > 200) {
      return "Down";
    }
    final jsonData = json.decode(response.body);
    jsonData['data'].forEach((ele) {
      final GroceryModel _groceryModel = GroceryModel(
          description: ele['description'],
          title: ele['title'],
          height: ele['height'].toString(),
          price: ele['price'].toString(),
          rating: ele['rating'],
          type: ele['type'],
          width: ele['width'].toString());
      _groceryModelList.add(_groceryModel);
    });
    return _groceryModelList;
  }
}
