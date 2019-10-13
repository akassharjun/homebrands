import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homebrands/bloc/shop_list/shop_list_bloc.dart';
import 'package:homebrands/model/category.dart';
import 'package:homebrands/model/shop.dart';
import 'package:homebrands/widgets/bloc_error_handling.dart';
import 'package:homebrands/widgets/progress_indicator.dart';

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

    return Container();
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
        }
        return BlocIssue("_buildShopListBuilder()");
      },
    );
  }
}
