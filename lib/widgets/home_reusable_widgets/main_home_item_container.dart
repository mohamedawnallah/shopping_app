import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/routes/home_routes/category_items_route.dart';
import 'package:shop_app/services/all_services.dart';
import 'package:shop_app/view_models/provider/all_providers.dart';
//Image Container For Each Product
class MainHomeItemContainer extends StatelessWidget {
  final String imageUrl;
  final String productID;
final Product product;
  const MainHomeItemContainer({Key? key,required this.imageUrl,required this.productID,required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryItemsProvider>(
        builder: (_, items, __) {
          return
            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Stack(
                children: [
                  Container(
                    height:  !kIsWeb?200:270,
                    width: !kIsWeb?200:270,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: Image
                              .network(
                              imageUrl)
                              .image,
                          fit: BoxFit.cover),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.topRight,
                      child: items.favoriteProducts.contains(
                          product
                      ) ? IconButton(
                        onPressed: () {
                          //Add TO Favorites
                          items
                              .removeProductFromFavorites(
                              product);
                          print(
                              "Product is Removed From Favorites ");
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 30.0,
                        ),
                      )
                          : IconButton(
                        onPressed: () {
                          //Add TO Favorites
                          items.addProductToFavorites(
                              product);

                        },
                        icon: Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                          size: 30.0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
        }
    );
  }
}
