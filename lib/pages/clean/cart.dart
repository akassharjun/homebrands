import 'package:flutter/material.dart';
import 'package:homebrands/model/product.dart';
import 'package:homebrands/utils/product_data.dart';
import 'package:homebrands/utils/screen_util.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../../constants.dart';

class CartPage extends StatefulWidget {

  final Product product;
  final int quantity;

  CartPage({this.product, this.quantity});

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {

    Product _product = widget.product;
    int _quantity = widget.quantity;
    List<CartPage> products = [CartPage(quantity: _quantity, product: _product,), CartPage( quantity: 5, product: MeatList[0],)];


    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kWhite,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            Icons.chevron_left,
            size: 30,
            color: kAsh,
          ),
        ),
        centerTitle: true,
        title: Text(
          'My Cart',
          style: TextStyle(
              color: kAsh
          ),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            _buildPendingOrders(products)
          ],
        ),
      ),
    );
  }

  SliverList _buildPendingOrders(List<CartPage> cartList){
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index){
        return Padding(
          padding: ScreenUtil.getPadding(1, 0),
          child: Container(
            height: ScreenUtil.getHeight(18),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text(cartList[index].product.name,
                        style: TextStyle(
                          fontSize: ScreenUtil.getTextSize(11)
                        ),
                      ),
                      SizedBox(
                        child: Divider(
                          color: kAsh,
                        ),
                        width: ScreenUtil.getWidth(10),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            cartList[index].product.price.currency,
                            style: TextStyle(
                                fontSize: ScreenUtil.getTextSize(11)
                            ),
                          ),
                          SizedBox(
                            width: ScreenUtil.getWidth(0.5),
                          ),
                          Text(
                            '${cartList[index].product.price.amount * cartList[index].quantity}',
                            style: TextStyle(
                                fontSize: ScreenUtil.getTextSize(11),
                                fontWeight: FontWeight.w800
                            ),
                          ),
                        ],
                      ),
                      Text('Unit price = ${cartList[index].product.price.amount}'),
                      Text('Order placed...'),
                      FlatButton(
                        onPressed: (){
                          setState(() {
                            cartList.removeAt(0);
                          });
                        },
                        color: Colors.red,
                        child: Text('Cancel order', style: TextStyle(color: kWhite),),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    height: double.maxFinite,
                    width: double.maxFinite,
                    child: Image.network(cartList[index].product.thumbnail, fit: BoxFit.cover,),
                  ),
                )
              ],
            ),
          ),
        );
      },
          childCount: cartList.length),
    );
  }
}
