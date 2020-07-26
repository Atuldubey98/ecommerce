import 'package:ecommerceapp/bloc/incrementbloc.dart';
import 'package:ecommerceapp/models/cart.dart';
import 'package:ecommerceapp/models/grocery.dart';
import 'package:ecommerceapp/screens/singlegroceryitem.dart';
import 'package:ecommerceapp/widgets/primarywidget.dart';

import 'package:flutter/material.dart';

class GroceryScreen extends StatelessWidget {
  final List<GroceryModel> groceryModel;

  GroceryScreen(this.groceryModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar("Grocery", true),
        body: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 20,
                        width: 200,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          groceryModel[index].title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GroceryOneItem(
                                groceryModel: groceryModel[index],
                              ),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: getPrimaryColor(),
                          ),
                          padding: EdgeInsets.all(8),
                          child: Row(
                            children: <Widget>[
                              Text(
                                "Get Details",
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.chevron_right,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 9, right: 6),
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: <Widget>[
                        Text(
                          groceryModel[index].rating.toString(),
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(Icons.star),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    height: 20,
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Rs." + groceryModel[index].price,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Container(
                        height: 20,
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Type : " + groceryModel[index].type,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Container(
                        child: Row(
                          children: <Widget>[
                            IconButton(
                                icon: Icon(Icons.plus_one),
                                onPressed: () {
                                  cartIncrement.cartSink(CartItem(
                                      groceryModel[index].filename,
                                      1,
                                      groceryModel[index].type));
                                  print(groceryModel[index].title);
                                }),
                            Container(
                              padding:
                                  EdgeInsets.only(left: 10, right: 10, top: 2),
                              child: Text(
                                "0",
                                style: TextStyle(color: Colors.white),
                              ),
                              decoration: BoxDecoration(
                                color: getPrimaryColor(),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            IconButton(
                                icon: Icon(Icons.delete_outline),
                                onPressed: () {})
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider()
                ],
              ),
            );
          },
          itemCount: groceryModel.length,
        ));
  }
}
