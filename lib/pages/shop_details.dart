import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homebrands/bloc/shop_details/shop_details_bloc.dart';
import 'package:homebrands/constants.dart';
import 'package:homebrands/model/product.dart';
import 'package:homebrands/model/shop.dart';
import 'package:homebrands/pages/product_details.dart';
import 'package:homebrands/utils/screen_util.dart';
import 'package:homebrands/widgets/progress_indicator.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ShopPage extends StatefulWidget {
  final Shop shop;

  ShopPage({this.shop});

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final shopDetailsBloc = ShopDetailsBloc();
  int allProductsCarouselIndex;
  int bestSellerCarouselIndex;
  final double rating = getStarRating().toDouble();
  Shop _shop;

  @override
  void initState() {
    _shop = widget.shop;

    shopDetailsBloc.dispatch(FetchProductList(_shop.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: ScreenUtil.getHeight(23),
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                _shop.image,
                fit: BoxFit.cover,
              ),
              title: Text(
                _shop.businessName,
                style: TextStyle(
                  shadows: [
                    BoxShadow(
                      color: Colors.black12.withOpacity(1),
                      blurRadius: 30,
                    )
                  ],
                ),
              ),
              centerTitle: true,
            ),
          ),
          SliverToBoxAdapter(
              child: Column(
            children: <Widget>[
              Padding(
                padding: ScreenUtil.getPadding(1, 10),
                child: SmoothStarRating(
                  starCount: 5,
                  rating: rating,
                ),
              ),
//              Padding(
//                padding: ScreenUtil.getPadding(0, 10),
//                //TODO: change hard coded values
//                child: Text(
//                  '\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\"',
//                  textAlign: TextAlign.center,
//                ),
//              ),
              _buildTitle('Best Sellers'),
              //Best seller carousel
//              BlocBuilder(
//                bloc: shopDetailsBloc,
//                builder: (BuildContext context, ShopDetailsState state) {
//                  if (state is InitialShopDetailsState) {
//                    return LoadingWidget();
//                  }
//                  if (state is NetworkErrorShopDetailsState) {
//                    return Container(child: Text(state.error));
//                  }
//                  if (state is NetworkBusyShopDetailsState) {
//                    return LoadingWidget();
//                  }
//                  if (state is ProductListFetchedState) {
//                    _allProducts = state.productList;
//                    _buildBestSellingProducts();
//                  }
//                  return Container();
//                },
//              ),

              _buildBestSellingProducts(),
              _buildTitle('All Products'),
              //All products carousel menu
//              BlocBuilder(
//                bloc: shopDetailsBloc,
//                builder: (BuildContext context, ShopDetailsState state) {
//                  if (state is InitialShopDetailsState) {
//                    return LoadingWidget();
//                  }
//                  if (state is NetworkBusyShopDetailsState) {
//                    return LoadingWidget();
//                  }
//                  if (state is ProductListFetchedState) {
//                    _allProducts = state.productList;
//                    _buildAllProductCards();
//                  }
//                  return Container();
//                },
//              ),
              _buildAllProductCards()
            ],
          ))
        ],
      )),
    );
  }

  //method to navigate to relevant screen ontap of carousel
  navigateToProductDetails(int index, List<Product> productsList) {
    print(index);
    print(productsList.toString());
    print(productsList[index].toString());
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProductDetailPage(
                  product: productsList[index],
                )));
  }

  //method used to render the best selling products into the topmost carousel
  Widget _buildBestSellingProducts() {
    var items = getProductItems(_shop.businessName).toList().map((i) {
      return Builder(builder: (BuildContext context) {
        return _buildBestSellingItem(i);
      });
    }).toList();

    return CarouselSlider(
      onPageChanged: (index) {
        setState(() {
          bestSellerCarouselIndex = index;
          print(bestSellerCarouselIndex);
        });
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

  Widget _buildBestSellingItem(Product product) {
    return GestureDetector(
      onTap: () {
        navigateToProductDetails(bestSellerCarouselIndex, getProductItems(_shop.businessName));
        print('pressed best seller');
      },
      child: Container(
        width: double.infinity,
        color: Colors.grey[200],
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Expanded(
              child: Container(
                  height: double.maxFinite,
                  width: double.maxFinite,
                  child: Image.network(
                    product.thumbnail,
                    fit: BoxFit.cover,
                  )),
            ),
            Expanded(
              child: Padding(
                padding: ScreenUtil.getPaddingAll(10),
//    height: ScreenUtil.getHeight(25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      product.name,
                      style: TextStyle(
                          fontSize: ScreenUtil.getTextSize(11),
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      product.id,
                      style: TextStyle(
                          fontSize: ScreenUtil.getTextSize(9),
                          fontWeight: FontWeight.w100,
                          color: kGrey),
                    ),
                    SizedBox(
                      height: ScreenUtil.getHeight(5),
                      width: ScreenUtil.getWidth(10),
                      child: Divider(
                        color: kAsh,
                      ),
                    ),
                    Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          product.price.currency,
                          style: TextStyle(
                              fontWeight: FontWeight.w100,
                              fontSize: ScreenUtil.getTextSize(12)),
                        ),
                        SizedBox(
                          width: ScreenUtil.getWidth(1),
                        ),
                        Text(
                          product.price.amount.toString(),
                          style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize: ScreenUtil.getTextSize(12)),
                        ),
                      ],
                    ))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

//method used to render all products into the bottom carousel
  Widget _buildAllProductCards() {
    var items = getProductItems(_shop.businessName).toList().map((i) {
      return Builder(builder: (BuildContext context) {
        return _buildProduct(i);
      });
    }).toList();

    return CarouselSlider(
      onPageChanged: (index) {
        setState(() {
          allProductsCarouselIndex = index;
        });
      },
      items: items,
      height: ScreenUtil.getHeight(28),
      aspectRatio: 16 / 9,
      viewportFraction: 0.45,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      pauseAutoPlayOnTouch: Duration(seconds: 10),
      enlargeCenterPage: false,
      scrollDirection: Axis.horizontal,
    );
  }

  Widget _buildProduct(Product product) {
    return GestureDetector(
      onTap: () {
        navigateToProductDetails(allProductsCarouselIndex, getProductItems(_shop.businessName));
        print('pressed all products');
      },
      child: Container(
        height: ScreenUtil.getHeight(25),
        width: ScreenUtil.getWidth(35),
        child: Column(
          children: <Widget>[
            Container(
              height: ScreenUtil.getHeight(22),
              width: ScreenUtil.getWidth(35),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: ScreenUtil.getBorderRadiusCircular(10),
              ),
              child: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    image: DecorationImage(
                        image: NetworkImage(
                          product.thumbnail,
                        ),
                        fit: BoxFit.cover)),
              ),
            ),
            Text(product.name)
          ],
        ),
      ),
    );
  }

  List<Product> getProductItems(String shop){
    if (shop == 'Surand\'s Sweet foods'){
      print('surands shoop');
      return sweetsList;
    } else if (shop == 'Charamel Eats'){
      print('Charamel Eats');
    } else if (shop == 'Yei\'s Brownies'){
      print('Yei\'s Brownies');
    } else if (shop == 'Charamel Eats'){
      print('Charamel Eats');
    } else if (shop == 'Charamel Eats'){
      print('Charamel Eats');
    }
  }

}

//method to generate random star ratings
int getStarRating() {
  var range = Random();
  return range.nextInt(6);
}

Align _buildTitle(String title) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Container(
      padding: ScreenUtil.getPaddingAll(8),
      child: Text(
        title,
        style: TextStyle(
          fontSize: ScreenUtil.getTextSize(12),
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}

List<Product> sweetsList = [
  Product(
      price: Price(currency: 'LKR', amount: 400),
      name: 'Gulab Jamun',
      thumbnail:
          'https://images-na.ssl-images-amazon.com/images/I/81zWg1w1uVL._SL1500_.jpg',
      id: 'K000002'),
  Product(
      price: Price(currency: 'LKR', amount: 600),
      name: 'Gummy Strings',
      thumbnail:
          'https://images-na.ssl-images-amazon.com/images/I/9187CTI60wL._SX385_.jpg',
      id: 'K2342347'),
  Product(
      price: Price(currency: 'LKR', amount: 700),
      name: 'mixed nuts',
      thumbnail:
          'https://superiornutchicago.com/wp-content/uploads/2015/06/301.jpg',
      id: 'K1234567'),
  Product(
      price: Price(currency: 'LKR', amount: 800),
      name: 'Spicy cashew nuts',
      thumbnail:
          'https://5.imimg.com/data5/BR/YS/MY-7452716/natural-cashew-nuts-500x500.jpg',
      id: 'K1234567'),
  Product(
      price: Price(currency: 'LKR', amount: 900),
      name: 'macadamie nuts',
      thumbnail:
          'https://perfectketo.com/wp-content/uploads/2018/10/bigstock-Plate-With-Organic-Macadamia-N-270297172-1024x683.jpg',
      id: 'K1234567'),
];


