import 'package:flutter/material.dart';

import 'package:homebrands/model/category.dart';
import 'package:homebrands/model/shop.dart';
import 'package:homebrands/constants.dart';
import 'package:homebrands/utils/screen_util.dart';

class ShopListPage extends StatefulWidget {

  final Category category;

  ShopListPage({
    this.category
  });

  @override
  _ShopListPageState createState() => _ShopListPageState();
}

class _ShopListPageState extends State<ShopListPage> {
  @override
  Widget build(BuildContext context) {

    Category _category = widget.category;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              GridView.builder(
                itemCount: allShops.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index){
                  return Card(
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            allShops[index].businessName,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            allShops[index].paymentMethod,
                          ),
                        )
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildShopContainer(){

  }
}

//Dummy list of shops
List<Shop> allShops = [
  Shop(businessName: 'Enzo pizzarie', paymentMethod: 'Card/Cash',),
  Shop(businessName: 'Kashu nuts', paymentMethod: 'Card/Cash',),
  Shop(businessName: 'Colombo farm shop', paymentMethod: 'Card/Cash',),
  Shop(businessName: 'Factory Outlet', paymentMethod: 'Card/Cash',),
  Shop(businessName: 'Enzo pizzarie', paymentMethod: 'Card/Cash',),
  Shop(businessName: 'Kashu nuts', paymentMethod: 'Card/Cash',),
  Shop(businessName: 'Colombo farm shop', paymentMethod: 'Card/Cash',),
  Shop(businessName: 'Factory Outlet', paymentMethod: 'Card/Cash',),
  Shop(businessName: 'Enzo pizzarie', paymentMethod: 'Card/Cash',),
  Shop(businessName: 'Kashu nuts', paymentMethod: 'Card/Cash',),
  Shop(businessName: 'Colombo farm shop', paymentMethod: 'Card/Cash',),
  Shop(businessName: 'Factory Outlet', paymentMethod: 'Card/Cash',),
  Shop(businessName: 'Enzo pizzarie', paymentMethod: 'Card/Cash',),
  Shop(businessName: 'Kashu nuts', paymentMethod: 'Card/Cash',),
  Shop(businessName: 'Colombo farm shop', paymentMethod: 'Card/Cash',),
  Shop(businessName: 'Factory Outlet', paymentMethod: 'Card/Cash',),

];