import 'package:flutter/material.dart';
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
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            WidgetSpan(
              child: Icon(
                Icons.arrow_right_alt,
                color: Colors.white,
                size: 29,
              ),
            )
          ],
        ),
      ),
    );
  }
}
