import 'dart:convert';

import 'package:ecommerceapp/models/spring.dart';
import 'package:ecommerceapp/utils/alllinks.dart';
import 'package:http/http.dart' as http;

abstract class GetSpring {
  Future getSpring();
}

class GetSpringRepository implements GetSpring {
  @override
  Future getSpring() async {
    final List<Spring> _springList = List<Spring>();
    final response = await http.get(Utils.URL + Utils.SEACHSPRING);
    final jsondata = json.decode(response.body);
    jsondata['data'].forEach((ele) {
      final Spring spring = Spring(
        brand: ele['Brand'],
        colorS: ele['Color'],
        id: ele['Product ID'],
        name: ele['Name'],
        price: ele['Price'].toString(),
        rating: ele['Rating Avg'].toString(),
      );
      _springList.add(spring);
    });
    return _springList;
  }
}
