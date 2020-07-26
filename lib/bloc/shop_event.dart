part of 'shop_bloc.dart';

abstract class ShopEvent extends Equatable {
  const ShopEvent();
}

class GetGrocery extends ShopEvent {
  @override
  List<Object> get props => [];
}

class GetNokia extends ShopEvent {
  @override
  List<Object> get props => [];
}

class GetSpring extends ShopEvent {
  @override
  List<Object> get props => [];
}
