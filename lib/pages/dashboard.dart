import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homebrands/bloc/dashboard/dashboard_bloc.dart';
import 'package:homebrands/utils/screen_util.dart';
import 'package:homebrands/utils/theme_data.dart';
import 'package:homebrands/widgets/app_logo.dart';
import 'package:homebrands/constants.dart';
import 'package:homebrands/model/category.dart';

class DashboardPage extends StatefulWidget {
  static const ROUTE = "dashboard";

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final dashboardBloc = DashboardBloc();
  int _currentPageIndex = 0;
  PageController _controller = PageController();

  Category category = new Category(
    name: 'Cakes & Sweets',
  );

  @override
  Widget build(BuildContext context) {
    ScreenUtil()..init(context);

    return Scaffold(
      appBar: AppBar(
        title: AppLogo(),
        centerTitle: true,
        backgroundColor: Colors.grey[50],
        elevation: 0,
        actions: <Widget>[
          Container(
            padding: ScreenUtil.getPaddingAll(5),
            margin: ScreenUtil.getPaddingAll(10),
            child: Icon(Icons.person),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: kMagenta,
            ),
          ),
        ],
      ),
      body: PageView(
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          _buildDashboardPage(),
          _buildCategoryPage(),
//          Column(
//            children: <Widget>[
//              _buildFeaturedProductCard(),
//              Container(
//                height: ScreenUtil.getHeight(28),
//                child: _buildTrendingProductCard(),
//              )
//            ],
//          ),
          Container(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  //Method to build the category menu
  Widget _buildCategoryPage(){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: <Widget>[
          _buildCategoryContainer(),
          _buildCategoryContainer(),
          _buildCategoryContainer(),
          _buildCategoryContainer(),
          _buildCategoryContainer(),
          _buildCategoryContainer(),
          _buildCategoryContainer(),
          _buildCategoryContainer(),
          showLoadingIndicator(),
        ],
      ),
    );
  }

  //method to create a category method item
  Widget _buildCategoryContainer(){
    return GestureDetector(
      onTap: (){
        _alertBox();
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: ScreenUtil.getHeight(10),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Container(
                  child: Image.network('https://images.pexels.com/photos/67636/rose-blue-flower-rose-blooms-67636.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                  fit: BoxFit.fill,),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    category.name,
                    style: TextStyle(
                      fontSize: ScreenUtil.getTextSize(10)
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //method to display circular loading indicator
  Widget showLoadingIndicator(){
    return Container(
      height: ScreenUtil.getHeight(25),
      child: Center(child: CircularProgressIndicator()),
    );
  }

  Future<void> _alertBox() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('error message :)'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Error message.'),
                Text('Error message'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'OK!',
                style: TextStyle(
                  color: kMagenta
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildTrendingProductCard() {
    var items = [1, 2, 3, 4, 5].map((i) {
      return Builder(builder: (BuildContext context) {
        return _build();
      });
    }).toList();

    return CarouselSlider(
      items: items,
      height: ScreenUtil.getHeight(28),
      aspectRatio: 16 / 9,
      viewportFraction: 0.45,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      pauseAutoPlayOnTouch: Duration(seconds: 10),
      enlargeCenterPage: false,
      scrollDirection: Axis.horizontal,
    );
  }

  Widget _build() {
    return Container(
      height: ScreenUtil.getHeight(25),
      width: ScreenUtil.getWidth(35),
      child: Column(
        children: <Widget>[
          Container(
            height: ScreenUtil.getHeight(22),
            width: ScreenUtil.getWidth(35),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: ScreenUtil.getBorderRadiusCircular(10),
            ),
            child: FlutterLogo(),
          ),
          Text("Shop Name")
        ],
      ),
    );
  }

  Container _buildBottomNavigationBar() {
    return Container(
      height: ScreenUtil.getHeight(8),
      child: BottomNavigationBar(
        backgroundColor: Colors.grey[50],
        onTap: (int index) {
          setState(() {
            _controller.animateToPage(index,
                duration: Duration(milliseconds: 250), curve: Curves.easeIn);
            _currentPageIndex = index;
          });
        },
        currentIndex: _currentPageIndex,
        elevation: 0.0,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: _buildBottomNavigationItemTitle("Dashboard")),
          BottomNavigationBarItem(
              icon: Icon(Icons.category),
              title: _buildBottomNavigationItemTitle("Categories")),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              title: _buildBottomNavigationItemTitle("Favorites")),
        ],
      ),
    );
  }

  Container _buildFeaturedProductCard() {
    return Container(
      padding: ScreenUtil.getPaddingAll(10),
      height: ScreenUtil.getHeight(25),
      width: double.infinity,
      color: Colors.grey[200],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            width: ScreenUtil.getWidth(50),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Time to Sparkle your Attire",
                  style: TextStyle(
                    fontSize: ScreenUtil.getTextSize(13),
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: ScreenUtil.getHeight(0.5)),
                Text("*Starting at Rs.50/= onwards"),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Text(
                  "HeartStone Designs",
                  style: TextStyle(
                    fontSize: ScreenUtil.getTextSize(11),
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: ScreenUtil.getHeight(0.25)),
                Text(
                  "No. 1/D, John Place, Colombo 07",
                  style: TextStyle(
                    fontSize: ScreenUtil.getTextSize(8),
                    fontStyle: FontStyle.italic,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Column _buildDashboardPage() {
    return Column(
      children: <Widget>[
        SizedBox(height: ScreenUtil.getHeight(0.25)),
        _buildTitle("Featured Products"),
        _buildFeaturedProductsCardSlider(),
        SizedBox(height: ScreenUtil.getHeight(0.8)),
        _buildTitle("Trending Shops"),
        _buildTrendingShopsCardSlider()
      ],
    );
  }

  Text _buildBottomNavigationItemTitle(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: ScreenUtil.getTextSize(10),
      ),
    );
  }

  Align _buildTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: ScreenUtil.getPaddingAll(8),
        child: Text(
          title,
          style: TextStyle(
            fontSize: ScreenUtil.getTextSize(12),
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildFeaturedProductsCardSlider() {
    return BlocBuilder(
      bloc: dashboardBloc,
      builder: (BuildContext context, DashboardState state) {
        if (state is InitialDashboardState) {
//          return _buildFeaturedProductCard();
          return Container(
            height: ScreenUtil.getHeight(25),
            child: Center(child: CircularProgressIndicator()),
            color: Colors.grey[300],
          );
        }

        if (state is NetworkErrorFetchingProductsDashboardState) {
          print(state.error);
        }

        if (state is NetworkBusyFetchingProductsDashboardState) {
          return Container(
            height: ScreenUtil.getHeight(25),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is FeaturedProductsFetchedDashboardState) {
          if (!state.hasData) {}

          List items = state.productList;

          items = [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(color: Colors.amber),
                    child: Text(
                      'text $i',
                      style: TextStyle(fontSize: 16.0),
                    ));
              },
            );
          }).toList();

          return CarouselSlider(
            items: items,
            height: ScreenUtil.getHeight(25),
            aspectRatio: 16 / 9,
            viewportFraction: 1.0,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            pauseAutoPlayOnTouch: Duration(seconds: 10),
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          );
        }
        return null;
      },
    );
  }

  Widget _buildTrendingShopsCardSlider() {
    return BlocBuilder(
      bloc: dashboardBloc,
      builder: (BuildContext context, DashboardState state) {
        if (state is InitialDashboardState) {
          return Container(
            height: ScreenUtil.getHeight(30),
            child: Center(child: CircularProgressIndicator()),
            color: Colors.grey[300],
          );
        }

        if (state is NetworkErrorFetchingShopsDashboardState) {
          print(state.error);
        }

        if (state is NetworkBusyFetchingShopsDashboardState) {
          return Container(
            height: ScreenUtil.getHeight(25),
            child: Center(child: CircularProgressIndicator()),
          );
        }

        if (state is TrendingShopsFetchedDashboardState) {
          if (!state.hasData) {}

          List items = state.shopList;

          items = [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.symmetric(horizontal: 5.0),
                    decoration: BoxDecoration(color: Colors.amber),
                    child: Text(
                      'text $i',
                      style: TextStyle(fontSize: 16.0),
                    ));
              },
            );
          }).toList();

          return CarouselSlider(
            items: items,
            height: ScreenUtil.getHeight(25),
            aspectRatio: 16 / 9,
            viewportFraction: 1.0,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            pauseAutoPlayOnTouch: Duration(seconds: 10),
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          );
        }
        return null;
      },
    );
  }

  @override
  void dispose() {
    dashboardBloc.dispose();
    super.dispose();
  }
}
