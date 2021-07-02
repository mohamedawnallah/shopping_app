import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:shop_app/routes/home_routes/category_items_route.dart';
class BlackSeeMoreBtn extends StatelessWidget {
  final Function onTap;
const  BlackSeeMoreBtn({required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        //When Tap On See More TODO It will navigate to Editor's Picks
        onTap();
      },
      child: Text.rich(
        TextSpan(
          children: <InlineSpan>[
            WidgetSpan(
              child: Text(
                "See more",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            WidgetSpan(
              child: Icon(
                Icons.arrow_right_alt,
                color: Colors.black,
                size:   !kIsWeb ?29:40,
              ),
            )
          ],
        ),
      ),
    );
  }
}
