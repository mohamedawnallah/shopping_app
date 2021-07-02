import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
        style:  TextStyle(
          color: Color(0xffF66401),
          fontFamily: GoogleFonts.almendra().fontFamily,
          fontSize: 20,
        ),
      ),
    );
  }
}
