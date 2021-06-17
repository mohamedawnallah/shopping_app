import 'package:flutter/material.dart';
import 'package:shop_app/config/palette.dart';
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
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Text(
                    "Favoriting helps Etsy provide unique recommendations, tailored just for you.Tap on some heart icons below so Etsy knows what you like.",
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
