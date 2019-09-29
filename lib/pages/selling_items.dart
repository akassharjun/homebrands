import 'package:flutter/material.dart';

import '../constants.dart';


class SellingItems extends StatefulWidget {

  static String routeID = 'selling_item_screen';
  @override
  _SellingItemsState createState() => _SellingItemsState();
}

class _SellingItemsState extends State<SellingItems> {

  List<Widget> getItemsForSale(){
    List<Widget> itemsForSaleList = [];
    for (int x = 0; x < productItemNames.length; x++){
      itemsForSaleList.add(
        Card(
          elevation: 2,
          child: ListTile(
            leading: Container(
              width: 80,
              height: double.maxFinite,
              child: Image.asset(
                productImagePaths[x],
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              productItemNames[x],
              style: TextStyle(
                fontSize: 15
              ),
            ),
            trailing: Text(
              'LKR ${productItemPrice[x].toString()}',
              style: TextStyle(
                color: kMagenta,
                fontSize: 15,
              ),
            ),
          ),
        )
      );
    }
    return itemsForSaleList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: getItemsForSale(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(),
                child: FloatingActionButton(
                  backgroundColor: kMagenta,
                  elevation: 0,
                  child: Icon(
                    Icons.add
                  ),
                  onPressed: (){
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

List<String> bestsellerImagePaths = [
  'assets/images/products/browniePlatter.jpg',
  'assets/images/products/oreoBrownie.jpg'
];

List<String> bestsellerItemName = [
  '4 piece Brownie Platter',
  'Oreo Brownie'
];

List<int> bestsellerItemPrice = [
  700,
  300
];

List<String> productImagePaths = [
  'assets/images/products/browniePlatter.jpg',
  'assets/images/products/brownieSundae.jpg',
  'assets/images/products/butterBrownies.jpeg',
  'assets/images/products/classicBrownie.png',
  'assets/images/products/creamyBrownie.jpg',
  'assets/images/products/hazelnutBrownie.jpg',
  'assets/images/products/oreoBrownie.jpg'
];

List<String> productItemNames = [
  '4 piece Brownie Platter',
  'Brownie Sundae',
  'Butter Brownie',
  'Classic Brownie',
  'Whip Creme Brownie',
  'Hazelnut Brownie',
  'Oreo Brownie'
];

List<int> productItemPrice = [
  700,
  300,
  500,
  800,
  200,
  350,
  430
];
