import 'dart:convert';

import 'package:ecommerceapp/models/nokiaphone.dart';
import 'package:ecommerceapp/utils/alllinks.dart';

import 'package:http/http.dart' as http;

abstract class NokiaPhoneRep {
  Future getNokiaPhone();
}

class GetNokiaRepository implements NokiaPhoneRep {
  @override
  Future getNokiaPhone() async {
    List<Nokia> _nokiaList = List<Nokia>();
    final response = await http.get(Utils.URL + Utils.NOKIA);
    if (response.statusCode > 200) {
      return "Down";
    }
    final jsonData = json.decode(response.body);
    print(jsonData);
    jsonData['data'].forEach((ele) {
      final Nokia nokia = Nokia(
        os: ele['os'],
        phone: ele['phone'],
        size: ele['size_cm'].toString(),
      );
      _nokiaList.add(nokia);
    });
    return _nokiaList;
  }
}
