import 'package:ecommerceapp/bloc/cart_bloc.dart';
import 'package:ecommerceapp/models/cart.dart';
import 'package:ecommerceapp/widgets/primarywidget.dart';
import 'package:ecommerceapp/widgets/secondarywidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void didChangeDependencies() {
    BlocProvider.of<CartBloc>(context)..add(GetCart());
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final double width2 = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: buildAppBar("My Cart", true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: width2 * 0.9,
              decoration: BoxDecoration(
                  color: Colors.indigo[200],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: ListTile(
                title: Text(
                  "Items",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                trailing:
                    buildTextItem("Amount", 20, Colors.black, FontWeight.bold),
              ),
            ),
            Container(
              width: width2 * 0.9,
              decoration: BoxDecoration(
                color: Colors.blueGrey[100],
              ),
              child: BlocConsumer<CartBloc, CartState>(
                listener: (context, state) {},
                builder: (context, state) {
                  if (state is CartLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state is CartInitial) {
                    return Center(
                      child: ListTile(title: Text("Add Item to Cart")),
                    );
                  } else if (state is CartLoaded) {
                    return buidColumnOutput(state.cartItemList);
                  }
                  return Container();
                },
              ),
            ),
            Container(
              width: width2 * 0.9,
              decoration: BoxDecoration(
                color: Colors.indigo[100],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(
                    20,
                  ),
                ),
              ),
              child: ListTile(
                title: Text(
                  "Grand Total :",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buidColumnOutput(List<CartItem> cartItem) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, i) {
        return ListTile(
            title: Text(cartItem[i].title),
            subtitle: Text(
              "Quantity X Rate: " + cartItem[i].qty.toString(),
            ));
      },
      itemCount: cartItem.length,
    );
  }
}
