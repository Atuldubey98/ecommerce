part of 'shop_bloc.dart';

abstract class ShopState extends Equatable {
  const ShopState();
}

class ShopInitial extends ShopState {
  @override
  List<Object> get props => [];
}

class GroceryLoaded extends ShopState {
  final List<GroceryModel> groceryList;
  GroceryLoaded(this.groceryList);
  @override
  List<Object> get props => [groceryList];
}

class NokiaLoaded extends ShopState {
  final List<Nokia> nokiaList;
  NokiaLoaded(this.nokiaList);
  @override
  List<Object> get props => [nokiaList];
}

class SpringLoaded extends ShopState {
  final List<Spring> springList;
  SpringLoaded(this.springList);
  @override
  List<Object> get props => [springList];
}

class ShopLoading extends ShopState {
  ShopLoading();
  @override
  List<Object> get props => [];
}

class ShopError extends ShopState {
  final String message;
  ShopError(this.message);
  @override
  List<Object> get props => [message];
}
