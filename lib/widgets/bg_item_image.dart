import 'package:flutter/material.dart';
class BgItemImage extends StatelessWidget {
  final String imageUrl;
 const BgItemImage({required this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 240,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
        ),
        child: Image.network(
         imageUrl,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
