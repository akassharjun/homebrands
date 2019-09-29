import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:homebrands/constants.dart';
import 'package:homebrands/model/product.dart';
import 'package:homebrands/model/user.dart';
import 'package:homebrands/utils/screen_util.dart';
import 'package:homebrands/widgets/app_logo.dart';
import 'package:homebrands/widgets/heading.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProfilePage extends StatefulWidget {
  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  User user;
  
  @override
  Future<void> initState() async {
    // TODO: implement initState
    await getUserData();
    super.initState();
  }
  
  Future<void> getUserData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//    prefs.setString('userInfo', authResponse.user.toJson().toString());
    user = User.fromJson(sharedPreferences.getString("userInfo"));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: AppLogo(),
        centerTitle: true,
        backgroundColor: Colors.grey.shade50,
        leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: kMagenta,
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  //TODO: change hardcoded image
                  radius: ScreenUtil.getHeight(4),
                  backgroundImage: NetworkImage('https://media.istockphoto.com/photos/businessman-silhouette-as-avatar-or-default-profile-picture-picture-id476085198?k=6&m=476085198&s=612x612&w=0&h=5cDQxXHFzgyz8qYeBQu2gCZq1_TN0z40e_8ayzne0X0='),
                ),
                Text(
                  user.fullName,
                  style: TextStyle(
                    fontSize: ScreenUtil.getTextSize(11),
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  '@${user.username}',
                  style: TextStyle(
                    fontSize: ScreenUtil.getTextSize(9),
                    color: kGrey
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: ScreenUtil.getHeight(1),
                ),
                GestureDetector(
                  onTap: (){
                    //TODO: add functionality
                    Navigator.pushNamed(context, Routes.BUSINESS_REGISTRATION);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        FontAwesomeIcons.plusCircle,
                        size: ScreenUtil.getHeight(1.5),
                        color: kMagenta,
                      ),
                      SizedBox(
                        width: ScreenUtil.getWidth(1),
                      ),
                      Text(
                        'Add Business'
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: ScreenUtil.getHeight(2),
                ),
                Heading.buildTitle('Details'),
                Container(
                  width: ScreenUtil.getWidth(70),
                  child: Column(
                    children: <Widget>[
                      UserDetailRow(
                        text: user.email,
                        iconData: FontAwesomeIcons.solidEnvelope,
                      ),
                      UserDetailRow(
                        text: '${user.birthDay.year} - ${user.birthDay.month} - ${user.birthDay.day}',
                        iconData: FontAwesomeIcons.gifts,
                      ),
                      UserDetailRow(
                        text: user.phone,
                        iconData: FontAwesomeIcons.phone,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: ScreenUtil.getHeight(2),
                ),
                Heading.buildTitle('Recent Purchases'),
                _buildRecentlyPurchased()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserDetailRow extends StatelessWidget {
 
  final IconData iconData;
  final String text;
  
  const UserDetailRow({this.iconData, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: <Widget>[
            Icon(
              iconData,
              size: 20,
            ),
            SizedBox(
              width: ScreenUtil.getWidth(3),
            ),
            Text(
              text
            )
          ],
        ),
      ),
    );
  }
}


//method used to render the recently purchased products into the topmost carousel
Widget _buildRecentlyPurchased() {

  var items = _allProducts.toList().map((i) {
    return Builder(builder: (BuildContext context) {
      return _buildRecentlyPurchasedItem(i);
    });
  }).toList();

  return CarouselSlider(
    items: items,
    height: ScreenUtil.getHeight(30),
    aspectRatio: 16 / 9,
    viewportFraction: 0.5,
    initialPage: 0,
    enableInfiniteScroll: true,
    reverse: false,
    autoPlay: true,
    autoPlayInterval: Duration(seconds: 3),
    autoPlayAnimationDuration: Duration(milliseconds: 800),
    pauseAutoPlayOnTouch: Duration(seconds: 10),
//    enlargeCenterPage: true,
    scrollDirection: Axis.horizontal,
  );
}
Widget _buildRecentlyPurchasedItem(Product product) {
  return Container(
    height: ScreenUtil.getHeight(25),
    width: ScreenUtil.getWidth(35),
    child: Column(
      children: <Widget>[
        Container(
          height: ScreenUtil.getHeight(22),
          width: ScreenUtil.getWidth(35),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: ScreenUtil.getBorderRadiusCircular(10),
          ),
          child: Container(
            height: double.maxFinite,
            width: double.maxFinite,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                image: DecorationImage(image: NetworkImage(product.thumbnail,), fit: BoxFit.cover)
            ),
          ),
        ),
        SizedBox(
        height: ScreenUtil.getHeight(1),
        ),
        Text(product.name)
      ],
    ),
  );
}






var user = User(
  id: 'u32342',
  email: 'dilshan99@gmail.com',
  phone: '0771234567',
  fullName: 'Dilshan Manantunge',
  username: 'dilshan99',
  gender: 'Male',
  birthDay: DateTime(1999,03,03)
  //TODO: add user profile
);


List<Product> _allProducts = [
  Product(
      price: Price(currency: 'LKR', amount: 400),
      name: 'Cashew nuts',
      thumbnail: 'https://5.imimg.com/data5/BR/YS/MY-7452716/natural-cashew-nuts-500x500.jpg',
      id: 'K1234567'
  ),
  Product(
      price: Price(currency: 'LKR', amount: 600),
      name: 'Pistachio nuts',
      thumbnail: 'https://ed910ae2d60f0d25bcb8-80550f96b5feb12604f4f720bfefb46d.ssl.cf1.rackcdn.com/271d658aad1fe459-j240Ap95-large.jpg',
      id: 'K1234567'
  ),
  Product(
      price: Price(currency: 'LKR', amount: 700),
      name: 'mixed nuts',
      thumbnail: 'https://superiornutchicago.com/wp-content/uploads/2015/06/301.jpg',
      id: 'K1234567'
  ),
  Product(
      price: Price(currency: 'LKR', amount: 800),
      name: 'Spicy cashew nuts',
      thumbnail: 'https://5.imimg.com/data5/BR/YS/MY-7452716/natural-cashew-nuts-500x500.jpg',
      id: 'K1234567'
  ),
  Product(
      price: Price(currency: 'LKR', amount: 900),
      name: 'macadamie nuts',
      thumbnail: 'https://perfectketo.com/wp-content/uploads/2018/10/bigstock-Plate-With-Organic-Macadamia-N-270297172-1024x683.jpg',
      id: 'K1234567'
  ),

];
