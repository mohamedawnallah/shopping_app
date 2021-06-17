import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/route_generator.dart';
import 'package:flutter/foundation.dart'show kIsWeb;
class AnimatedSplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<AnimatedSplashScreen>
    with SingleTickerProviderStateMixin {
  var _visible = true;

  late AnimationController animationController;
  late Animation<double> animation;

  startTime() async {
    var _duration = new Duration(seconds: 3);

    return new Timer(_duration, navigationPage);
  }

  void navigationPage() async {
    Navigator.of(context).pushNamed(RouteGenerator.itemsBottomNavigationBar);
  }

  @override
  void initState() {
    super.initState();
    animationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 3));
    animation =
        new CurvedAnimation(parent: animationController, curve: Curves.easeOut);

    animation.addListener(() => this.setState(() {}));
    animationController.forward();

    setState(() {
      _visible = !_visible;
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                  padding: EdgeInsets.only(bottom: 30.0),
                  child: new Image.asset(
                    'assets/images/powered_by.png',
                    height: 25.0,
                    fit: BoxFit.scaleDown,
                  ))
            ],
          ),
          Container(
            color: Colors.black87,
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Image.asset(
                  'assets/images/festival_splash_img.png',
                  width:!kIsWeb? animation.value * 250:animation.value * 400,
                  height:!kIsWeb?  animation.value * 250:animation.value * 400,
                ),
                Text(
                  "Shopping App",
                  style: const TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize:!kIsWeb? 25:30,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
