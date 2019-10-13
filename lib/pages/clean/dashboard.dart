import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homebrands/bloc/dashboard/dashboard_bloc.dart';
import 'package:homebrands/model/shop.dart';
import 'package:homebrands/widgets/bloc_error_handling.dart';
import 'package:homebrands/widgets/progress_indicator.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final dashboardBloc = DashboardBloc();

  @override
  Widget build(BuildContext context) {
    return Container();
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
        }
        // ignore this
        return BlocIssue("FeaturedShops");
      },
    );
  }

  @override
  void dispose() {
    dashboardBloc.dispose();
    super.dispose();
  }
}
