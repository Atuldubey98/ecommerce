part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();
}

class CartInitial extends CartState {
  @override
  List<Object> get props => [];
}

class CartLoaded extends CartState {
  final List<CartItem> cartItemList;

  CartLoaded(this.cartItemList);
  @override
  List<Object> get props => [cartItemList];
}

class CartLoading extends CartState {

  @override
  List<Object> get props => [];
}
