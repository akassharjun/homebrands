import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homebrands/bloc/category/category_bloc.dart';
import 'package:homebrands/model/category.dart';
import 'package:homebrands/widgets/alert_box.dart';
import 'package:homebrands/widgets/progress_indicator.dart';

import '../utils/screen_util.dart';
import 'shop_list.dart';

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
    return BlocBuilder(
      bloc: categoryBloc,
      builder: (BuildContext context, CategoryState state) {
        if (state is InitialCategoryState) {
          return LoadingWidget();
        }
        if (state is NetworkErrorCategoryState) {
          ErrorDialog.getAlertBox(
              context: context,
              onPressed: () {
                categoryBloc.dispatch(FetchCategoryList());
              },
              title: "ERROR",
              message: state.error,
              flatButtonText: "Try Again!");
        }

        if (state is NetworkBusyCategoryState) {
          return LoadingWidget();
        }

        if (state is CategoryListFetchedCategoryState) {
          if (!state.hasData) {}
          categoryList = state.categoryList;
          return _buildCategoryGridView();
        }

        return LoadingWidget();
      },
    );
  }

  Padding _buildCategoryGridView() {
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

//Dummy list of category items
//  List<Category> menuItems = [
//    Category(
//        name: 'Pizzas',
//        thumbnail:
//            'https://images.pexels.com/photos/67636/rose-blue-flower-rose-blooms-67636.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
//    Category(
//        name: 'Cookies',
//        thumbnail:
//            'https://cdn.pixabay.com/photo/2017/02/08/17/24/butterfly-2049567__340.jpg'),
//    Category(
//        name: 'crafts',
//        thumbnail:
//            'https://images.pexels.com/photos/1020315/pexels-photo-1020315.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
//    Category(
//        name: 'arts',
//        thumbnail:
//            'https://images.pexels.com/photos/67636/rose-blue-flower-rose-blooms-67636.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
//    Category(
//        name: 'Flowers',
//        thumbnail:
//            'https://cdn.pixabay.com/photo/2017/02/08/17/24/butterfly-2049567__340.jpg'),
//    Category(
//        name: 'Pottery',
//        thumbnail:
//            'https://images.pexels.com/photos/1020315/pexels-photo-1020315.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
//    Category(
//        name: 'Pets',
//        thumbnail:
//            'https://images.pexels.com/photos/67636/rose-blue-flower-rose-blooms-67636.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
//    Category(
//        name: 'Jonnies Cookies',
//        thumbnail:
//            'https://cdn.pixabay.com/photo/2017/02/08/17/24/butterfly-2049567__340.jpg'),
//    Category(
//        name: 'Archies Buns',
//        thumbnail:
//            'https://images.pexels.com/photos/1020315/pexels-photo-1020315.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
//  ];
}
