import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homebrands/bloc/category/category_bloc.dart';
import 'package:homebrands/model/category.dart';
import 'package:homebrands/widgets/bloc_error_handling.dart';
import 'package:homebrands/widgets/progress_indicator.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final categoryBloc = CategoryBloc();
  List<Category> categoryList = [];

  @override
  void initState() {
    super.initState();
    print("Init State");
    categoryBloc.dispatch(FetchCategoryList());
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  Widget _buildCategoryGridViewBuilder() {
    return BlocBuilder(
      bloc: categoryBloc,
      builder: (BuildContext context, CategoryState state) {
        if (state is InitialCategoryState) {
          return LoadingWidget();
        }

        if (state is NetworkErrorCategoryState) {
          return NetworkError("NetworkErrorCategoryState");
        }

        if (state is NetworkBusyCategoryState) {
          return LoadingWidget();
        }

        if (state is CategoryListFetchedCategoryState) {
          if (!state.hasData) {
            return NoData();
          }
          categoryList = state.categoryList;
        }

        return BlocIssue("_buildCategoryGridViewBuilder()");
      },
    );
  }
}
