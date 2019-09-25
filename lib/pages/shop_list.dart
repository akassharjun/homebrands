import 'package:flutter/material.dart';

import 'package:homebrands/model/category.dart';
import 'package:homebrands/model/shop.dart';
import 'package:homebrands/pages/shop_details.dart';
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
      appBar: AppBar(
        elevation: 0,
        title: Text(
          _category.name
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                child: GridView.builder(
                  itemCount: _allShops.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemBuilder: (BuildContext context, int index){
                    return _buildShopContainer(index);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  _viewShop(int index){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ShopPage(
          shop: Shop(
            businessName: _allShops[index].businessName,
            paymentMethod: _allShops[index].paymentMethod,
          ),
        )
      )
    );
  }

  Widget _buildShopContainer(int shopIndex){
    return GestureDetector(
      onTap: (){
        _viewShop(shopIndex);
      },
      child: Card(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                child: Text(
                  _allShops[shopIndex].businessName,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  _allShops[shopIndex].paymentMethod,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//Dummy list of shops
List<Shop> _allShops = [
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