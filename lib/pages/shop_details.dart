import 'package:flutter/material.dart';

import 'package:homebrands/constants.dart';
import 'package:homebrands/pages/shop_list.dart';
import 'package:homebrands/model/shop.dart';

class ShopPage extends StatefulWidget {

  final Shop shop;

  ShopPage({this.shop});

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {

    Shop _shop = widget.shop;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
            _shop.businessName
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Text(
            _shop.businessName
          ),
        ),
      ),
    );
  }
}
