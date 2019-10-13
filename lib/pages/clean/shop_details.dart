import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homebrands/bloc/shop_details/shop_details_bloc.dart';
import 'package:homebrands/model/product.dart';
import 'package:homebrands/model/shop.dart';
import 'package:homebrands/widgets/bloc_error_handling.dart';
import 'package:homebrands/widgets/progress_indicator.dart';

class ShopPage extends StatefulWidget {
  final Shop shop;

  ShopPage({this.shop});

  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final shopDetailsBloc = ShopDetailsBloc();
  Shop _shop;

  @override
  void initState() {
    _shop = widget.shop;

    shopDetailsBloc.dispatch(FetchProductList(_shop.id));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
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
        }
        return BlocIssue("_buildShopDetailsBuilder()");
      },
    );
  }
}
