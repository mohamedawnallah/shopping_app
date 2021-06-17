import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/enums/categories.dart';
import 'package:shop_app/models/statemangement/provider/category_items_provider.dart';
import 'package:shop_app/models/statemangement/provider/item_product_provider.dart';
import 'package:shop_app/route_generator.dart';
import 'package:shop_app/services/top_menu_categories_network_helper/dart/item_route_network_helper.dart';
import 'package:shop_app/services/top_menu_categories_network_helper/dart/network_helper_models/home_page_network_helper_model.dart';
import 'package:shop_app/widgets/main_home_item_container.dart';
import 'package:shop_app/widgets/orange_see_more_btn.dart';

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
      margin: const EdgeInsets.fromLTRB(10.0, 35.0, 0, 35.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            topLabel,
            style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20.0),
          ),
          const SizedBox(height: 5.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              if (labelDesc != "null")
                Text(
                  labelDesc,
                  style: const TextStyle(color: Colors.black26, fontSize: 15.0),
                ),
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
            height: 200,
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
