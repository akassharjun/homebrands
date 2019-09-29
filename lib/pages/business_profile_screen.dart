import 'package:flutter/material.dart';
import 'package:homebrands/widgets/app_logo.dart';

import '../constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class BusinessProfile extends StatefulWidget {

  @override
  _BusinessProfileState createState() => _BusinessProfileState();
}

class _BusinessProfileState extends State<BusinessProfile> {

  int numberOfOrders = 32;
  String dateTime = '2018/03/23';

  int revenue = 3000;
  int expenditure = 500;
  int monthlyTarget = 10000;
  int views = 13;
  int adReach = 43;
  int categoryRank = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
      elevation: 0,
      title: AppLogo(),
      centerTitle: true,
      backgroundColor: Colors.grey.shade50,
      leading: GestureDetector(
        onTap: (){
          Navigator.pushNamed(context, Routes.HOME);
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
              children: <Widget>[
                Text(
                  numberOfOrders.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 70,
                    fontWeight: FontWeight.w900
                  ),
                ),
                Text(
                  'ORDERS',
                  style: TextStyle(
                      color: kAshAccent.withOpacity(0.3),
                      fontSize: 30,
                      fontWeight: FontWeight.w400
                  ),
                ),
                Text(
                  'SINCE $dateTime',
                  style: TextStyle(
                      color: kAsh,
                      fontSize: 15,
                      fontWeight: FontWeight.w400
                  ),
                ),
                SizedBox(
                  height: 30,
                  width: 200,
                  child: Divider(
                    color: kAsh,
                  ),
                ),
                MaroonTextWidget(text: 'Total Revenue',),
                WhiteTextWidget(text: 'LKR $revenue',),
                MaroonTextWidget(text: 'Total Expenditure',),
                WhiteTextWidget(text: 'LKR $expenditure',),
                MaroonTextWidget(text: 'Monthly Target',),
                WhiteTextWidget(text: 'LKR $monthlyTarget',),
                MaroonTextWidget(text: 'Number of Views',),
                WhiteTextWidget(text: views.toString(),),
                MaroonTextWidget(text: 'Ad Reach',),
                WhiteTextWidget(text: adReach.toString(),),
                MaroonTextWidget(text: 'Category position',),
                WhiteTextWidget(text: categoryRank.toString(),),

                SizedBox(
                  height: 20,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    ClickableIcon(
                      iconData: FontAwesomeIcons.solidThumbsUp,
                      iconLabel: 'Reviews',
                      onTap: (){
//                        Navigator.pushNamed(context, FeedbackScreen.routeID);
                      },
                    ),
                    ClickableIcon(
                      iconData: FontAwesomeIcons.bookOpen,
                      iconLabel: 'Menu',
                      onTap: (){
//                        Navigator.pushNamed(context, SellingItems.routeID);
                      },
                    ),
                    ClickableIcon(
                      iconData: FontAwesomeIcons.thList,
                      iconLabel: 'Orders',
                      onTap: (){
//                        Navigator.pushNamed(context, PendingOrders.routeID);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ClickableIcon extends StatelessWidget {

  final IconData iconData;
  final Function onTap;
  final String iconLabel;

  const ClickableIcon({this.iconData, this.onTap, this.iconLabel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: <Widget>[
          Icon(
            iconData,
            size: 30,
            color: kAsh,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              iconLabel
            ),
          )
        ],
      ),
    );
  }
}

class MaroonTextWidget extends StatelessWidget {

  final String text;

  MaroonTextWidget({this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        text,
        style: TextStyle(
          color: kAsh,
          fontSize: 15,
        ),
      ),
    );
  }
}

class WhiteTextWidget extends StatelessWidget {

  final String text;

  WhiteTextWidget({this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        text,
        style: TextStyle(
          color: kAshAccent.withOpacity(0.3),
          fontSize: 15,
          fontWeight: FontWeight.w600
        ),
      ),
    );
  }
}


