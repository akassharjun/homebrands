import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homebrands/bloc/dashboard/dashboard_bloc.dart';
import 'package:homebrands/model/product.dart';
import 'package:homebrands/model/shop.dart';
import 'package:homebrands/pages/clean/place_order.dart';
import 'package:homebrands/pages/clean/shop_details.dart';
import 'package:homebrands/utils/product_data.dart';
import 'package:homebrands/utils/screen_util.dart';
import 'package:homebrands/widgets/bloc_error_handling.dart';
import 'package:homebrands/widgets/heading.dart';
import 'package:homebrands/widgets/progress_indicator.dart';

import '../../constants.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int featuredCarouselIndex = 0;
  int trendingCarouselIndex = 0;

  final dashboardBloc = DashboardBloc();

  @override
  void initState() {
    dashboardBloc.dispatch(FetchFeaturedShops());
    dashboardBloc.dispatch(FetchTrendingShops());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Heading.buildTitle("Trending Items"),
            SizedBox(height: ScreenUtil.getHeight(0.5)),
            buildTrendingShopList(trendingProductItemDashboard),
            SizedBox(height: ScreenUtil.getHeight(2)),
            Heading.buildTitle("Featured Shops"),
            SizedBox(height: ScreenUtil.getHeight(0.5)),
            buildFeaturedShopList(featuredDashboardShops)
          ],
        ),
      ),
    );
  }

  Widget _buildTrendingShopsCardBuilder() {
    return BlocBuilder(
      bloc: dashboardBloc,
      builder: (BuildContext context, DashboardState state) {
        if (state is InitialDashboardState) {
          return LoadingWidget();
        }

        if (state is NetworkBusyFetchingTrendingShopsDashboardState) {
          return LoadingWidget();
        }

        if (state is TrendingShopsFetchedDashboardState) {
          if (!state.hasData) {
            // return error dialog here
            return NoData();
          }

          List<Shop> shops = state.shopList;

//          return buildTrendingShopList(shops);
        }
        // ignore this
        return BlocIssue("TrendingShops");
      },
    );
  }

  Widget _buildFeaturedShopsCardBuilder() {
    return BlocBuilder(
      bloc: dashboardBloc,
      builder: (BuildContext context, DashboardState state) {
        if (state is InitialDashboardState) {
          return LoadingWidget();
        }

        if (state is NetworkBusyFetchingFeaturedShopsDashboardState) {
          return LoadingWidget();
        }

        if (state is FeaturedProductsFetchedDashboardState) {
          if (!state.hasData) {
            // return error dialog here
            return NoData();
          }
          List<Shop> shops = state.shopList;
//          return buildTrendingShopList(shops);
        }
        // ignore this
        return BlocIssue("FeaturedShops");
      },
    );
  }

  Widget buildTrendingShopList(List<Product> product) {
    var items = trendingProductItemDashboard.toList().map((i) {
      return Builder(builder: (BuildContext context) {
        return _buildTrendingShop(i);
      });
    }).toList();

    return CarouselSlider(
      onPageChanged: (value) {
        trendingCarouselIndex = value;
        print(trendingCarouselIndex);
      },
      items: items,
      height: ScreenUtil.getHeight(30),
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

  Widget _buildTrendingShop(Product product) {
    return GestureDetector(
      onTap: () => routeTrending(trendingCarouselIndex),
      child: Container(
          padding: ScreenUtil.getPadding(1, 0),
          height: ScreenUtil.getHeight(25),
          width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                    product.thumbnail,
                  ),
                  fit: BoxFit.cover)),
          child: Stack(
            children: <Widget>[
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(color: kAsh.withOpacity(0.3), blurRadius: 10)
                      ],
                      gradient: LinearGradient(colors: [kMagenta, Colors.red]),
                      color: kWhite,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      )),
                  height: ScreenUtil.getHeight(13),
                  width: ScreenUtil.getWidth(60),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        product.name,
                        style: TextStyle(
                            color: kWhite,
                            fontSize: ScreenUtil.getTextSize(13),
                            fontWeight: FontWeight.w900),
                      ),
                      Text(
                        product.business,
                        style: TextStyle(
                            color: kWhite,
                            fontSize: ScreenUtil.getTextSize(9.5),
                            fontWeight: FontWeight.w300),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            product.price.currency,
                            style: TextStyle(
                              color: kWhite,
                              fontSize: ScreenUtil.getTextSize(12),
                            ),
                          ),
                          Text(' '),
                          Text(
                            product.price.amount.toString(),
                            style: TextStyle(
                                color: kWhite,
                                fontSize: ScreenUtil.getTextSize(12),
                                fontWeight: FontWeight.w900),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }

  Widget buildFeaturedShopList(List<Shop> shop) {
    var items = shop.toList().map((i) {
      return Builder(builder: (BuildContext context) {
        return _buildFeaturedShop(i);
      });
    }).toList();

    return CarouselSlider(
      onPageChanged: (value) {
        featuredCarouselIndex = value;
        print(featuredCarouselIndex);
      },
      items: items,
      height: ScreenUtil.getHeight(20),
      viewportFraction: 0.6,
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

  Widget _buildFeaturedShop(Shop shop) {
    return GestureDetector(
      onTap: () => routeFeatured(featuredCarouselIndex),
      child: Container(
        height: ScreenUtil.getHeight(2),
        width: ScreenUtil.getWidth(55),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            gradient: LinearGradient(colors: getColours())),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              shop.businessName,
              style: TextStyle(
                  color: kWhite,
                  fontWeight: FontWeight.w600,
                  fontSize: ScreenUtil.getTextSize(11.5)),
            ),
            Text(
              shop.category,
              style: TextStyle(color: kWhite, fontWeight: FontWeight.w300),
            ),
            SizedBox(
              height: ScreenUtil.getHeight(1),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  border: Border.all(
                    color: kWhite,
                  )),
              child: Padding(
                padding: ScreenUtil.getPaddingAll(8.5),
                child: Text(
                  shop.paymentMethod,
                  style: TextStyle(
                    color: kWhite,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    dashboardBloc.dispose();
    super.dispose();
  }

  List<Color> getColours() {
    var range = Random();
    int index = range.nextInt(7);
    if (index == 1) {
      return [Colors.red, Colors.pink];
    }
    if (index == 2) {
      return [Colors.pink, Colors.purple];
    }
    if (index == 3) {
      return [kMagenta, Colors.orange];
    }
    if (index == 4) {
      return [Colors.amber, Colors.red];
    }
    if (index == 5) {
      return [Colors.purpleAccent, Colors.blueAccent];
    }
    if (index == 6) {
      return [Colors.blue, Colors.pink];
    }
    if (index == 0) {
      return [Colors.purpleAccent, Colors.lightBlueAccent];
    }
  }

  routeFeatured(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ShopPage(
          shop: featuredDashboardShops[index],
        ),
      ),
    );
  }

  routeTrending(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PlaceOrder(
          product: trendingProductItemDashboard[index],
        ),
      ),
    );
  }
}
