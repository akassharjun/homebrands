import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homebrands/bloc/shop_details/shop_details_bloc.dart';
import 'package:homebrands/model/product.dart';
import 'package:homebrands/model/shop.dart';
import 'package:homebrands/pages/clean/shop_list.dart';
import 'package:homebrands/utils/product_data.dart';
import 'package:homebrands/utils/screen_util.dart';
import 'package:homebrands/widgets/bloc_error_handling.dart';
import 'package:homebrands/widgets/progress_indicator.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../../constants.dart';
import 'place_order.dart';

class ShopPage extends StatefulWidget {
  final Shop shop;

  ShopPage({this.shop});

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final shopDetailsBloc = ShopDetailsBloc();
  Shop _shop;
  int bestSellerCarouselIndex = 0;

  @override
  void initState() {
    _shop = widget.shop;
    shopDetailsBloc.dispatch(FetchProductList(_shop.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              _shop.businessName,
              style: TextStyle(
                  color: kAsh
              ),
            ),
            Icon(
              FontAwesomeIcons.shoppingBag,
              color: kAsh,
            )
          ],
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: ScreenUtil.getPadding(1, 1),
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Text('Best Sellers',
                            style: TextStyle(
                                fontSize: ScreenUtil.getTextSize(12),
                                color: kAshAccent
                            ),
                          ),
                        ],
                      ),
                      width: double.maxFinite,
                    ),
                  ),
                  _buildBestSellingProducts(getProductItems(_shop.businessName)),
                  Padding(
                    padding: ScreenUtil.getPadding(1, 1),
                    child: Container(
                      child: Row(
                        children: <Widget>[
                          Text('All Products',
                            style: TextStyle(
                                fontSize: ScreenUtil.getTextSize(12),
                                color: kAshAccent
                            ),
                          ),
                        ],
                      ),
                      width: double.maxFinite,
                    ),
                  ),
                ],
              ),
            ),
            _buildAllProductCards(getProductItems(_shop.businessName)),
          ],
        )
      )
    );
  }

  Widget _buildShopDetailsBuilder() {
    return BlocBuilder(
      bloc: shopDetailsBloc,
      builder: (BuildContext context, ShopDetailsState state) {
        if (state is InitialShopDetailsState) {
          return LoadingWidget();
        }
        if (state is NetworkErrorShopDetailsState) {
          return NetworkError("NetworkErrorShopDetailsState");
        }
        if (state is NetworkBusyShopDetailsState) {
          return LoadingWidget();
        }
        if (state is ProductListFetchedState) {
          if (!state.hasData) {
            // return error dialog here
            return NoData();
          }
          List<Product> products = state.productList;
//          return _buildProductCards(getProductItems(widget.shop.businessName));
        }
        return BlocIssue("_buildShopDetailsBuilder()");
      },
    );
  }

  Widget _buildBestSellingProducts(List<Product> product) {
    var items = product.toList().map((i) {
      return Builder(builder: (BuildContext context) {
        return _buildProductCards(i);
      });
    }).toList();

    return CarouselSlider(
      onPageChanged: (index) {
        bestSellerCarouselIndex = index;
        print(bestSellerCarouselIndex);
      },
      items: items,
      height: ScreenUtil.getHeight(25),
      aspectRatio: 16 / 9,
      viewportFraction: 1.0,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      pauseAutoPlayOnTouch: Duration(seconds: 10),
      enlargeCenterPage: true,
      scrollDirection: Axis.horizontal,
    );
  }
   _buildProductCards(Product product){
    return GestureDetector(
      onTap: (){
        purchaseProduct(bestSellerCarouselIndex);
      },
      child: Container(
        height: 200,
        child: Row(
          children: <Widget>[
            Expanded(
              child: Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: Image.network(product.thumbnail, fit: BoxFit.cover,)),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    product.name,
                    style: TextStyle(
                        fontSize: ScreenUtil.getTextSize(11),
                        color: kAsh,
                        fontWeight: FontWeight.w600
                    ),
                  ),
                  Text(
                    product.id,
                    style: TextStyle(
                      fontSize: ScreenUtil.getTextSize(9),
                      color: kGrey,

                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        product.price.currency,
                        style: TextStyle(
                            fontSize: ScreenUtil.getTextSize(11)
                        ),
                      ),
                      SizedBox(
                        width: ScreenUtil.getWidth(0.5),
                      ),
                      Text(
                        product.price.amount.toString(),
                        style: TextStyle(
                            fontSize: ScreenUtil.getTextSize(11),
                            fontWeight: FontWeight.w800
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: ScreenUtil.getHeight(1),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.all(Radius.circular(2))
                    ),
                    width: ScreenUtil.getWidth(15),
                    child: Padding(
                      padding: const EdgeInsets.all(1.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SmoothStarRating(
                            rating: 1,
                            starCount: 1,
                            size: 20,
                            color: Colors.amber,
                            borderColor: Colors.amber,
                          ),
                          SizedBox(
                            width: ScreenUtil.getWidth(1),
                          ),
                          Text(
                            getStarRating().toString(),
                            style: TextStyle(
                                color: kAsh
                            ),
                          ),
                          SizedBox(
                            width: ScreenUtil.getWidth(0.5),
                          ),
                          Text(
                            "(${getNumberOfRatings()})",
                            style: TextStyle(
                                color: kGrey
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  int getStarRating() {
    var range = Random();
    return range.nextInt(6);
  }
  int getNumberOfRatings() {
    var range = Random();
    return range.nextInt(100);
  }

  purchaseProduct(int index){
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlaceOrder(
          product: getProductItems(_shop.businessName)[index],
        ),
      ),
    );
  }

  _buildAllProductCards(List<Product> productList){
    return SliverList(
      delegate: SliverChildBuilderDelegate((BuildContext context, int index){
        return GestureDetector(
          onTap: (){
            purchaseProduct(index);
          },
          child: Padding(
            padding: ScreenUtil.getPadding(1, 1),
            child: Column(
              children: <Widget>[
                Container(
                  height: ScreenUtil.getHeight(30),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                            height: double.maxFinite,
                            width: double.maxFinite,
                            child: Image.network(productList[index].thumbnail, fit: BoxFit.cover,)),
                      ),
                      Expanded(
                        child: Padding(
                          padding: ScreenUtil.getPadding(1, 0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    productList[index].name,
                                    style: TextStyle(
                                        fontSize: ScreenUtil.getTextSize(11),
                                        color: kAsh,
                                        fontWeight: FontWeight.w600
                                    ),
                                  ),
                                  Padding(
                                    padding: ScreenUtil.getPadding(0, 1),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: <Widget>[
                                        SmoothStarRating(
                                          rating: 1,
                                          starCount: 1,
                                          size: 20,
                                          color: Colors.amber,
                                          borderColor: Colors.amber,
                                        ),
                                        SizedBox(
                                          width: ScreenUtil.getWidth(1),
                                        ),
                                        Text(
                                          getStarRating().toString(),
                                          style: TextStyle(
                                              color: kAsh
                                          ),
                                        ),
                                        SizedBox(
                                          width: ScreenUtil.getWidth(0.5),
                                        ),
                                        Text(
                                          "(${getNumberOfRatings()})",
                                          style: TextStyle(
                                              color: kGrey
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                productList[index].id,
                                style: TextStyle(
                                  fontSize: ScreenUtil.getTextSize(9),
                                  color: kGrey,

                                ),
                              ),
                              SizedBox(
                                height: ScreenUtil.getHeight(0.5),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        productList[index].price.currency,
                                        style: TextStyle(
                                            fontSize: ScreenUtil.getTextSize(11)
                                        ),
                                      ),
                                      SizedBox(
                                        width: ScreenUtil.getWidth(0.5),
                                      ),
                                      Text(
                                        productList[index].price.amount.toString(),
                                        style: TextStyle(
                                            fontSize: ScreenUtil.getTextSize(11),
                                            fontWeight: FontWeight.w800
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: ScreenUtil.getPadding(0, 1),
                                    child: Text('~ ${getDeliveryTime()} days',
                                      style: TextStyle(
                                          color: kMagenta
                                      ),),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: ScreenUtil.getHeight(1),
                              ),
//                          Container(
//                            decoration: BoxDecoration(
//                                color: Colors.grey.shade200,
//                                borderRadius: BorderRadius.all(Radius.circular(2))
//                            ),
//                            width: ScreenUtil.getWidth(15),
//                            child: Padding(
//                              padding: const EdgeInsets.all(1.0),
//                              child:
//                            ),
//                          ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: ScreenUtil.getWidth(50),
                  child: Divider(
                    color: kAsh,
                  ),
                )
              ],
            ),
          ),
        );
      },
          childCount: productList.length),
    );
  }
}



int getDeliveryTime() {
  var range = Random();
  return range.nextInt(7);
}