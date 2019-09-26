import 'package:flutter/material.dart';

import 'package:homebrands/constants.dart';
import 'package:homebrands/pages/shop_list.dart';
import 'package:homebrands/model/shop.dart';
import 'package:homebrands/utils/screen_util.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'dart:math';
import 'package:homebrands/model/product.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:homebrands/pages/product_details.dart';

class ShopPage extends StatefulWidget {

  final Shop shop;

  ShopPage({this.shop});

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {

  int allProductsCarouselIndex;
  int bestSellerCarouselIndex;
  final double rating = getStarRating().toDouble();

  @override
  Widget build(BuildContext context) {

    Shop _shop = widget.shop;

    return Scaffold(
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
                  Padding(
                    padding: ScreenUtil.getPadding(0, 10),
                    //TODO: change hard coded values
                    child: Text(
                      '\"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.\"',
                      textAlign: TextAlign.center,
                    ),
                  ),
                  _buildTitle('Best Sellers'),
                  //Best seller carousel
                  _buildBestSellingProducts(),
                  _buildTitle('All Products'),
                  //All products carousel menu
                  _buildAllProductCards()
                ],
              )
            )
          ],
        )
      ),
    );
  }

  //method to navigate to relevant screen ontap of carousel
  navigateToProductDetails(int index, List<Product> productsList){
    print(index);
    print(productsList.toString());
    print(productsList[index].toString());
    Navigator.push(context,
        MaterialPageRoute(
          builder: (context) => ProductDetailPage(
            product: productsList[index],
        )
    ));
  }

  //method used to render the best selling products into the topmost carousel
  Widget _buildBestSellingProducts() {

    var items = _allProducts.toList().map((i) {
      return Builder(builder: (BuildContext context) {
        return _buildBestSellingItem(i);
      });
    }).toList();

    return CarouselSlider(
      onPageChanged: (index){
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
  Widget _buildBestSellingItem(Product product){
    return GestureDetector(
      onTap: (){
        navigateToProductDetails(bestSellerCarouselIndex, _allProducts);
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
                  child: Image.network(product.thumbnail, fit: BoxFit.cover,)),
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
                          fontWeight: FontWeight.w600
                      ),
                    ),
                    Text(
                      product.id,
                      style: TextStyle(
                          fontSize: ScreenUtil.getTextSize(9),
                          fontWeight: FontWeight.w100,
                          color: kGrey
                      ),
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
                                  fontSize: ScreenUtil.getTextSize(12)
                              ),
                            ),
                            SizedBox(width: ScreenUtil.getWidth(1),),
                            Text(
                              product.price.amount.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: ScreenUtil.getTextSize(12)
                              ),
                            ),
                          ],
                        )
                    )
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
    var items = _allProducts.toList().map((i) {
      return Builder(builder: (BuildContext context) {
        return _buildProduct(i);
      });
    }).toList();

    return CarouselSlider(
      onPageChanged: (index){
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
      onTap: (){
        navigateToProductDetails(allProductsCarouselIndex, _allProducts);
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
                    image: DecorationImage(image: NetworkImage(product.thumbnail,), fit: BoxFit.cover)
                ),
              ),
            ),
            Text(product.name)
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



List<Product> _allProducts = [
  Product(
    price: Price(currency: 'LKR', amount: 400),
    name: 'Cashew nuts',
    thumbnail: 'https://5.imimg.com/data5/BR/YS/MY-7452716/natural-cashew-nuts-500x500.jpg',
    id: 'K1234567'
  ),
  Product(
      price: Price(currency: 'LKR', amount: 600),
      name: 'Pistachio nuts',
      thumbnail: 'https://ed910ae2d60f0d25bcb8-80550f96b5feb12604f4f720bfefb46d.ssl.cf1.rackcdn.com/271d658aad1fe459-j240Ap95-large.jpg',
      id: 'K1234567'
  ),
  Product(
      price: Price(currency: 'LKR', amount: 700),
      name: 'mixed nuts',
      thumbnail: 'https://superiornutchicago.com/wp-content/uploads/2015/06/301.jpg',
      id: 'K1234567'
  ),
  Product(
      price: Price(currency: 'LKR', amount: 800),
      name: 'Spicy cashew nuts',
      thumbnail: 'https://5.imimg.com/data5/BR/YS/MY-7452716/natural-cashew-nuts-500x500.jpg',
      id: 'K1234567'
  ),
  Product(
      price: Price(currency: 'LKR', amount: 900),
      name: 'macadamie nuts',
      thumbnail: 'https://perfectketo.com/wp-content/uploads/2018/10/bigstock-Plate-With-Organic-Macadamia-N-270297172-1024x683.jpg',
      id: 'K1234567'
  ),

];

