import 'package:flutter/material.dart';

import 'package:homebrands/constants.dart';
import 'package:homebrands/pages/shop_list.dart';
import 'package:homebrands/model/shop.dart';
import 'package:homebrands/utils/screen_util.dart';

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
//      appBar: AppBar(
//        elevation: 0,
//        title: Text(
//            _shop.businessName
//        ),
//      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: ScreenUtil.getHeight(23),
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network('https://images-gmi-pmc.edge-generalmills.com/087d17eb-500e-4b26-abd1-4f9ffa96a2c6.jpg',fit: BoxFit.cover,),
                title: Text(
                  _shop.businessName,
                  style: TextStyle(
                    shadows: [
                      BoxShadow(
                        color: Colors.black12.withOpacity(1),
                        blurRadius: 30,
                      )
                    ]
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 1000,
              ),
            )
          ],
        )
      ),
    );
  }
}
