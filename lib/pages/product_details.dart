import 'package:flutter/material.dart';

import 'package:homebrands/constants.dart';
import 'package:homebrands/model/category.dart';

import '../model/product.dart';
import '../utils/screen_util.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/flat_button.dart';
import 'order.dart';

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
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                height: ScreenUtil.getHeight(25),
                width: MediaQuery.of(context).size.width,
                child: Image.network(_product.thumbnail, fit: BoxFit.cover,)
              ),
              Padding(
                padding: ScreenUtil.getPadding(1, 0),
                child: Text(
                  _product.name,
                  style: TextStyle(
                    fontSize: ScreenUtil.getTextSize(12),
                    fontWeight: FontWeight.w600
                  ),
                ),
              ),
              Padding(
                padding: ScreenUtil.getPadding(1, 0),
                child: Text(
                  _product.id,
                  style: TextStyle(
                    fontSize: ScreenUtil.getTextSize(10),
                    fontWeight: FontWeight.w300,
                    color: Colors.grey.shade500
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    quantity++;
                  });
                  print('tapped increase');
                },
                child: Icon(
                  FontAwesomeIcons.chevronUp,
                  size: ScreenUtil.getHeight(5),
                  color: kGrey,
                ),
              ),
              Text(
                quantity.toString(),
                style: TextStyle(
                  fontSize: ScreenUtil.getTextSize(30),
                  fontWeight: FontWeight.w700
                ),
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    quantity--;
                  });
                  print('tapped decrease');
                },
                child: Icon(
                  FontAwesomeIcons.chevronDown,
                  color: kGrey,
                  size: ScreenUtil.getHeight(5),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Button(
                  buttonText: 'Add to Cart',
                  textColor: kWhite,
                  backgroundColor: kMagenta,
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OrderPage(
                        name: _product.name,
                        quantity: quantity,
                      )),
                    );
                  }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void _showToast(BuildContext context) {
  final scaffold = Scaffold.of(context);
  scaffold.showSnackBar(
    SnackBar(
      content: const Text('Added to favorite'),
      action: SnackBarAction(
          label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
    ),
  );
}