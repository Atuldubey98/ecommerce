import 'dart:async';

import 'package:ecommerceapp/models/cart.dart';

class ItemAddBloc {
  var _itemControler = StreamController<int>.broadcast();
  Stream get itemStream => _itemControler.stream;
  Function(int) get itemSink => _itemControler.sink.add;
  void dispose() {
    _itemControler?.close();
  }
}

ItemAddBloc itemAddBloc = ItemAddBloc();

class CartIncrement {
  var _cartController = StreamController<CartItem>.broadcast();
  Stream get cartStream => _cartController.stream;
  Function(CartItem) get cartSink => _cartController.sink.add;
  void dispose() {
    _cartController.close();
  }

  CartIncrement() {
    cartStream.listen((event) {});
  }
}

CartIncrement cartIncrement = CartIncrement();
