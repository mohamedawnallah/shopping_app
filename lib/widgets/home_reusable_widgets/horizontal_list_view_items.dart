import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/route_generator.dart';
import 'package:shop_app/routes/home_routes/category_items_route.dart';
import 'package:shop_app/services/all_services.dart';
import 'package:shop_app/services/network_helpers_request/item_route_network_helper.dart';
import 'package:shop_app/view_models/provider/all_providers.dart';
import 'package:shop_app/widgets/home_reusable_widgets/main_home_item_container.dart';
import 'package:shop_app/widgets/home_reusable_widgets/orange_see_more_btn.dart';

class HorizontalListViewItems extends StatelessWidget {
  final String topLabel;
  final String labelDesc;
  final List<Product> items;

  HorizontalListViewItems({
    required this.topLabel,
    required this.labelDesc,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.fromLTRB(10.0, 35.0, 0, 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                topLabel,
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: GoogleFonts.almendra().fontFamily,
                  fontSize: !kIsWeb ? 20.0 : 30,
                ),
              ),
              if (labelDesc.isEmpty)
                OrangeSeeMoreBtn(
                  onTap: () {
                    //TODO Navigation TO More Items By
                    Provider.of<CategoryItemsProvider>(context, listen: false)
                        .mappingProducts
                        .clear();
                    Provider.of<CategoryItemsProvider>(context, listen: false)
                        .addCategoryItemsProvider(items, topLabel);
                    Navigator.of(context)
                        .pushNamed(RouteGenerator.categoryItemsSubs);
                  },
                ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              if (labelDesc.isNotEmpty)
                Text(
                  labelDesc,
                  style: GoogleFonts.almendra().copyWith(
                      color: Colors.black26, fontSize: !kIsWeb ? 15.0 : 20),
                ),
              if (labelDesc.isNotEmpty)
                OrangeSeeMoreBtn(
                  onTap: () {
                    //TODO Navigation TO More Items By
                    Provider.of<CategoryItemsProvider>(context, listen: false)
                        .mappingProducts
                        .clear();
                    Provider.of<CategoryItemsProvider>(context, listen: false)
                        .addCategoryItemsProvider(items, topLabel);
                    Navigator.of(context)
                        .pushNamed(RouteGenerator.categoryItemsSubs);
                  },
                ),
            ],
          ),
          Container(
            height: !kIsWeb ? 200 : 300,
            margin: !kIsWeb
                ? EdgeInsets.only(left: 10, right: 10)
                : EdgeInsets.only(left: 20, right: 30),
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(5.0),
              children: <Widget>[
                ...items.map((e) {
                  return GestureDetector(
                    onTap: () async {
                      var itemProductModel =
                          await ItemRouteNetworkHelper.getItemProductModel(
                              e.productId);
                      // Adding Item Product Model
                      Provider.of<ItemProductProvider>(context, listen: false)
                          .addItemProductModel(itemProductModel);
                      Navigator.of(context).pushNamed(RouteGenerator.itemRoute);
                    },
                    child: MainHomeItemContainer(
                      product: e,
                      productID: e.productId,
                      imageUrl: e.mediaName,
                    ),
                  );
                }).toList(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
