//import 'package:flutter/material.dart';
//
//
//class PendingOrders extends StatefulWidget {
//
//  static String routeID = 'pending_orders_screen';
//  @override
//  _PendingOrdersState createState() => _PendingOrdersState();
//}
//
//class _PendingOrdersState extends State<PendingOrders> {
//
//  List<Widget> getPendingOrders(){
//    List<Widget> itemsForSaleList = [];
//    for (int x = 0; x < productItemNames.length; x++){
//      itemsForSaleList.add(
//          Card(
//            clipBehavior: Clip.antiAlias,
//            child: Container(
//              child: Row(
//                children: <Widget>[
//                  Expanded(
//                    flex: 3,
//                    child: Container(
//                      height: 200,
//                      child: Image.asset(
//                        pendingOrderImagePath[x],
//                        fit: BoxFit.cover,
//                      ),
//                    ),
//                  ),
//                  Expanded(
//                    flex: 4,
//                    child: Padding(
//                      padding: const EdgeInsets.all(8.0),
//                      child: Column(
//                        mainAxisAlignment: MainAxisAlignment.start,
//                        crossAxisAlignment: CrossAxisAlignment.start,
//                        children: <Widget>[
//                          Text(
//                            pendingOrderBuyerName[x],
//                            style: TextStyle(
//                              fontWeight: FontWeight.w600,
//                              fontSize: 18
//                            ),
//                          ),
//                          SizedBox(
//                            height: 5,
//                          ),
//                          Text(
//                            pendingOrderBuyerContact[x].toString(),
//                            style: TextStyle(
//                              fontSize: 15,
//                              color: kAshAccent.withOpacity(0.5)
//                            ),
//                          ),
//                          SizedBox(
//                            height: 5,
//                          ),
//                          Text(
//                            pendingOrderBuyerAddress[x],
//                            style: TextStyle(
//                              fontSize: 10,
//                                color: kAshAccent.withOpacity(0.5)
//                            ),
//                          ),
//                          SizedBox(
//                            height: 5,
//                          ),
//                          Text(
//                            'Delivery Date : ${pendingOrderDueDate[x]}',
//                            style: TextStyle(
//                              fontSize: 15,
//                              color: kMagenta,
//                              fontWeight: FontWeight.w600
//                            ),
//                          ),
//                        ],
//                      ),
//                    ),
//                  )
//                ],
//              ),
//            )
//          )
//      );
//    }
//    return itemsForSaleList;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      backgroundColor: kWhite,
//      body: SafeArea(
//        child: SingleChildScrollView(
//          child: Column(
//            children: <Widget>[
//              ReusableHeading(
//                headingText: 'Pending Orders',
//                textColor: kAsh,
//                iconColor: kMagenta,
//              ),
//              Padding(
//                padding: const EdgeInsets.all(8.0),
//                child: Column(
//                  children: getPendingOrders(),
//                ),
//              ),
//            ],
//          ),
//        ),
//      ),
//    );
//  }
//}
//
//List<String> pendingOrderImagePath = [
//  'assets/images/products/browniePlatter.jpg',
//  'assets/images/products/brownieSundae.jpg',
//  'assets/images/products/butterBrownies.jpeg',
//  'assets/images/products/classicBrownie.png',
//  'assets/images/products/creamyBrownie.jpg',
//  'assets/images/products/hazelnutBrownie.jpg',
//  'assets/images/products/oreoBrownie.jpg'
//];
//
//List<String> pendingOrderBuyerAddress = [
//  '83/36, divers St, Dehiwala, Colombo',
//  '83/36, divers St, Dehiwala, Colombo',
//  '83/36, divers St, Dehiwala, Colombo',
//  '83/36, divers St, Dehiwala, Colombo',
//  '83/36, divers St, Dehiwala, Colombo',
//  '83/36, divers St, Dehiwala, Colombo',
//  '83/36, divers St, Dehiwala, Colombo'
//];
//
//List<String> pendingOrderBuyerName = [
//  'Akassharjun Shanmugarajah',
//  'Dinuka Piyadigama',
//  'Akassharjun Shanmugarajah',
//  'Dinuka Piyadigama',
//  'Akassharjun Shanmugarajah',
//  'Dinuka Piyadigama',
//  'Dinuka Piyadigama',
//];
//
//List<int> pendingOrderBuyerContact = [
//  07701234567,
//  07770123456,
//  08134343434,
//  07701234567,
//  07770123456,
//  08134343434,
//  08134343434,
//];
//
//List<String> pendingOrderDueDate = [
//  '31/12/2019',
//  '12/12/2019',
//  '14/10/2019',
//  '06/11/2019',
//  '15/12/2019',
//  '28/09/2019',
//  '20/05/2020'
//];