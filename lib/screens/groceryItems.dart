import 'package:ecommerceapp/models/cart.dart';
import 'package:ecommerceapp/models/grocery.dart';
import 'package:ecommerceapp/screens/singlegroceryitem.dart';
import 'package:ecommerceapp/widgets/primarywidget.dart';

import 'package:flutter/material.dart';

class GroceryScreen extends StatefulWidget {
  final List<GroceryModel> groceryModel;
  final Function callbackfunction;
  GroceryScreen(this.groceryModel, this.callbackfunction);

  @override
  _GroceryScreenState createState() => _GroceryScreenState();
}

class _GroceryScreenState extends State<GroceryScreen> {
  Map<String, GroceryModel> groceryData = Map();
  List<String> keysItem = List();
  void generate() {
    widget.groceryModel.forEach((element) {
      groceryData[element.id] = element;
    });
    keysItem = groceryData.keys.toList();
  }

  @override
  Widget build(BuildContext context) {
    generate();
    return Scaffold(
        appBar: buildAppBar("Grocery", true),
        body: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            GroceryModel groceryModel = groceryData[keysItem[index]];
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
                          groceryModel.title,
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
                                groceryModel: groceryModel,
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
                          groceryModel.rating.toString(),
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
                      "Rs." + groceryModel.price.toString(),
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
                          "Type : " + groceryModel.type,
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
                                  final CartItem cartItem = CartItem(
                                      groceryData[keysItem[index]].id,
                                      1,
                                      groceryData[keysItem[index]].title);
                                  widget.callbackfunction(cartItem);
                                  setState(() {
                                    groceryData[keysItem[index]].qty++;
                                  });
                                }),
                            Container(
                              padding: EdgeInsets.only(
                                left: 10,
                                right: 10,
                                top: 2,
                              ),
                              child: Text(
                                groceryData[keysItem[index]].qty.toString(),
                                style: TextStyle(color: Colors.white),
                              ),
                              decoration: BoxDecoration(
                                color: getPrimaryColor(),
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            IconButton(
                                icon: Icon(Icons.delete_outline),
                                onPressed: () {
                                  if (groceryData[keysItem[index]].qty > 0) {
                                    setState(() {
                                      groceryData[keysItem[index]].qty++;
                                    });
                                  }
                                })
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
          itemCount: widget.groceryModel.length,
        ));
  }
}
