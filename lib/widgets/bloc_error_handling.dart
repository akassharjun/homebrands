import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return              Container(child: Text("No Data"));
  }
}


class NetworkError extends StatelessWidget {
	final String occurrence;
	
	const NetworkError(this.occurrence);
	
	@override
	Widget build(BuildContext context) {
		return Container(child: Text("There was a network error! ($occurrence})"),);
	}
}


class BlocIssue extends StatelessWidget {
	final String blocName;
	
	const BlocIssue(this.blocName);
	
	@override
	Widget build(BuildContext context) {
		return Container(child: Text("There is an issue with this bloc. ($blocName})"),);
	}
}
