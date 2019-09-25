import 'package:flutter/material.dart';

import 'package:homebrands/constants.dart';
import 'package:homebrands/model/category.dart';

class ProductDetailPage extends StatefulWidget {

  final Category category;

  ProductDetailPage({this.category});

  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    Category _category = widget.category;
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                expandedHeight: 200,
                flexibleSpace: Image.network(_category.thumbnail, fit: BoxFit.cover,),
              )
            ],
          )
        ),
      ),
    );
  }
}
