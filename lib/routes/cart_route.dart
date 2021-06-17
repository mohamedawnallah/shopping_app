import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/constants/constants.dart';
import 'package:shop_app/models/statemangement/provider/purchases_items_product_model_provider.dart';
import 'package:shop_app/route_generator.dart';
import 'package:shop_app/utils/parsing_html_helper_tool.dart';

// if (cartItemsProvider.checkedState[index] == false) {
//
// cartItemsProvider.addCheckedState(true,index);
//
// } else {
// cartItemsProvider.addCheckedState(false,index);
//
// }
// Icon(Icons.check_box)
// :Icon(
// Icons.check_box_outline_blank,
// color: Colors.orange[200],
// ),
class CartRoute extends StatelessWidget {
  final String appBarTitle;
  const CartRoute({required this.appBarTitle});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(appBarTitle),
        centerTitle: true,
      ),
      body: Consumer<CartProductItemsProductModelProvider>(
        builder: (_, cartItemsProvider, __) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: ListView.builder(
              itemCount: cartItemsProvider.cartItemsProductModel.length,
              itemBuilder: (context, index) {
                WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
                  cartItemsProvider.addListPairProductIdCheckedState(
                    cartItemsProvider.cartItemsProductModel
                        .map(
                          (e) => PairProductIdCheckedState(
                            checkedState: false,
                            productId: e.productName,
                          ),
                        )
                        .toList(),
                  );
                });

                return Column(
                  children: <Widget>[
                    Container(
                      height: 200,
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Checkbox(
                            checkColor: Colors.orange[200],
                            value: cartItemsProvider
                                .pairProductIdCheckedState[index].checkedState,
                            onChanged: (bool? value) {
                              //Modify
                              //checkedState value
                              //Index of

                              cartItemsProvider.modifyPairProductIdCheckedState(
                                  cartItemsProvider
                                      .cartItemsProductModel[index].productName,
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
                                "${index + 1}-",
                                style: const TextStyle(
                                    color: Colors.black,
                                    // overflow: TextOverflow.ellipsis
                                ),
                              ),
                              Text(
                                "\$${cartItemsProvider.cartItemsProductModel[index].options[0].price}",
                                style: const TextStyle(color: Colors.grey),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 290,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                      height: 70,
                                      width: 70,
                                      color: Colors.blue,
                                      child: Image.network(
                                        cartItemsProvider
                                            .cartItemsProductModel[index]
                                            .medias[0]
                                            .mediaName,
                                        fit: BoxFit.cover,
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
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 9.0,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Quantity:${cartItemsProvider.cartItemsProductModel[index].options[0].stockQty}",
                                    style: const TextStyle(
                                      color: Colors.black87,
                                    ),
                                  ),
                                  Text(
                                    "${cartItemsProvider.cartItemsProductModel[index].primaryColor}",
                                    style:
                                        const TextStyle(color: Colors.black87),
                                  ),
                                  Text(
                                    "Size & Customization 24\"Standard",
                                    style:
                                        const TextStyle(color: Colors.black87),
                                  ),
                                ],
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
      bottomSheet: GestureDetector(
        onTap: () {
          Navigator.of(context)
              .pushNamed(RouteGenerator.purchasesRoute);
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
    );
  }
}
