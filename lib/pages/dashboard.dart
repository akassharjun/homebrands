import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homebrands/bloc/dashboard/dashboard_bloc.dart';
import 'package:homebrands/model/shop.dart';
import 'package:homebrands/utils/screen_util.dart';
import 'package:homebrands/widgets/alert_box.dart';
import 'package:homebrands/widgets/heading.dart';
import 'package:homebrands/widgets/progress_indicator.dart';

import '../constants.dart';

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

  Widget _buildDashboardPage() {
    return Column(
      children: <Widget>[
        SizedBox(height: ScreenUtil.getHeight(0.25)),
        Heading.buildTitle("Featured Products"),
        _buildFeaturedProductsCardSlider(),
        SizedBox(height: ScreenUtil.getHeight(0.8)),
        Heading.buildTitle("Trending Shops"),
        _buildTrendingShopsCardSlider()
      ],
    );
  }

  Widget _buildFeaturedProductsCardSlider() {
    return BlocBuilder(
      bloc: dashboardBloc,
      builder: (BuildContext context, DashboardState state) {
        if (state is InitialDashboardState) {
          return _buildWidget();
          return LoadingWidget();
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
          if (!state.hasData) {
            return Container(child: Text("No Data"));
          }

          List items = state.productList;

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
        return LoadingWidget();
      },
    );
  }

  Widget _buildTrendingShopsCardSlider() {
    return GestureDetector(
      onTap: () {
//        displayAlertBox();
        print('tapped trending');
      },
      child: BlocBuilder(
        bloc: dashboardBloc,
        builder: (BuildContext context, DashboardState state) {
          if (state is InitialDashboardState) {
            return _buildTrendingProductCard();
          }

          if (state is NetworkBusyFetchingShopsDashboardState) {
            return LoadingWidget();
          }

          if (state is TrendingShopsFetchedDashboardState) {
            if (!state.hasData) {
              return Container(child: Text("No Data"));
            }

            return _buildTrendingProductCard();
          }
          return Container();
        },
      ),
    );
  }

  List<Widget> getTrendingCarouselItems() {
    List<Widget> trendingItems = [];
    for (var i = 0; i < _allShops.length; ++i) {
      trendingItems.add(_build(_allShops[i]));
    }
    return trendingItems;
  }

  Widget _buildFeaturedItem(Shop shop) {
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
                  shop.businessName,
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

  Widget _buildTrendingItem(Shop shop) {
    return Container(
      height: ScreenUtil.getHeight(20),
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
            child: FlutterLogo(),
          ),
          Text(shop.businessName)
        ],
      ),
    );
  }

  Widget _buildTrendingProductCard() {
    return CarouselSlider(
      height: 280,
      viewportFraction: 0.5,
      items: <Widget>[
        TrendingCarouselItem(
          sellerNameTag: 'HeartStone Designs',
          svgAsset: 'assets/images/products/rings.svg',
          svgContainerColor: Color(0xffEC00E2),
          ellipseColor: Color(0xff7E1AFF),
        ),
        TrendingCarouselItem(
          sellerNameTag: 'HeartStone Designs',
          svgAsset: 'assets/images/products/desert.svg',
          svgContainerColor: Color(0xffff0000),
          ellipseColor: Color(0xffcc0000),
        ),
        TrendingCarouselItem(
          sellerNameTag: 'HeartStone Designs',
          svgAsset: 'assets/images/products/leaf.svg',
          svgContainerColor: Color(0xff00FFF0),
          ellipseColor: Color(0xff15DB7C),
        ),
        TrendingCarouselItem(
          sellerNameTag: 'HeartStone Designs',
          svgAsset: 'assets/images/products/cake.svg',
          svgContainerColor: Color(0xffFFCD00),
          ellipseColor: Color(0xffFD6A00),
        ),
        TrendingCarouselItem(
          sellerNameTag: 'HeartStone Designs',
          svgAsset: 'assets/images/products/cake slice.svg',
          svgContainerColor: Color(0xffff0000),
          ellipseColor: Color(0xffcc0000),
        ),
      ],
    );

//    var items = _allShops.toList().map((i) {
//      return Builder(builder: (BuildContext context) {
//        return _buildTrendingItem(i);
//      });
//    }).toList();
//
//    return CarouselSlider(
//      items: items,
//      height: ScreenUtil.getHeight(28),
//      aspectRatio: 16 / 9,
//      viewportFraction: 0.45,
//      initialPage: 0,
//      enableInfiniteScroll: true,
//      reverse: false,
//      autoPlay: true,
//      autoPlayInterval: Duration(seconds: 3),
//      autoPlayAnimationDuration: Duration(milliseconds: 800),
//      pauseAutoPlayOnTouch: Duration(seconds: 10),
//      enlargeCenterPage: false,
//      scrollDirection: Axis.horizontal,
//    );
  }

  Widget _build(Shop shop) {
    return Container(
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
            child: FlutterLogo(),
          ),
          Text(shop.businessName)
        ],
      ),
    );
  }

  Widget _buildFeaturedProductCard() {
    var items = _allShops.toList().map((i) {
      return Builder(builder: (BuildContext context) {
        return _buildFeaturedItem(i);
      });
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

  //method to display circular loading indicator
//  Widget showLoadingIndicator() {
//    return
//  }

  Future<void> displayAlertBox() {
    return ErrorDialog.getAlertBox(
        context: context,
        title: 'Network Error',
        message: 'Couldn\'t detect a stable Internet Connection',
        flatButtonText: 'Try again');
  }

  @override
  void dispose() {
    dashboardBloc.dispose();
    super.dispose();
  }
}

Widget _buildWidget() {
  return CarouselSlider(
    height: 200,
    viewportFraction: 0.97,
    items: <Widget>[
      Card(
        elevation: 2,
        child: Container(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Time to Sparkle your Attire',
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: kGrey,
                                fontSize: 20),
                          ),
                          Text(
                            '*Starting at Rs.50/= onwards',
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: kGrey,
                                fontSize: 13),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            width: 90,
                            height: 30,
                            decoration: BoxDecoration(
                                color: kAsh,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'See more',
                                  style: TextStyle(color: kWhite),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Center(
                                  child: Icon(
                                    FontAwesomeIcons.chevronRight,
                                    size: 10,
                                    color: kWhite,
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
//                      padding: EdgeInsets.all(10),
                      child: Image.network(
                        'https://raw.githubusercontent.com/v15a1/DEMO/master/assets/images/products/bracelet.png?token=AJELHUM3JM6RZOQ7ZBKJ2TS5TFY6U',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )
    ],
  );
}

//Dummy list of shops
List<Shop> _allShops = [
  Shop(
    businessName: 'Enzo pizzarie',
    paymentMethod: "Cash/Card",
  ),
  Shop(
    businessName: 'Kashu nuts',
    paymentMethod: "Cash/Card",
  ),
  Shop(
    businessName: 'Colombo farm shop',
    paymentMethod: "Cash/Card",
  ),
  Shop(
    businessName: 'Factory Outlet',
    paymentMethod: "Cash/Card",
  ),
  Shop(
    businessName: 'Enzo pizzarie',
    paymentMethod: "Cash/Card",
  ),
  Shop(
    businessName: 'Kashu nuts',
    paymentMethod: "Cash/Card",
  ),
  Shop(
    businessName: 'Colombo farm shop',
    paymentMethod: "Cash/Card",
  ),
  Shop(
    businessName: 'Factory Outlet',
    paymentMethod: "Cash/Card",
  ),
  Shop(
    businessName: 'Enzo pizzarie',
    paymentMethod: "Cash/Card",
  ),
  Shop(
    businessName: 'Kashu nuts',
    paymentMethod: "Cash/Card",
  ),
  Shop(
    businessName: 'Colombo farm shop',
    paymentMethod: "Cash/Card",
  ),
  Shop(
    businessName: 'Factory Outlet',
    paymentMethod: "Cash/Card",
  ),
  Shop(
    businessName: 'Enzo pizzarie',
    paymentMethod: "Cash/Card",
  ),
  Shop(
    businessName: 'Kashu nuts',
    paymentMethod: "Cash/Card",
  ),
  Shop(
    businessName: 'Colombo farm shop',
    paymentMethod: "Cash/Card",
  ),
  Shop(
    businessName: 'Factory Outlet',
    paymentMethod: "Cash/Card",
  ),
];

class TrendingCarouselItem extends StatelessWidget {
  final String sellerNameTag;
  final String svgAsset;
  final Color ellipseColor;
  final Color svgContainerColor;
  final Function onTap;

  TrendingCarouselItem(
      {@required this.sellerNameTag,
      @required this.ellipseColor,
      @required this.svgAsset,
      @required this.svgContainerColor,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Container(
              height: 150,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: svgContainerColor,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      offset: Offset(0.0, 4.0),
                      blurRadius: 10.0,
                    ),
                  ]),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: SvgPicture.asset(
                  svgAsset,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
//            Container(
//              height: 25,
//              width: 25,
//              decoration: BoxDecoration(
//                borderRadius: BorderRadius.circular(100),
//                color: ellipseColor,
//              ),
//            ),
            SizedBox(
              height: 20,
            ),
            Text(
              sellerNameTag,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
