import 'package:flutter/material.dart';
import 'package:homebrands/constants.dart';
import 'package:homebrands/model/category.dart';
import 'package:homebrands/pages/dashboard.dart';
import 'package:homebrands/utils/screen_util.dart';
import 'package:homebrands/widgets/app_logo.dart';
import 'package:homebrands/widgets/alert_box.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentPageIndex = 0;
  PageController _controller = PageController();

  Category category = new Category(
    name: 'Cakes & Sweets',
  );


  //Dummy list of category items
  List<Category> menuItems = [
    Category(name: 'Enzos Pizzarie', thumbnail: 'https://images.pexels.com/photos/67636/rose-blue-flower-rose-blooms-67636.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
    Category(name: 'Jonnies Cookies', thumbnail: 'https://cdn.pixabay.com/photo/2017/02/08/17/24/butterfly-2049567__340.jpg'),
    Category(name: 'Archies Buns', thumbnail: 'https://images.pexels.com/photos/1020315/pexels-photo-1020315.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
    Category(name: 'Enzos Pizzarie', thumbnail: 'https://images.pexels.com/photos/67636/rose-blue-flower-rose-blooms-67636.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
    Category(name: 'Jonnies Cookies', thumbnail: 'https://cdn.pixabay.com/photo/2017/02/08/17/24/butterfly-2049567__340.jpg'),
    Category(name: 'Archies Buns', thumbnail: 'https://images.pexels.com/photos/1020315/pexels-photo-1020315.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
    Category(name: 'Enzos Pizzarie', thumbnail: 'https://images.pexels.com/photos/67636/rose-blue-flower-rose-blooms-67636.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
    Category(name: 'Jonnies Cookies', thumbnail: 'https://cdn.pixabay.com/photo/2017/02/08/17/24/butterfly-2049567__340.jpg'),
    Category(name: 'Archies Buns', thumbnail: 'https://images.pexels.com/photos/1020315/pexels-photo-1020315.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
  ];

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
          DashboardPage(),
          _buildCategoryPage(),
          Container(),
        ],
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  //Method to build the category menu
  Widget _buildCategoryPage() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GridView.builder(
        itemCount: menuItems.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index){
          return _buildCategoryContainer(index);
        }
      ),
    );
  }

  //method to navigate to each respective category screen depending on category
  navigateScreen(int index){
    if (index == 3){
      return AlertBox.getAlertBox();
    }
  }

  //method to create a category method item
  Widget _buildCategoryContainer(int menuItemIndex) {
    return GestureDetector(
      onTap: () => navigateScreen(menuItemIndex),
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
                    menuItems[menuItemIndex].thumbnail,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    menuItems[menuItemIndex].name,
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

  //method to display circular loading indicator
  Widget showLoadingIndicator() {
    return Container(
      height: ScreenUtil.getHeight(25),
      child: Center(child: CircularProgressIndicator()),
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
