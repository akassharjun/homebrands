import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:homebrands/bloc/shop_list/shop_list_bloc.dart';
import 'package:homebrands/model/category.dart';
import 'package:homebrands/model/shop.dart';
import 'package:homebrands/pages/clean/shop_details.dart';
import 'package:homebrands/utils/screen_util.dart';
import 'package:homebrands/widgets/bloc_error_handling.dart';
import 'package:homebrands/widgets/progress_indicator.dart';
import 'package:homebrands/utils/screen_util.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../../constants.dart';

class ShopListPage extends StatefulWidget {
  final Category category;

  ShopListPage({this.category});

  @override
  _ShopListPageState createState() => _ShopListPageState();
}

class _ShopListPageState extends State<ShopListPage> {
  final shopListBloc = ShopListBloc();

  @override
  void initState() {
    Category _category = widget.category;
    shopListBloc.dispatch(FetchShopList(_category.name));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Category _category = widget.category;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kWhite,
        leading: GestureDetector(
          onTap: (){Navigator.pop(context);},
          child: Icon(Icons.chevron_left, color: kMagenta, size: 30,),
        ),
        title: Text(
          widget.category.name,
          style: TextStyle(
            color: kAsh
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: CustomScrollView(
            scrollDirection: Axis.vertical,
            slivers: <Widget>[
              Container(
                child: SliverToBoxAdapter(
                    child: Container(
                        height: MediaQuery.of(context).size.height,
                        child: _buildShopListBuilder())
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildShopListBuilder() {
    return BlocBuilder(
      bloc: shopListBloc,
      builder: (BuildContext context, ShopListState state) {
        if (state is InitialShopListState) {
          return LoadingWidget();
        }
        if (state is NetworkErrorShopListState) {
          return NetworkError("NetworkErrorShopListState");
        }
        if (state is NetworkBusyShopListState) {
          return LoadingWidget();
        }
        if (state is ShopListFetchedShopListState) {
          if (!state.hasData) {
            // return error dialog here
            return NoData();
          }

          List<Shop> shops = state.shopList;
          return _buildShopListGrid(shops);
        }
        return BlocIssue("_buildShopListBuilder()");
      },
    );
  }

  GridView _buildShopListGrid(List<Shop> shops) {
    return GridView.builder(
      itemCount: shops.length,
      gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1,childAspectRatio:1.7),
      itemBuilder: (BuildContext context, int index) {
        return _buildShopContainer(shops, index);
      },
    );
  }

  _viewShop(List<Shop> shops, int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ShopPage(
          shop: shops[index],
        ),
      ),
    );
  }

  Widget _buildShopContainer(List<Shop> shops,int shopIndex) {

    return GestureDetector(
      onTap: () {
        _viewShop(shops,shopIndex);
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                child: Image.network(shops[shopIndex].image, fit: BoxFit.cover,)),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                child: Container(
                  width: double.maxFinite,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            shops[shopIndex].businessName,
                            style: TextStyle(
                              fontSize: ScreenUtil.getTextSize(11)
                            ),
                          ),
                          SizedBox(
                            height: ScreenUtil.getHeight(0.2),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(2)),
                              color: Colors.grey.shade100,

                            ),
                            width: 70,
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Row(
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
                          SizedBox(
                            height: ScreenUtil.getWidth(1),
                          ),
                          Text(
                            "${getDeliveryTime()} DAYS",
                            style: TextStyle(
                              color: kGrey,
                              fontSize: ScreenUtil.getTextSize(9)
                            ),
                          ),
                          SizedBox(
                            height: ScreenUtil.getWidth(1),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(FontAwesomeIcons.heart,
                        size: 20,
                        color: kAsh,),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        )
      ),
    );
  }
}

//method to generate random star ratings
int getStarRating() {
  var range = Random();
  return range.nextInt(6);
}
int getNumberOfRatings() {
  var range = Random();
  return range.nextInt(100);
}
int getDeliveryTime() {
  var range = Random();
  return range.nextInt(7);
}




