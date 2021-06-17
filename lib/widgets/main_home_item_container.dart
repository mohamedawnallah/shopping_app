import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/statemangement/provider/category_items_provider.dart';
import 'package:shop_app/services/top_menu_categories_network_helper/dart/network_helper_models/home_page_network_helper_model.dart';
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
                    height: 200,
                    width: 200,
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
                          print(
                              "Product Added To Favorites");
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
