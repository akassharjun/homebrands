import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homebrands/bloc/favorite/favorite_bloc.dart';
import 'package:homebrands/model/product.dart';
import 'package:homebrands/utils/screen_util.dart';
import 'package:homebrands/widgets/bloc_error_handling.dart';
import 'package:homebrands/widgets/heading.dart';
import 'package:homebrands/widgets/progress_indicator.dart';

class FavouritesPage extends StatefulWidget {
  @override
  _FavouritesPageState createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  final favouritesBloc = FavouritesBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Heading.buildTitle("Favourites"),
            SizedBox(height: ScreenUtil.getHeight(0.5)),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0)),
              margin: EdgeInsets.all(16.0),
              elevation: 2.0,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
//                            Container(
//                              height: 50,
//                              width: 50,
//                              color: Colors.amber,
//                            ),
                            
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Yeh's Items",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 18),
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Icon(Icons.star,
                                    size: 16.0, color: Colors.amber),
                                Icon(Icons.star,
                                    size: 16.0, color: Colors.amber),
                                Icon(Icons.star,
                                    size: 16.0, color: Colors.amber),
                                Icon(Icons.star,
                                    size: 16.0, color: Colors.amber),
                                Icon(Icons.star,
                                    size: 16.0, color: Colors.amber)
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text("Price Range: "),
                                SizedBox(width: ScreenUtil.getWidth(0.5)),
                                Text("150 LKR")
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text("Delivery Time: "),
                                SizedBox(width: ScreenUtil.getWidth(0.5)),
                                Text("30 mins")
                              ],
                            ),
                            SizedBox(height: ScreenUtil.getHeight(1)),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.check,
                                  size: 16.0,
                                  color: Colors.green,
                                ),
                                SizedBox(width: ScreenUtil.getWidth(0.5)),
                                Text("Pick up")
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.check,
                                  size: 16.0,
                                  color: Colors.green,
                                ),
                                SizedBox(width: ScreenUtil.getWidth(0.5)),
                                Text("Delivery")
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
//                    SizedBox(height: ScreenUtil.getHeight(2))
                  ],
                ),
              ),
            ),
//            SizedBox(height: ScreenUtil.getHeight(0.5)),
          ],
        ),
      ),
    );
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
