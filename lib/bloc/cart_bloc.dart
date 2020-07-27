import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerceapp/models/cart.dart';
import 'package:ecommerceapp/repository/cartrepostory.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCartReposioryItems getCartRepository;

  CartBloc(this.getCartRepository) : super(null);

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    if (event is GetCart) {
      yield CartLoading();
      final list = await getCartRepository.getCartRepository();
      if (list == "NO") {
        yield CartInitial();
      }
      yield CartLoaded(list);
    }
  }
}
