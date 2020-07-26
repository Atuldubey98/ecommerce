import 'package:ecommerceapp/bloc/shop_bloc.dart';
import 'package:ecommerceapp/screens/cartscreen.dart';
import 'package:ecommerceapp/screens/groceryItems.dart';
import 'package:ecommerceapp/screens/nokiascreen.dart';
import 'package:ecommerceapp/screens/springscreen.dart';
import 'package:ecommerceapp/widgets/primarywidget.dart';
import 'package:ecommerceapp/widgets/secondarywidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController searchControler = new TextEditingController();

  @override
  void dispose() {
    searchControler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: BlocConsumer<ShopBloc, ShopState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is ShopLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GroceryLoaded) {
            return GroceryScreen(state.groceryList);
          } else if (state is NokiaLoaded) {
            return NokiaScreen(nokiaList: state.nokiaList);
          } else if (state is SpringLoaded) {
            return SpringScreen(
              springList: state.springList,
            );
          }
          if (state is ShopError) {
            return Center(
              child: Text(state.message),
            );
          }
          return Center(
            child: Text("Select One Categary"),
          );
        },
      ),
      appBar: AppBar(
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CartScreen(),
                ),
              );
            },
            child: Stack(children: <Widget>[
              Container(
                padding: EdgeInsets.all(20),
                child: Icon(Icons.shopping_cart),
              ),
              CircleAvatar(
                radius: 10,
                child: Text("1"),
                backgroundColor: Colors.white,
              )
            ]),
          ),
          DropDownWidget()
        ],
        elevation: 0,
        backgroundColor: getPrimaryColor(),
        title: Text(
          "Shop It",
          style: TextStyle(fontSize: 20),
        ),
        bottom: PreferredSize(
          child: Container(
            padding: EdgeInsets.all(3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      color: Colors.blueGrey[50],
                      borderRadius: BorderRadius.circular(30)),
                  width: width * 0.7,
                  child: buildTextField(searchControler, "Search For Item ..."),
                ),
                buildContainerButton("Search", Colors.blueGrey[100],
                    Colors.black, 30, width * 0.2, Alignment.center),
              ],
            ),
          ),
          preferredSize: Size.fromHeight(height * 0.09),
        ),
      ),
      drawer: buildDrawer(),
    );
  }
}

class DropDownWidget extends StatefulWidget {
  const DropDownWidget({
    Key key,
  }) : super(key: key);

  @override
  _DropDownWidgetState createState() => _DropDownWidgetState();
}

class _DropDownWidgetState extends State<DropDownWidget> {
  int _dropDownvalue = 1;
  @override
  Widget build(BuildContext context) {
    print("building");

    return Container(
      decoration: BoxDecoration(
        color: getSeconDaryColor(),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButton(
        dropdownColor: Colors.white,
        focusColor: getPrimaryColor(),
        elevation: 0,
        iconDisabledColor: Colors.white,
        hint: Text("Select Category"),
        value: _dropDownvalue,
        items: [
          DropdownMenuItem(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Grocery",
              ),
            ),
            value: 1,
          ),
          DropdownMenuItem(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Spring"),
            ),
            value: 2,
          ),
          DropdownMenuItem(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Nokia"),
              ),
              value: 3),
          DropdownMenuItem(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Hello"),
              ),
              value: 4),
        ],
        onChanged: (int setvalue) {
          if (setvalue == 3) {
            BlocProvider.of<ShopBloc>(context)
              ..add(
                GetNokia(),
              );
          }
          if (setvalue == 1) {
            BlocProvider.of<ShopBloc>(context)
              ..add(
                GetGrocery(),
              );
          }
          if (setvalue == 2) {
            BlocProvider.of<ShopBloc>(context)
              ..add(
                GetSpring(),
              );
          }
          setState(() {
            _dropDownvalue = setvalue;
            print(_dropDownvalue);
          });
        },
      ),
    );
  }
}
