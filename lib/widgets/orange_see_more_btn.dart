import 'package:flutter/material.dart';
class OrangeSeeMoreBtn extends StatelessWidget {
  final Function onTap;

  const OrangeSeeMoreBtn({Key? key,required this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return   FlatButton(
      onPressed: (){
        onTap();
      },
      child: Text(
        "See more",
        style: const TextStyle(
          color: Color(0xffF66401),
        ),
      ),
    );
  }
}
