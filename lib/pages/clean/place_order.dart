
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homebrands/model/product.dart';
import 'package:homebrands/pages/clean/cart.dart';
import 'package:homebrands/utils/product_data.dart';
import 'package:homebrands/utils/screen_util.dart';

import '../../constants.dart';

class PlaceOrder extends StatefulWidget {

  final Product product;

  PlaceOrder({this.product});

  @override
  _PlaceOrderState createState() => _PlaceOrderState();

}

class _PlaceOrderState extends State<PlaceOrder> {
  Product _product;
  int numberOfItems = 1;

  @override
  void initState() {
  _product = widget.product;
  super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
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
          _product.name,
          style: TextStyle(
              color: kAsh
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Padding(
              padding: ScreenUtil.getPadding(5, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        if (numberOfItems > 1){
                          numberOfItems--;
                        }
                      });
                    },
                    child: Container(
                      width: ScreenUtil.getWidth(12),
                      height: ScreenUtil.getWidth(12),
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.5),
                        borderRadius: BorderRadius.all(Radius.circular(100))
                      ),
                      child: Center(
                        child: Icon(Icons.remove),
                      ),
                    ),
                  ),
                  Container(
                    width: ScreenUtil.getWidth(20),
                    child: Center(child: Text(
                      numberOfItems.toString(),
                      style: TextStyle(
                        fontSize: ScreenUtil.getTextSize(13)
                      ),
                    )),
                  ),
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        numberOfItems++;
                      });
                    },
                    child: Container(
                      width: ScreenUtil.getWidth(12),
                      height: ScreenUtil.getWidth(12),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.all(Radius.circular(100))
                      ),
                      child: Center(
                        child: Icon(Icons.add),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: (){
                _showAlert(context);
              },
              child: Container(
                color: kMagenta,
                width: double.maxFinite,
                height: ScreenUtil.getHeight(8),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        width: ScreenUtil.getWidth(25),
                      ),
                      Container(
                        width: ScreenUtil.getWidth(25),
                        child: Center(
                          child: Text ('Add $numberOfItems to Cart',
                            style: TextStyle(
                              color: kWhite,
                              fontSize: ScreenUtil.getTextSize(11)
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: ScreenUtil.getWidth(25),
                        child: Center(
                          child: Text ('${_product.price.currency} ${getTotal(numberOfItems, _product.price.amount)}',
                            style: TextStyle(
                                color: kWhite,
                                fontSize: ScreenUtil.getTextSize(10)
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  void _showAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Item added'),
          content: const Text('The Item has been successfully added to the Cart'),
          actions: <Widget>[
            FlatButton(
              child: Text('View Cart', style: TextStyle(color: kMagenta),),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartPage(
                      product: _product,
                      quantity: numberOfItems,
                    ),
                  ),
                );
              },
            ),
            FlatButton(
              color: kMagenta,
              child: Text('Ok', style: TextStyle(color: kWhite),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
    );
  }
}
int getTotal(int quantity, int price){
  return quantity * price;
}
