import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/products_list_model.dart';
import 'package:shop_app/models/statemangement/provider/category_items_provider.dart';
import 'package:shop_app/models/statemangement/provider/item_product_provider.dart';
import 'package:shop_app/services/top_menu_categories_network_helper/dart/item_route_network_helper.dart';
import 'package:shop_app/services/top_menu_categories_network_helper/dart/network_helper_models/home_page_network_helper_model.dart';
import 'package:shop_app/utils/parsing_html_helper_tool.dart';
import 'package:shop_app/widgets/widgets.dart';
import 'package:shop_app/enums/enums_collection.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import '../route_generator.dart';

class BgItemsOccasion extends StatelessWidget {
  final String imageUrlBackground;
  final String topTag;
  final String topLabel;
  final String labelDesc;
  //List Of Products
  final List<Product> items;

  const BgItemsOccasion(
      {required this.imageUrlBackground,
      required this.topTag,
      required this.topLabel,
      required this.labelDesc,
      required this.items});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 270,
          width: double.infinity,
          child: BgItemImage(
            imageUrl: imageUrlBackground,
          ),
        ),
        Positioned.fill(
          top: 10.0,
          child: Align(
            alignment: Alignment.topCenter,
            child: Opacity(
              opacity: 0.9,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 550,
                margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                padding: const EdgeInsets.all(15.0),
                decoration: const BoxDecoration(
                  color: Color(0xff73201C),
                  boxShadow: <BoxShadow>[
                    BoxShadow(color: Colors.white, blurRadius: 20.0)
                  ],
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                ),
                child: Container(
                  height: 240,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        topTag,
                        style: const TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        ParsingHtmlHelperTool.parseHtmlString(topLabel),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22.0,
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Flexible(
                        child: Container(
                          width: 200,
                          child: Text(
                            labelDesc,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 50.0,
          left: 0,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width:!kIsWeb? 500:MediaQuery.of(context).size.width,
              height: 150,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: items
                      .map(
                        (e) => Row(
                          children: <Widget>[
                            GestureDetector(
                              onTap: () async {
                                var itemProductModel =
                                    await ItemRouteNetworkHelper
                                        .getItemProductModel(
                                        e.productId);
                                // Adding Item Product Model
                                Provider.of<ItemProductProvider>(context,
                                        listen: false)
                                    .addItemProductModel(itemProductModel);
                                Navigator.of(context)
                                    .pushNamed(RouteGenerator.itemRoute);
                              },
                              child: MainHomeItemContainer(
                                product: e,
                                productID: e.productId,
                                imageUrl: e.mediaName,
                              ),
                            ),
                            SizedBox(
                              width: 7,
                            ),
                          ],
                        ),
                      )
                      .toList(),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 16.0,
          left: 60.0,
          child: Center(
            child: BlackSeeMoreBtn(
              onTap: () {
                Provider.of<CategoryItemsProvider>(context, listen: false)
                    .mappingProducts
                    .clear();

                Provider.of<CategoryItemsProvider>(context, listen: false)
                    .addCategoryItemsProvider(items, topLabel);

                Navigator.of(context)
                    .pushNamed(RouteGenerator.categoryItemsSubs);
              },
            ),
          ),
        ),
      ],
    );
  }
}
