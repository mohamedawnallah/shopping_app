import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart'show kIsWeb;
import 'package:equatable/equatable.dart';
import 'package:shop_app/config/palette.dart';
import 'package:shop_app/constants/constants.dart';
import 'package:shop_app/models/shop_item.dart';
import 'package:shop_app/models/statemangement/provider/category_items_provider.dart';
import 'package:shop_app/models/statemangement/provider/item_product_provider.dart';
import 'package:shop_app/services/top_menu_categories_network_helper/dart/item_route_network_helper.dart';
import 'package:shop_app/services/top_menu_categories_network_helper/dart/network_helper_models/home_page_network_helper_model.dart';
import 'package:shop_app/services/top_menu_categories_network_helper/dart/network_helper_models/item_route_network_helper_model.dart';
import 'package:shop_app/utils/parsing_html_helper_tool.dart';

import '../route_generator.dart';

class CategoryItemsRoute extends StatefulWidget {
  final String? appBarTitle;

  const CategoryItemsRoute({this.appBarTitle});

  @override
  _CategoryItemsRouteState createState() => _CategoryItemsRouteState();
}

class _CategoryItemsRouteState extends State<CategoryItemsRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.categoryItemsBackground,
      appBar: AppBar(
        elevation: 10,
        title: Text(
          ParsingHtmlHelperTool.parseHtmlString(Provider.of<CategoryItemsProvider>(context, listen: false)
              .mappingProducts['topLabel']),
        ),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.share),
            color: Colors.black,
            onPressed: () {
              print("Share Button Is Clicked");
            },
          ),
        ],
      ),
      body: Consumer<CategoryItemsProvider>(
        builder: (_, items, __) {

          return Container(
            child: GridView.builder(
                itemCount: items.mappingProducts['products'].length,
                padding: const EdgeInsets.all(10),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 0.65),
                itemBuilder: (context, index) {

                  double difference = double.parse(
                          items.mappingProducts['products'][index].oriprice) -
                      double.parse(items
                          .mappingProducts['products'][index].discountprice);
                  print(index);
                  return GestureDetector(
                    onTap: () async {
                      // Getting Item Product Model
                      var itemProductModel =
                          await ItemRouteNetworkHelper.getItemProductModel(items.mappingProducts['products'][index].productId);
                     // Adding Item Product Model
                      Provider.of<ItemProductProvider>(context,listen: false)
                          .addItemProductModel(itemProductModel);

                      Navigator.of(context).pushNamed(RouteGenerator.itemRoute);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      child: Column(

                        children: <Widget>[
                          Expanded(
                            flex:!kIsWeb? 1:3,
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
                                        image: Image.network(!items
                                                    .mappingProducts['products']
                                                        [index]
                                                    .mediaName
                                                    .contains("http")
                                                ? "https://images.unsplash.com/photo-1558769132-cb1aea458c5e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=967&q=80"
                                            : items
                                                    .mappingProducts['products']
                                                        [index]
                                                    .mediaName)
                                            .image,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned.fill(
                                    child: Align(
                                      alignment: Alignment.topRight,
                                      child:items.favoriteProducts.contains(
                                          items.mappingProducts['products'][index]
                                      )? IconButton(
                                              onPressed: () {
                                                //Add TO Favorites
                                                items
                                                    .removeProductFromFavorites(
                                                        items.mappingProducts[
                                                            'products'][index]);
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
                                                    items.mappingProducts[
                                                        'products'][index]);
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
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: SingleChildScrollView(
                              child: Container(
                                height: 350,
                                child: Padding(
                                  padding: const EdgeInsets.all(6.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: <Widget>[
                                      const SizedBox(
                                        height: 10.0,
                                      ),
                                      Flexible(
                                        child: Text(
                                          //It should Be Title of The Product
                                          "Title",
                                          overflow: TextOverflow.ellipsis,
                                          style: const TextStyle(
                                            fontSize:!kIsWeb?20:35,

                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height:  !kIsWeb?10:20,
                                      ),
                                      Text(
                                        "Subtitle",
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          fontSize:!kIsWeb?20:35,

                                        ),
                                      ),
                                     const SizedBox(
                                        height:  !kIsWeb?10:20,
                                      ),
                                      if (Discountindicator.YES ==
                                          items.mappingProducts['products'][index]
                                              .discountindicator)
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text.rich(
                                              TextSpan(
                                                children: <InlineSpan>[
                                                  TextSpan(
                                                    text:
                                                        "\$${items.mappingProducts['products'][index].oriprice} ",
                                                    style: const TextStyle(
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      color: Color(0xFF247E34),
                                                      fontSize: !kIsWeb?20:35,
                                                    ),
                                                  ),
                                                  TextSpan(
                                                    text:
                                                        "(${((difference / double.parse(items.mappingProducts['products'][index].oriprice)) * 100).toStringAsFixed(2)}% off)",
                                                    style: const TextStyle(
                                                      color: Color(0xFF247E34),
                                                      fontSize: !kIsWeb?20:35,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              height:  !kIsWeb?10:30,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceBetween,
                                              children: <Widget>[
                                                Text(
                                                  '\$${items.mappingProducts['products'][index].discountprice}',
                                                  style: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    fontSize:  !kIsWeb?15:30,
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
                                      if (Discountindicator.NO ==
                                          items.mappingProducts['products'][index]
                                              .discountindicator)
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Text(
                                              "No sale",
                                              style: const TextStyle(
                                                  color: Colors.grey,
                                                  fontSize:  !kIsWeb?15:30,
                                              ),
                                            ),
                                           const SizedBox(
                                              height:  !kIsWeb?0:20,
                                            ),
                                            Text(
                                              '\$${items.mappingProducts['products'][index].oriprice}',
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
                            ),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          );
        },
      ),
    );
  }
}
