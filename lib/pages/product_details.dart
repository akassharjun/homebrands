import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homebrands/constants.dart';
import 'package:homebrands/widgets/alert_box.dart';

import '../model/product.dart';
import '../utils/screen_util.dart';
import '../widgets/flat_button.dart';

class ProductDetailPage extends StatefulWidget {
  final Product product;

  ProductDetailPage({this.product});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int quantity = 1;
  int amount = 0;

  @override
  void initState() {
    Product _product = widget.product;
    amount = _product.price.amount;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Product _product = widget.product;
    return Scaffold(
      appBar: AppBar(
        title: Text(_product.name),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                  height: ScreenUtil.getHeight(25),
                  width: MediaQuery.of(context).size.width,
                  child: Image.network(
                    _product.thumbnail,
                    fit: BoxFit.cover,
                  )),
              Padding(
                padding: ScreenUtil.getPadding(1, 0),
                child: Text(
                  _product.name,
                  style: TextStyle(
                      fontSize: ScreenUtil.getTextSize(12),
                      fontWeight: FontWeight.w600),
                ),
              ),
              Text(
                "Price : ${amount.toString()}",
                style: TextStyle(
                    fontSize: ScreenUtil.getTextSize(12),
                    fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 25,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    quantity++;
                    amount = _product.price.amount * quantity;
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
                    fontWeight: FontWeight.w700),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    quantity--;
                    amount = _product.price.amount * quantity;
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
                    buttonText: 'Order',
                    textColor: kWhite,
                    backgroundColor: kMagenta,
                    onPressed: () {
                      ErrorDialog.getAlertBox(
                          context: context,
                          title: "Order Placed",
                          message: "Your order has been placed succesfully",
                          flatButtonText: "OK",
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              Routes.HOME,
                            );
                          });
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void _goBackHome(BuildContext context) {}
//
//Widget _showAlert() {
//  return
//}

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
