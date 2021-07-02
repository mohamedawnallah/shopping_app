import 'package:flutter/material.dart';
import 'package:shop_app/widgets/user_profile_reusable_widgets/defaultAppBar.dart';
import 'package:shop_app/widgets/user_profile_reusable_widgets/defaultBackButton.dart';


class About extends StatefulWidget {
const About();
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DefaultAppBar(
        title: 'About Application',
        child: DefaultBackButton(),
      ),
      body: Center(
        child: Text("This is Alex Shopping App for Hand-Made Items",style: const TextStyle(fontSize: 25),textAlign: TextAlign.center,),
      )
    );
  }
}
