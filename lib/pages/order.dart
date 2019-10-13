import 'package:flutter/material.dart';
import 'package:homebrands/widgets/app_logo.dart';

class OrderPage extends StatelessWidget {
  final String name;
  final int quantity;
  final image;

  const OrderPage({Key key, this.name, this.quantity, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Buy Product"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.network(image),
            Text(name, style: TextStyle(fontSize: 28),),
            SizedBox(height: 10),
            Text(quantity.toString(), style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
            SizedBox(height: 50),
            RaisedButton(onPressed: (){} , child: Text("Order"),)
          ],
        ),
      ),
    );
  }
}
