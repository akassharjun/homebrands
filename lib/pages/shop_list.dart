import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homebrands/bloc/shop_list/shop_list_bloc.dart';
import 'package:homebrands/model/category.dart';
import 'package:homebrands/model/shop.dart';
import 'package:homebrands/pages/shop_details.dart';
import 'package:homebrands/utils/screen_util.dart';
import 'package:homebrands/widgets/alert_box.dart';
import 'package:homebrands/widgets/progress_indicator.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

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
        title: Text(_category.name),
      ),
      body: SafeArea(
        child: BlocListener(
          bloc: shopListBloc,
          listener: (BuildContext context, ShopListState state) {
            if (state is NetworkErrorShopListState) {
              ErrorDialog.getAlertBox(
                  context: context,
                  onPressed: () {
                    shopListBloc.dispatch(FetchShopList(_category.name));
                  },
                  title: "ERROR",
                  message: state.error,
                  flatButtonText: "Try Again!");
            }
          },
          child: BlocBuilder(
            bloc: shopListBloc,
            builder: (BuildContext context, ShopListState state) {
              if (state is InitialShopListState) {
                return LoadingWidget();
              }
              if (state is NetworkErrorShopListState) {
                return LoadingWidget();
              }
              if (state is NetworkBusyShopListState) {
                return LoadingWidget();
              }
              if (state is ShopListFetchedShopListState) {
                _allShops = state.shopList;
                return _buildShopListGrid();
              }
              return LoadingWidget();
            },
          ),
        ),
      ),
    );
  }

  GridView _buildShopListGrid() {
    return GridView.builder(
      itemCount: _allShops.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (BuildContext context, int index) {
        return _buildShopContainer(index);
      },
    );
  }

  _viewShop(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ShopPage(
          shop: _allShops[index],
        ),
      ),
    );
  }

  Widget _buildShopContainer(int shopIndex) {
    
    return GestureDetector(
      onTap: () {
        _viewShop(shopIndex);
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                child: Image.network(
                  _allShops[shopIndex].image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  _allShops[shopIndex].businessName,
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: ScreenUtil.getTextSize(11)),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      _allShops[shopIndex].paymentMethod.toString(),
                    ),
                    SizedBox(
                      height: ScreenUtil.getHeight(0.5),
                    ),
                    SmoothStarRating(
                      starCount: 5,
                      rating: getStarRating().toDouble(),
                      size: ScreenUtil.getHeight(1.5),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

//method to generate random star ratings
int getStarRating() {
  var range = Random();
  return range.nextInt(6);
}

//Dummy list of shops

List<Shop> _allShops = [];

//List<Shop> _allShops = [
//  Shop(
//    businessName: 'Enzo pizzarie',
//    paymentMethod: "Cash/Card",
//  ),
//  Shop(
//    businessName: 'Kashu nuts',
//    paymentMethod: "Cash/Card",
//  ),
//  Shop(
//    businessName: 'Colombo farm shop',
//    paymentMethod: "Cash/Card",
//  ),
//  Shop(
//    businessName: 'Factory Outlet',
//    paymentMethod: "Cash/Card",
//  ),
//  Shop(
//    businessName: 'Enzo pizzarie',
//    paymentMethod: "Cash/Card",
//  ),
//  Shop(
//    businessName: 'Kashu nuts',
//    paymentMethod: "Cash/Card",
//  ),
//  Shop(
//    businessName: 'Colombo farm shop',
//    paymentMethod: "Cash/Card",
//  ),
//  Shop(
//    businessName: 'Factory Outlet',
//    paymentMethod: "Cash/Card",
//  ),
//  Shop(
//    businessName: 'Enzo pizzarie',
//    paymentMethod: "Cash/Card",
//  ),
//  Shop(
//    businessName: 'Kashu nuts',
//    paymentMethod: "Cash/Card",
//  ),
//  Shop(
//    businessName: 'Colombo farm shop',
//    paymentMethod: "Cash/Card",
//  ),
//  Shop(
//    businessName: 'Factory Outlet',
//    paymentMethod: "Cash/Card",
//  ),
//  Shop(
//    businessName: 'Enzo pizzarie',
//    paymentMethod: "Cash/Card",
//  ),
//  Shop(
//    businessName: 'Kashu nuts',
//    paymentMethod: "Cash/Card",
//  ),
//  Shop(
//    businessName: 'Colombo farm shop',
//    paymentMethod: "Cash/Card",
//  ),
//  Shop(
//    businessName: 'Factory Outlet',
//    paymentMethod: "Cash/Card",
//  ),
//];
