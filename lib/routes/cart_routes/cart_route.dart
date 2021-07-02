import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/config/constants.dart';
import 'package:shop_app/route_generator.dart';
import 'package:shop_app/services/all_services.dart';
import 'package:shop_app/services/network_helpers_request/item_route_network_helper.dart';
import 'package:shop_app/utils/parsing_html_helper_tool.dart';
import 'package:shop_app/view_models/provider/all_providers.dart';
import 'package:shop_app/models/all_models.dart';

class CartRoute extends StatelessWidget {
  final String appBarTitle;
  const CartRoute({required this.appBarTitle});
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProductItemsProductModelProvider>(
        builder: (_, topCartItemsProvider, __) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(appBarTitle),
          centerTitle: false,
        ),
        body: Consumer<CartProductItemsProductModelProvider>(
          builder: (_, cartItemsProvider, __) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.builder(
                itemCount: cartItemsProvider.cartItemsProductModel.length,
                itemBuilder: (context, index) {
                  // WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
                  //   // print("Hello World");
                  //   // print("Hello World");
                  //   // cartItemsProvider.addListPairProductIdCheckedState(
                  //   //   cartItemsProvider.cartItemsProductModel
                  //   //       .map(
                  //   //         (e) {
                  //   //
                  //   //      return     PairProductIdCheckedState(
                  //   //             checkedState: false,
                  //   //             productId: e.intId!,
                  //   //           );
                  //   //     }
                  //   //       )
                  //   //       .toList(),
                  //   // );
                  //   // print("Hello World");
                  // });

                  return Column(
                    children: <Widget>[
                      Container(
                        height: 500,
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Checkbox(
                              checkColor: Colors.orange[200],
                              value: cartItemsProvider
                                  .pairProductIdCheckedState[index]
                                  .checkedState,
                              onChanged: (bool? value) {
                                //Modify
                                //checkedState value
                                //Index of

                                cartItemsProvider
                                    .modifyPairProductIdCheckedState(
                                        cartItemsProvider
                                            .cartItemsProductModel[index]
                                            .intId!,
                                        cartItemsProvider
                                            .pairProductIdCheckedState[index]
                                            .checkedState,
                                        value!);
                              },
                            ),
                            SizedBox(
                              width: 5.0,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "${cartItemsProvider.cartItemsProductModel[index].sellerName}",
                                  style: const TextStyle(
                                    color: Colors.black,
                                    // overflow: TextOverflow.ellipsis
                                  ),
                                ),
                                Row(
                                  children: <Widget>[
                                    Text(
                                      "#12345678910",
                                      style: const TextStyle(
                                        color: Color(
                                          0xff717171,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 3),
                                    Text(
                                      "\$${cartItemsProvider.cartItemsProductModel[index].options[0].price}",
                                      style:
                                          const TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 290,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        height: 70,
                                        width: 70,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(7),
                                          child: Image.network(
                                            cartItemsProvider
                                                .cartItemsProductModel[index]
                                                .medias[0]
                                                .mediaName,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 8.0,
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Text(ParsingHtmlHelperTool
                                              .parseHtmlString(cartItemsProvider
                                                  .cartItemsProductModel[index]
                                                  .productName)),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 9.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 75),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        "Quantity ${cartItemsProvider.cartItemsProductModel[index].options[0].stockQty}",
                                        style: const TextStyle(
                                          color: Color(0xff9D9D9D),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        "Color Red",
                                        style: const TextStyle(
                                          color: Color(0xff9D9D9D),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Text(
                                        "Size & Customization 24\"Standard",
                                        style: const TextStyle(
                                          color: Color(0xff9D9D9D),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                      SizedBox(height: 4),
                                      Text(
                                        "In transit",
                                        style: const TextStyle(
                                            color: Color(0xff5A5A5A),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 21),
                                      ),
                                      Text("Ordered Jan 26,2018"),
                                      SizedBox(height: 4),
                                      Container(
                                          padding: const EdgeInsets.all(10),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.grey.shade400,
                                          ),
                                          child: Column(children: <Widget>[
                                            Text(
                                              "923213421313123213",
                                              style: const TextStyle(
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              "Shipped on Feb 20 Refund",
                                              style: const TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                          ])),
                                      SizedBox(height: 10),
                                      Container(
                                        child: Text(
                                          "Ship to",
                                          style: const TextStyle(
                                              color: Color(0xffADAEAD),
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Text(
                                        "Danielle Mcqueen",
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        "Houston, Tx",
                                        style: const TextStyle(
                                          color: Colors.black87,
                                        ),
                                      ),
                                      SizedBox(height: 15),
                                      Row(
                                        children: <Widget>[
                                          Icon(
                                            Icons.redeem,
                                            color: Color(
                                              0xffFF8C45,
                                            ),
                                          ),
                                          SizedBox(width: 3),
                                          Text(
                                            "Marked as gift",
                                            style: const TextStyle(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                      ),
                    ],
                  );
                },
              ),
            );
          },
        ),
        bottomSheet: Visibility(
          visible:
              topCartItemsProvider.cartItemsProductModel.isEmpty ? false : true,
          child: GestureDetector(
            onTap: () async {
              topCartItemsProvider.itemsToBuy.clear();
              double totalPriceItemProductsSelected = 0;

              List<PairProductIdCheckedState> pairProductCheckedState =
                  topCartItemsProvider.pairProductIdCheckedState
                      .where((pairProduct) {
                return pairProduct.checkedState == true;
              }).toList();
              // topCartItemsProvider.checkedItems.clear();
              // topCartItemsProvider.cartItemsProductModel.clear();
              for (int index = 0;
                  index < pairProductCheckedState.length;
                  index++) {
                ItemProductModel itemProductModel =
                    await ItemRouteNetworkHelper.getItemProductModel(
                        pairProductCheckedState[index].productId);
                final itemToBuy = ItemToBuy(
                    itemProductModel: itemProductModel,
                    datePurchase: DateFormat.yMMMd().format(DateTime.now()));
                topCartItemsProvider.addItemsToBuy(itemToBuy);

                totalPriceItemProductsSelected +=
                    double.parse(itemProductModel.options[0].price);
                print("############");
                print(totalPriceItemProductsSelected);
                print("############");
              }
              topCartItemsProvider
                  .addTotalPriceCheckedItems(totalPriceItemProductsSelected);

              Navigator.of(context).pushNamed(RouteGenerator.purchasesRoute);
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.red,
                  border: Border.all(color: Colors.grey, width: 2)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    child: Text(
                      "Purchase Now",
                      style: const TextStyle(
                        fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
