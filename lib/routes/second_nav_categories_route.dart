import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/config/palette.dart';
import 'package:shop_app/constants/constants.dart';
import 'package:shop_app/models/category_parent_by_id.dart';
import 'package:shop_app/models/statemangement/provider/category_items_provider.dart';
import 'package:shop_app/models/statemangement/provider/item_product_provider.dart';
import 'package:shop_app/models/statemangement/provider/product_categrory_list_provider.dart';
import 'package:shop_app/services/top_menu_categories_network_helper/dart/item_route_network_helper.dart';
import 'package:shop_app/services/top_menu_categories_network_helper/dart/network_helper_models/top_category_network_helper_model.dart';
import 'package:shop_app/models/statemangement/provider/top_menu_category_provider.dart';
import 'package:shop_app/services/top_menu_categories_network_helper/dart/top_menu_categories_network_helper.dart';
import 'package:shop_app/utils/parsing_html_helper_tool.dart';
import 'package:shop_app/widgets/widgets.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../route_generator.dart';

class SecondNavCategoriesRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.categoryItemsBackground,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        title: Provider.of<ProductCategoryListProvider>(context)
                    .productsSubCategoriesOneRelevance
                    .topCategoryName
                    .length !=
                0
            ? Text(ParsingHtmlHelperTool.parseHtmlString(
                Provider.of<ProductCategoryListProvider>(context)
                    .productsSubCategoriesOneRelevance
                    .topCategoryName))
            : Text("There's no subcategory"),
        centerTitle: true,
      ),
      endDrawer: AppDrawer(
        productCategoryListProvider:
            Provider.of<ProductCategoryListProvider>(context, listen: true),
      ),
      body: Consumer<CategoryItemsProvider>(builder: (context, items, child) {
        return Consumer<ProductCategoryListProvider>(
            builder: (context, productCategoryListProvider, child) {
          return GridView.builder(
              itemCount: productCategoryListProvider
                  .productsSubCategoriesOneRelevance.productCategoryList.length,
              padding: const EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, childAspectRatio: 0.65),
              itemBuilder: (context, index) {
                double difference = double.parse(productCategoryListProvider
                        .productsSubCategoriesOneRelevance
                        .productCategoryList[index]
                        .price) -
                    double.parse(productCategoryListProvider
                        .productsSubCategoriesOneRelevance
                        .productCategoryList[index]
                        .discountedPrice);
                print(index);
                return GestureDetector(
                  onTap: () async {
                    // Getting Item Product Model
                    var itemProductModel =
                        await ItemRouteNetworkHelper.getItemProductModel(
                      productCategoryListProvider
                          .productsSubCategoriesOneRelevance
                          .productCategoryList[index]
                          .productId,
                    );
                    // Adding Item Product Model
                    Provider.of<ItemProductProvider>(context, listen: false)
                        .addItemProductModel(
                      itemProductModel,
                    );

                    Navigator.of(context).pushNamed(RouteGenerator.itemRoute);
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: !kIsWeb ? 1 : 3,
                          child: Material(
                            elevation: 10,
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    boxShadow: <BoxShadow>[
                                      BoxShadow(
                                          color: Colors.grey, blurRadius: 7),
                                    ],
                                    image: DecorationImage(
                                      image: Image.network(
                                        productCategoryListProvider
                                            .productsSubCategoriesOneRelevance
                                            .productCategoryList[index]
                                            .mediaName,
                                      ).image,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned.fill(
                                  child: Align(
                                    alignment: Alignment.topRight,
                                    child: items
                                            .productCategoryNetworkModelFavorites
                                            .contains(productCategoryListProvider
                                                .productsSubCategoriesOneRelevance
                                                .productCategoryList[index])
                                        ? IconButton(
                                            onPressed: () {
                                              //Add TO Favorites
                                              items.removeProductFromProductCategoryListFavorites(
                                                  productCategoryListProvider
                                                      .productsSubCategoriesOneRelevance
                                                      .productCategoryList[index]);

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
                                              items.addProductToProductCategoryListFavorites(
                                                  productCategoryListProvider
                                                      .productsSubCategoriesOneRelevance
                                                      .productCategoryList[index]);

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
                                  // child: Align(
                                  //   alignment: Alignment.topRight,
                                  //   child: items.favoriteProducts.contains(
                                  //       items.mappingProducts['products']
                                  //       [index])
                                  //       ? IconButton(
                                  //     onPressed: () {
                                  //       //Add TO Favorites
                                  //       items
                                  //           .removeProductFromFavorites(
                                  //           items.mappingProducts[
                                  //           'products'][index]);
                                  //
                                  //       print(
                                  //           "Product is Removed From Favorites ");
                                  //     },
                                  //     icon: Icon(
                                  //       Icons.favorite,
                                  //       color: Colors.red,
                                  //       size: 30.0,
                                  //     ),
                                  //   )
                                  //       : IconButton(
                                  //     onPressed: () {
                                  //       //Add TO Favorites
                                  //       items.addProductToFavorites(
                                  //           items.mappingProducts[
                                  //           'products'][index]);
                                  //       print(
                                  //           "Product Added To Favorites");
                                  //     },
                                  //     icon: Icon(
                                  //       Icons.favorite_border,
                                  //       color: Colors.white,
                                  //       size: 30.0,
                                  //     ),
                                  //   ),
                                  // ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(6.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  const SizedBox(
                                    height: 10.0,
                                  ),
                                  Flexible(
                                    child: Text(
                                      //It should Be Title of The Product
                                      ParsingHtmlHelperTool.parseHtmlString(
                                          productCategoryListProvider
                                              .productsSubCategoriesOneRelevance
                                              .productCategoryList[0]
                                              .productName),
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        fontSize: !kIsWeb ? 20 : 35,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    ParsingHtmlHelperTool.parseHtmlString(
                                        productCategoryListProvider
                                            .productsSubCategoriesOneRelevance
                                            .productCategoryList[0]
                                            .sellerName),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  const SizedBox(
                                    height: !kIsWeb ? 10 : 20,
                                  ),
                                  if (!productCategoryListProvider
                                      .productsSubCategoriesOneRelevance
                                      .productCategoryList[index]
                                      .discountedPrice
                                      .contains("0.00"))
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text.rich(
                                          TextSpan(
                                            children: <InlineSpan>[
                                              TextSpan(
                                                text:
                                                    "\$${productCategoryListProvider.productsSubCategoriesOneRelevance.productCategoryList[index].price} ",
                                                style: const TextStyle(
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  color: Color(0xFF247E34),
                                                  fontSize: !kIsWeb ? 20 : 35,
                                                ),
                                              ),
                                              TextSpan(
                                                text:
                                                    "(${((difference / double.parse(productCategoryListProvider.productsSubCategoriesOneRelevance.productCategoryList[index].price)) * 100).toStringAsFixed(2)}% off)",
                                                style: const TextStyle(
                                                  color: Color(0xFF247E34),
                                                  fontSize: !kIsWeb ? 20 : 35,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(
                                          height: !kIsWeb ? 10 : 30,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              '\$${productCategoryListProvider.productsSubCategoriesOneRelevance.productCategoryList[index].discountedPrice}',
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: !kIsWeb ? 15 : 30,
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                print(
                                                    "More Vert Icon Is Tapped");
                                              },
                                              child: Icon(
                                                Icons.more_vert,
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  if (productCategoryListProvider
                                      .productsSubCategoriesOneRelevance
                                      .productCategoryList[index]
                                      .discountedPrice
                                      .contains("0.00"))
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "No sale",
                                          style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: !kIsWeb ? 15 : 30,
                                          ),
                                        ),
                                        const SizedBox(
                                          height: !kIsWeb ? 0 : 20,
                                        ),
                                        Text(
                                          '\$${productCategoryListProvider.productsSubCategoriesOneRelevance.productCategoryList[index].price}',
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize:  !kIsWeb?15:30,
                                          ),
                                        ),
                                      ],
                                    )
                                ],
                              ),
                            ),
                            color: Colors.white,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              });
        });
      }),
    );
  }
}
