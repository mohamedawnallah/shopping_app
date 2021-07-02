import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shop_app/config/palette.dart';
import 'package:shop_app/routes/home_routes/category_items_route.dart';
class InfoWidget extends StatelessWidget {
  const InfoWidget();
  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.all(15.0),
      alignment: Alignment.center,
      margin: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
        color: Palette.infoBackground,
      ),
      child: Row(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Palette.background,
            ),
            child: const Icon(
              Icons.favorite,
              size: 25.0,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                  Text(
                    "What's your style?",
                    style:  TextStyle(
                        color: Colors.black,

                        fontSize: !kIsWeb?18:32),
                  ),
                  Text(
                    "Favoriting helps Etsy provide unique recommendations, tailored just for you.Tap on some heart icons below so Etsy knows what you like.",
                    style:  TextStyle(
fontSize:   !kIsWeb?18:20
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
