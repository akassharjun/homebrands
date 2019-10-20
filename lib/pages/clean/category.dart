import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homebrands/bloc/category/category_bloc.dart';
import 'package:homebrands/model/category.dart';
import 'package:homebrands/pages/clean/shop_list.dart';
import 'package:homebrands/utils/screen_util.dart';
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
    return _buildCategoryGridViewBuilder();
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
          return _buildCategoryGridView(categoryList);
        }

        return BlocIssue("_buildCategoryGridViewBuilder()");
      },
    );
  }

  Padding _buildCategoryGridView(List<Category> category) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
          itemCount: categoryList.length,
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (BuildContext context, int index) {
            return _buildCategoryContainer(index, context);
          }),
    );
  }

  //method to create a category method item
  Widget _buildCategoryContainer(int menuItemIndex, BuildContext context) {
    return GestureDetector(
      onTap: () => navigateScreen(menuItemIndex, context),
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: ScreenUtil.getHeight(10),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Container(
                  child: Image.network(
                    categoryList[menuItemIndex].thumbnail,
                    fit: BoxFit.contain,
                    height: ScreenUtil.getHeight(4),
                    width: ScreenUtil.getHeight(4),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    categoryList[menuItemIndex].name,
                    style: TextStyle(fontSize: ScreenUtil.getTextSize(10)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

//method to navigate to each respective category screen depending on category
  navigateScreen(int index, BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ShopListPage(
          category: Category(name: categoryList[index].name),
        ),
      ),
    );
  }
}



