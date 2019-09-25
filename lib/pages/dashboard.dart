import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homebrands/bloc/dashboard/dashboard_bloc.dart';
import 'package:homebrands/utils/screen_util.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final dashboardBloc = DashboardBloc();

  @override
  Widget build(BuildContext context) {
    return _buildDashboardPage();
  }

  Column _buildDashboardPage() {
    return Column(
      children: <Widget>[
        SizedBox(height: ScreenUtil.getHeight(0.25)),
        _buildTitle("Featured Products"),
        _buildFeaturedProductsCardSlider(),
        SizedBox(height: ScreenUtil.getHeight(0.8)),
        _buildTitle("Trending Shops"),
        _buildTrendingShopsCardSlider()
      ],
    );
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

  Widget _buildFeaturedProductsCardSlider() {
    return BlocBuilder(
      bloc: dashboardBloc,
      builder: (BuildContext context, DashboardState state) {
        if (state is InitialDashboardState) {
//          return _buildFeaturedProductCard();
          return Container(
            height: ScreenUtil.getHeight(25),
            child: Center(child: CircularProgressIndicator()),
            color: Colors.grey[300],
          );
        }

        if (state is NetworkErrorFetchingProductsDashboardState) {
          print(state.error);
        }

        if (state is NetworkBusyFetchingProductsDashboardState) {
          return Container(
            height: ScreenUtil.getHeight(25),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is FeaturedProductsFetchedDashboardState) {
          if (!state.hasData) {}

          List items = state.productList;

          items = [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(color: Colors.amber),
                    child: Text(
                      'text $i',
                      style: TextStyle(fontSize: 16.0),
                    ));
              },
            );
          }).toList();

          return CarouselSlider(
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
        return null;
      },
    );
  }

  Widget _buildTrendingShopsCardSlider() {
    return BlocBuilder(
      bloc: dashboardBloc,
      builder: (BuildContext context, DashboardState state) {
        if (state is InitialDashboardState) {
          return Container(
            height: ScreenUtil.getHeight(30),
            child: Center(child: CircularProgressIndicator()),
            color: Colors.grey[300],
          );
        }

        if (state is NetworkErrorFetchingShopsDashboardState) {
          print(state.error);
        }

        if (state is NetworkBusyFetchingShopsDashboardState) {
          return Container(
            height: ScreenUtil.getHeight(25),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is TrendingShopsFetchedDashboardState) {
          if (!state.hasData) {}

          List items = state.shopList;

          items = [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(color: Colors.amber),
                    child: Text(
                      'text $i',
                      style: TextStyle(fontSize: 16.0),
                    ));
              },
            );
          }).toList();

          return CarouselSlider(
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
        return null;
      },
    );
    
    
  }


  Widget _buildTrendingProductCard() {
    var items = [1, 2, 3, 4, 5].map((i) {
      return Builder(builder: (BuildContext context) {
        return _build();
      });
    }).toList();
  
    return CarouselSlider(
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
  Widget _build() {
    return Container(
      height: ScreenUtil.getHeight(25),
      width: ScreenUtil.getWidth(35),
      child: Column(
        children: <Widget>[
          Container(
            height: ScreenUtil.getHeight(22),
            width: ScreenUtil.getWidth(35),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: ScreenUtil.getBorderRadiusCircular(10),
              ),
            child: FlutterLogo(),
            ),
          Text("Shop Name")
        ],
        ),
      );
  }


  Container _buildFeaturedProductCard() {
    return Container(
      padding: ScreenUtil.getPaddingAll(10),
      height: ScreenUtil.getHeight(25),
      width: double.infinity,
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            width: ScreenUtil.getWidth(50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Time to Sparkle your Attire",
                  style: TextStyle(
                    fontSize: ScreenUtil.getTextSize(13),
                    fontWeight: FontWeight.w800,
                    ),
                  ),
                SizedBox(height: ScreenUtil.getHeight(0.5)),
                Text("*Starting at Rs.50/= onwards"),
              ],
              ),
            ),
          Container(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Text(
                  "HeartStone Designs",
                  style: TextStyle(
                    fontSize: ScreenUtil.getTextSize(11),
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[800],
                    ),
                  ),
                SizedBox(height: ScreenUtil.getHeight(0.25)),
                Text(
                  "No. 1/D, John Place, Colombo 07",
                  style: TextStyle(
                    fontSize: ScreenUtil.getTextSize(8),
                    fontStyle: FontStyle.italic,
                    color: Colors.grey[800],
                    ),
                  ),
              ],
              ),
            )
        ],
        ),
      );
  }

  @override
  void dispose() {
    dashboardBloc.dispose();
    super.dispose();
  }
}
