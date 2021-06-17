import 'package:flutter/material.dart';
class CheckOutRoute extends StatelessWidget {
final String appBarTitle;
const CheckOutRoute({required this.appBarTitle});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        centerTitle: false,
      ),
      body: ListView(
        children: <Widget>[

        ],
      ),
    );
  }
}
