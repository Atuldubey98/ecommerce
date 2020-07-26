import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:ecommerceapp/models/grocery.dart';
import 'package:ecommerceapp/models/nokiaphone.dart';
import 'package:ecommerceapp/models/spring.dart';
import 'package:ecommerceapp/repository/groceryrep.dart';
import 'package:ecommerceapp/repository/nokiarep.dart';
import 'package:ecommerceapp/repository/springrep.dart';
import 'package:equatable/equatable.dart';

part 'shop_event.dart';
part 'shop_state.dart';

class ShopBloc extends Bloc<ShopEvent, ShopState> {
  final GetGroceryRepository _groceryRepository;
  final GetNokiaRepository getNokiaRepository;
  final GetSpringRepository getSpringRepository;
  ShopBloc(this._groceryRepository, this.getNokiaRepository,
      this.getSpringRepository)
      : super(null);
  @override
  Stream<ShopState> mapEventToState(
    ShopEvent event,
  ) async* {
    yield ShopLoading();
    if (event is GetGrocery) {
      final groceryList = await _groceryRepository.getGroceryItem();
      if (groceryList == "Down") {
        yield ShopError("Down");
      }
      yield GroceryLoaded(groceryList);
    }
    if (event is GetNokia) {
      final nokiaList = await getNokiaRepository.getNokiaPhone();
      yield NokiaLoaded(nokiaList);
      if (nokiaList == "Down") {
        yield ShopError("Down");
      }
    }
    if (event is GetSpring) {
      final springList = await getSpringRepository.getSpring();
      yield SpringLoaded(springList);
    }
  }
}
