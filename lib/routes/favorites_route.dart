import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/statemangement/provider/category_items_provider.dart';
import 'package:shop_app/models/statemangement/provider/item_product_provider.dart';
import 'package:shop_app/services/top_menu_categories_network_helper/dart/item_route_network_helper.dart';
import 'package:shop_app/services/top_menu_categories_network_helper/dart/network_helper_models/home_page_network_helper_model.dart';

import '../route_generator.dart';

class FavoritesRoute extends StatelessWidget {
  final String appBarTitle;
  const FavoritesRoute({required this.appBarTitle});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          appBarTitle,
        ),
        centerTitle: true,
      ),
      body: Consumer<CategoryItemsProvider>(
        builder: (_, items, __) {
          return ListView.builder(
            padding: const EdgeInsets.all(10.0),
            itemBuilder: (context, index) {
              double difference = double.parse(
                  items.mappingProducts['products'][index].oriprice) -
                  double.parse(items
                      .mappingProducts['products'][index].discountprice);
              return Material(
                color: Colors.white24,
                child: InkWell(
                  onTap: ()async{
                    print("Tapped");
                    print("${items.mappingProducts['products'][index].productId}");
                    var itemProductModel =
                        await ItemRouteNetworkHelper.getItemProductModel(items.mappingProducts['products'][index].productId);
                    // Adding Item Product Model
                    Provider.of<ItemProductProvider>(context,listen: false)
                        .addItemProductModel(itemProductModel);
                    Navigator.of(context).pushNamed(RouteGenerator.itemRoute);
                  },
                  splashColor: Colors.red,
                  child: Container(
margin: const EdgeInsets.fromLTRB(0,0,0,10),
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: const BorderRadius.all(Radius.circular(10)),

                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: <Widget>[
                          Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10.0)),
                              border: Border.all(color: Colors.grey, width: 2.0),
                              image: DecorationImage(
                                  image: Image.network(!items.favoriteProducts[index].mediaName.contains("mp4")?items.favoriteProducts[index].mediaName:"https://images.unsplash.com/photo-1577401239170-897942555fb3?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1400&q=80").image,

                                  fit: BoxFit.cover),
                            ),
                          ),
                          SizedBox(width: 4,),
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Product name",
                                  style: const TextStyle(
                                      color: Colors.black, fontSize: 15.0),
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                "Seller Name",
                                  style: const TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 50.0,
                          ),
                          if (items.favoriteProducts[index].discountindicator==Discountindicator.YES)
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
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                        "(${((difference / double.parse(items.mappingProducts['products'][index].oriprice)) * 100).toStringAsFixed(2)}% off)",
                                        style: const TextStyle(
                                          color: Color(0xFF247E34),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
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
                                          FontWeight.bold),
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
                          if (items.favoriteProducts[index].discountindicator==Discountindicator.NO)
                            Column(
                              crossAxisAlignment:
                              CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "No sale",
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontSize: 15.0),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Text(
                                  '\$${items.mappingProducts['products'][index].oriprice}',
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
            itemCount:items.favoriteProducts.length,
          );
        },
      ),
    );
  }
}
