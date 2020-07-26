import 'package:ecommerceapp/models/nokiaphone.dart';
import 'package:ecommerceapp/widgets/primarywidget.dart';
import 'package:flutter/material.dart';

class NokiaScreen extends StatelessWidget {
  final List<Nokia> nokiaList;

  const NokiaScreen({Key key, this.nokiaList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar("Nokia Phones", true),
      body: ListView.builder(
          itemCount: nokiaList.length,
          itemBuilder: (context, i) {
            return ListTile(
              title: Text(nokiaList[i].phone),
              subtitle: Text(nokiaList[i].os),
              leading: CircleAvatar(
                child: Text("Nokia", style: TextStyle(fontSize: 10)),
              ),
              trailing: Text(
                nokiaList[i].size,
                style: TextStyle(fontSize: 20),
              ),
            );
          }),
    );
  }
}
