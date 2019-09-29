import 'package:flutter/material.dart';

import 'package:homebrands/constants.dart';

import '../model/product.dart';
import '../utils/screen_util.dart';

class FavouritesPage extends StatefulWidget {
  @override
  _FavouritesPageState createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: _allProducts.length,
          itemBuilder: (BuildContext context, int index){
            return _buildFavouritesItem(index, _allProducts);
          },
        ),
      ),
    );
  }

  Widget _buildFavouritesItem(int index, List<Product> productsList) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                width: double.maxFinite,
                height: ScreenUtil.getHeight(10),
                child: Image.network(_allProducts[index].thumbnail, fit: BoxFit.cover,),
              ),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          _allProducts[index].name,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: ScreenUtil.getTextSize(12)
                          ),
                        ),
                        Text(
                          _allProducts[index].business,
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: ScreenUtil.getTextSize(9),
                            color: kGrey
                          ),
                        ),
                        Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  _allProducts[index].price.currency,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w100,
                                    fontSize: ScreenUtil.getTextSize(10),
                                    color: kMagenta
                                  ),
                                ),
                                SizedBox(width: ScreenUtil.getWidth(1),),
                                Text(
                                  _allProducts[index].price.amount.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: ScreenUtil.getTextSize(10),
                                    color: kMagenta
                                  ),
                                ),
                              ],
                            )
                        )
                      ],
                    ),
                    Icon(
                        Icons.bookmark
                    )
                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}

List<Product> _allProducts = [
  Product(
      price: Price(currency: 'LKR', amount: 400),
      name: 'Cashew nuts',
      thumbnail: 'https://5.imimg.com/data5/BR/YS/MY-7452716/natural-cashew-nuts-500x500.jpg',
      id: 'K1234567',
      business: 'ABC Shop'
  ),
  Product(
      price: Price(currency: 'LKR', amount: 400),
      name: 'Classic Brownies',
      thumbnail:
      'https://www.averiecooks.com/wp-content/uploads/2019/04/boyfriendbrownies-6.jpg',
      id: 'K0000034',
    business: 'Yeis Brownies'
  ),
  Product(
      price: Price(currency: 'LKR', amount: 700),
      name: 'M&M Brownies',
      thumbnail:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSxbOHpfPNsXAxOvXzq8dHH0vdgakrftxxL6byfVMLtGLVQTZFRmA',
      id: 'K1234567',
      business: 'Yeis Brownies'
  ),
  Product(
      price: Price(currency: 'LKR', amount: 400),
      name: 'Sweet String',
      thumbnail:
      'https://video-images.vice.com/_uncategorized/1497301097709-DSC_0979.jpeg',
      id: 'K0000034',
      business: 'Gugsis Sweets'
  ),
  Product(
      price: Price(currency: 'LKR', amount: 700),
      name: 'M&M Brownies',
      thumbnail:'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRXbQsMMg5uTH4Ms4wuq6uYk2XTkv2AknrEFthfvzjCI3qMevMK',
      id: 'K1234567',
      business: 'Yeis Brownies'
  )

];