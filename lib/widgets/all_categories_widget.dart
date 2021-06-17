import 'package:flutter/material.dart';

class AllCategoriesWidget extends StatelessWidget {
  final String imageUrl;
  final String categoryName;
  const AllCategoriesWidget({required this.imageUrl,required this.categoryName});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              boxShadow: <BoxShadow>[
                BoxShadow(color: Colors.grey, blurRadius: 2),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned.fill(
            child: Align(
              alignment: Alignment.center,
              child: Opacity(
                opacity: 0.7,
                child: Container(
margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    categoryName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
