import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/services/all_services.dart';
import 'package:shop_app/services/network_helpers_request/item_route_network_helper.dart';
import 'package:shop_app/utils/parsing_html_helper_tool.dart';
import 'package:shop_app/widgets/all_widgets.dart';

import 'package:shop_app/view_models/provider/all_providers.dart';

import '../../route_generator.dart';
import '../../routes/home_routes/category_items_route.dart';
import 'bg_item_image.dart';

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
          height: !kIsWeb ? 270 : 300,
          width: double.infinity,
          child: BgItemImage(
            imageUrl:
            "https://images.unsplash.com/photo-1483985988355-763728e1935b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1650&q=80",
          ),
        ),
        Positioned.fill(
          top: 10.0,
          child: Align(
            alignment: Alignment.topCenter,
            child: Opacity(
              opacity: 1.0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 550,
                margin: const EdgeInsets.only(left: 30.0, right: 30.0),
                padding: const EdgeInsets.all(15.0),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: <BoxShadow>[
                    BoxShadow(color: Colors.grey, blurRadius: 20.0)
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
                        style: GoogleFonts.almendra().copyWith(
                            color: Colors.black,
                            fontSize: !kIsWeb?22:22

                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        ParsingHtmlHelperTool.parseHtmlString(topLabel),
                        style: GoogleFonts.almendra().copyWith(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize:!kIsWeb
                                ? 22
                                : 25),
                      ),
                      const SizedBox(
                        height: 5.0,
                      ),
                      Flexible(
                        child: Container(
                          child: Text(
                            labelDesc,
                            style: GoogleFonts.almendra().copyWith(
                                color: Colors.black,
                                fontSize: !kIsWeb
                                    ? 20
                                    : 20),
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
          bottom: !kIsWeb ? 50.0 : 55.0,
          left:!kIsWeb? 0 : 0,
          right: !kIsWeb ? 10 : 10,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: !kIsWeb?  500 : MediaQuery.of(context).size.width,
              height:
              !kIsWeb ? 150 : 170,
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
                                .getItemProductModel(e.productId);
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
          bottom:kIsWeb? 14.0:14,
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
