import 'package:flutter/material.dart';
import 'package:homebrands/constants.dart';
import 'package:homebrands/model/category.dart';
import 'package:homebrands/pages/clean/dashboard.dart';
import 'package:homebrands/utils/screen_util.dart';
import 'package:homebrands/widgets/app_logo.dart';

import 'clean/category.dart';
import 'clean/favourites.dart';

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
              child: Center(
                  child: Column(
                children: <Widget>[AppLogo(), Text('Business')],
              )),
            ),
            ListTile(
              leading: Icon(Icons.shop),
              title: Text("Business Consultation"),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 16.0, 8.0, 4.0),
              child: Text("Your Businesses", style: TextStyle(fontWeight: FontWeight.bold),),
            ),
            ListTile(
              title: Text("Suresh Foods", style: TextStyle(fontWeight: FontWeight.w500)),
              onTap: () {
                Navigator.pushNamed(context, Routes.BUSINESS_PROFILE);
                print('pressed suresh foods');
              },
            ),
            ListTile(
              title: Text("Ape Kade", style: TextStyle(fontWeight: FontWeight.w500)),
              onTap: () {
                Navigator.pushNamed(context, Routes.BUSINESS_PROFILE);
                print('pressed suresh foods');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        leading: IconButton(
            icon: new Icon(
              Icons.menu,
              color: kAsh,
            ),
            onPressed: () => _scaffoldKey.currentState.openDrawer()),
        title: AppLogo(),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.USER_PROFILE);
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
