import 'package:flutter/material.dart';

import 'package:smooth_star_rating/smooth_star_rating.dart';

import '../constants.dart';

class FeedbackScreen extends StatelessWidget {

  static String routeID = 'feedback_screen';

  List<Widget> displayFeedback(){
    List<Widget> feedbackList = [];
    for (int x = 0; x < feedbackCustomerName.length; x++){
      feedbackList.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  width: double.maxFinite,
                  height: 10,
                  child: Divider(
                    color: kAshAccent,
                  ),
                ),
                Text(
                  feedbackCustomerName[x],
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600
                  ),
                ),
                SizedBox(height: 5,),
                Text(
                  feedback[x],
                  style: TextStyle(
                    color: kAshAccent.withOpacity(0.5),
                    fontSize: 15
                  ),
                ),
                SmoothStarRating(
                  starCount: 5,
                  size: 20,
                  color: Colors.amber,
                  borderColor: Colors.amber,
                  rating: feedbackRating[x],
                )
              ],
            ),
          ),
        ),
      );
    }
    return feedbackList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: displayFeedback(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}


List<String> feedbackCustomerName = [
  'John Ray',
  'Sophia Ramsay',
  'Jonathan Morris',
];

List<String> feedback = [
  'Love this place hope they make more products and a greater variety, but you get the idea',
  'Love this place hope they make more products and a greater variety, but you get the idea',
  'Love this place hope they make more products and a greater variety, but you get the idea',
];

List<double> feedbackRating = [
  3,
  4,
  5
];