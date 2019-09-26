import 'package:flutter/material.dart';

import 'package:homebrands/constants.dart';
import 'package:homebrands/model/category.dart';
import 'package:homebrands/model/product.dart';
import 'package:homebrands/utils/screen_util.dart';
import 'package:homebrands/widgets/flat_button.dart';

class ProductDetailPage extends StatefulWidget {

  final Product product;

  ProductDetailPage({this.product});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  
  int quantity = 0;

  @override
  Widget build(BuildContext context) {

    Product _product = widget.product;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          _product.name
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: ScreenUtil.getHeight(30),
                width: double.maxFinite,
                child: Image.network(_product.thumbnail, fit: BoxFit.cover,),
              ),
              Text(
                _product.name,
                style: TextStyle(
                  fontSize: ScreenUtil.getTextSize(15),
                  fontWeight: FontWeight.w600
                ),
              ),
              Text(
                _product.id,
                style: TextStyle(
                  fontSize: ScreenUtil.getTextSize(10),
                  color: kGrey
                ),
              ),
              SizedBox(
                height: ScreenUtil.getWidth(5),
              ),
              Container(
                color: Colors.grey.shade200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: ScreenUtil.getHeight(6),
                      width: ScreenUtil.getHeight(6),
                      child: FloatingActionButton(
                        child: Icon(
                          Icons.add
                        ),
                        backgroundColor: kAshAccent,
                        elevation: 0,
                        onPressed: (){
                          setState(() {
                            quantity++;
                            print('pressed add');
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      width: ScreenUtil.getWidth(5),
                    ),
                    Container(
                      width: ScreenUtil.getWidth(30),
                      child: Center(
                        child: Text(
                          quantity.toString(),
                          style: TextStyle(
                            fontSize: ScreenUtil.getTextSize(30)
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: ScreenUtil.getWidth(5),
                    ),
                    Container(
                      height: ScreenUtil.getHeight(6),
                      width: ScreenUtil.getHeight(6),
                      child: FloatingActionButton(
                        child: Icon(
                            Icons.remove
                        ),
                        backgroundColor: kAshAccent,
                        elevation: 0,
                        onPressed: (){
                          setState(() {
                            quantity--;
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Button(
                buttonText: 'Add to Cart',
                textColor: kMagenta,
                backgroundColor: kMagenta,
                onPressed: (){

                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
