import 'package:flutter/material.dart';

import 'package:homebrands/model/category.dart';
import 'package:homebrands/model/shop.dart';
import 'package:homebrands/pages/shop_details.dart';
import 'package:homebrands/constants.dart';
import 'package:homebrands/utils/screen_util.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'dart:math';

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
        child: GridView.builder(
          itemCount: _allShops.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index){
            return _buildShopContainer(index);
          },
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
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                child: Image.network('https://images.pexels.com/photos/414612/pexels-photo-414612.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500', fit: BoxFit.cover,),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  _allShops[shopIndex].businessName,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: ScreenUtil.getTextSize(11)
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      _allShops[shopIndex].paymentMethod,
                    ),
                    SizedBox(
                      height: ScreenUtil.getHeight(0.5),
                    ),
                    SmoothStarRating(
                      starCount: 5,
                      rating: getStarRating().toDouble(),
                      size: ScreenUtil.getHeight(1.5),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//method to generate random star ratings
int getStarRating(){
  var range = Random();
  return range.nextInt(6);
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