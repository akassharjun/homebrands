import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homebrands/bloc/favorite/favorite_bloc.dart';
import 'package:homebrands/model/product.dart';
import 'package:homebrands/widgets/bloc_error_handling.dart';
import 'package:homebrands/widgets/progress_indicator.dart';

class FavouritesPage extends StatefulWidget {
  @override
  _FavouritesPageState createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  final favouritesBloc = FavouritesBloc();

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget _buildFavouriteListBuilder() {
    return BlocBuilder(
      bloc: favouritesBloc,
      builder: (BuildContext context, FavouriteState state) {
        if (state is InitialFavouriteState) {
          return LoadingWidget();
        }
        if (state is NetworkErrorFavouriteState) {
          return NetworkError("NetworkErrorFavouriteState");
        }
        if (state is NetworkBusyFavouriteState) {
          return LoadingWidget();
        }
        if (state is FavouriteListFetchedFavouriteState) {
          if (!state.hasData) {
            // return error dialog here
            return NoData();
          }

          List<Product> products = state.productList;
        }
        return BlocIssue("_buildFavouriteListBuilder()");
      },
    );
  }
}
