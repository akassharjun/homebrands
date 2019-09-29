import 'package:flutter/material.dart';
import 'package:homebrands/constants.dart';
import 'package:homebrands/model/category.dart';
import 'package:homebrands/pages/dashboard.dart';
import 'package:homebrands/utils/screen_util.dart';
import 'package:homebrands/widgets/app_logo.dart';

import 'category.dart';
import 'favourites.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPageIndex = 0;
  PageController _controller = PageController();


  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();


  Category category = new Category(
    name: 'Cakes & Sweets',
  );

  @override
  Widget build(BuildContext context) {
    ScreenUtil()..init(context);
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Center(child: Column(
                children: <Widget>[
                  AppLogo(),
                  Text('dfadf')
                ],
              )),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: IconButton(icon: new Icon(Icons.menu, color: kAsh,),
            onPressed: () => _scaffoldKey.currentState.openDrawer()),
        title: AppLogo(),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          GestureDetector(
            onTap: (){
              Navigator.pushNamed(context,Routes.USER_PROFILE);
              print('pressed profile icon');
            },
            child: Container(
              padding: ScreenUtil.getPaddingAll(5),
              margin: ScreenUtil.getPaddingAll(10),
              child: Center(child: Icon(Icons.person)),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kMagenta,
              ),
            ),
          ),
        ],
      ),
      body: PageView(
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          DashboardPage(),
          CategoryPage(),
          FavouritesPage(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Container _buildBottomNavigationBar() {
    return Container(
      height: ScreenUtil.getHeight(8),
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
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
            title: _buildBottomNavigationItemTitle("Dashboard"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: _buildBottomNavigationItemTitle("Categories"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: _buildBottomNavigationItemTitle("Favorites"),
          ),
        ],
      ),
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
}
