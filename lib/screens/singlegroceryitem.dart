import 'package:ecommerceapp/models/grocery.dart';
import 'package:ecommerceapp/widgets/primarywidget.dart';
import 'package:ecommerceapp/widgets/secondarywidget.dart';
import 'package:flutter/material.dart';

class GroceryOneItem extends StatelessWidget {
  final GroceryModel groceryModel;
  const GroceryOneItem({Key key, this.groceryModel}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(groceryModel.title, true),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            buildContainerforText(groceryModel.title, 0, 0, 20,
                Alignment.centerLeft, FontWeight.bold),
            Flexible(
              child: Text(
                groceryModel.description,
                style: TextStyle(fontSize: 20),
              ),
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
                  Icon(Icons.star, color: Colors.yellow),
                ],
              ),
            ),
            buildSizedBox(20, 0),
            buildContainerforText("Rs. " + groceryModel.price.toString(), 0, 0,
                20, Alignment.centerLeft, FontWeight.bold),
            buildContainerforText("Type: " + groceryModel.type, 0, 0, 20,
                Alignment.centerLeft, FontWeight.normal),
            Divider()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_shopping_cart),
        backgroundColor: getPrimaryColor(),
        onPressed: () {},
      ),
    );
  }
}
