import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/config/constants.dart';
import 'package:shop_app/view_models/provider/all_providers.dart';
import 'package:shop_app/widgets/user_profile_reusable_widgets/defaultAppBar.dart';
import 'package:shop_app/widgets/user_profile_reusable_widgets/defaultBackButton.dart';
import 'package:shop_app/widgets/user_profile_reusable_widgets/stickyLabel.dart';

class TrackOrder extends StatefulWidget {
const TrackOrder();
  @override
  _TrackOrderState createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  @override
  Widget build(BuildContext context) {
    return Consumer<CartProductItemsProductModelProvider>(
            builder: (_,itemsBoughtProvider,__) {
              return Consumer<ReviewPaymentProvider>(
                  builder: (_, shippingProvider, __) {
                    return Scaffold(
                      backgroundColor: Colors.white,
                      appBar: DefaultAppBar(
                        title: "Order History",
                        child: DefaultBackButton(),
                      ),
                      body: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StickyLabel(text: "Transaction Details",
                            textColor: Colors.black,),
                          Container(
                            margin: const EdgeInsets.only(left: 10,right: 10),
                            // margin: EdgeInsets.symmetric(
                            //     horizontal: 24.0, vertical: 8.0),
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 16.0),
                            decoration: BoxDecoration(
                              color: kWhiteColor,
                              border: Border.all(
                                width: 0.5,
                                color: kLightColor,
                              ),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: ListView.separated(
                              shrinkWrap: true,
                              itemCount: itemsBoughtProvider.itemsToBuy.length,
                              itemBuilder: (context, index) {
                                return Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceBetween,
                                  children: [
                                    Text(
                                      itemsBoughtProvider.itemsToBuy[index].datePurchase,
                                      style: TextStyle(
                                        fontSize: 16.0,
                                        color: kLightColor,
                                      ),
                                    ),
                                    SizedBox(width:2),
                                    Container(
                                      width: 190.0,
                                      child: Text(
                                        itemsBoughtProvider.itemsToBuy[index].itemProductModel.productName,
                                        style: TextStyle(fontSize: 16.0),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Container(
                                      width: 70.0,
                                      child: Text(
                                        "\$ ${itemsBoughtProvider.itemsToBuy[index].itemProductModel.options[0].price}",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          color: Color(0xffFF2725),
                                        ),

                                      ),
                                    ),
                                  ],
                                );
                              },
                              separatorBuilder: (context, index) {
                                return Divider(
                                  thickness: 0.5,
                                  color: kLightColor,
                                );
                              },
                            ),
                          ),
                          SizedBox(height: 8.0),


                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 16.0),
                            padding: EdgeInsets.only(
                                left: 24.0, top: 16.0, bottom: 16.0),
                            decoration: BoxDecoration(
                              color: kWhiteColor,
                              border: Border.all(
                                width: 0.5,
                                color: kLightColor,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.home, size: 64.0,
                                    color: kPrimaryColor),
                                SizedBox(width: 32.0),
                                Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text(
                                        "Delivery Address",
                                        style: TextStyle(fontSize: 20.0),
                                      ),
                                      Text(
                                        "Home, Work & Other Address",
                                        style: TextStyle(
                                          fontSize: 17.0,
                                          color: kDarkColor.withOpacity(0.7),
                                        ),
                                      ),
                                      Container(
                                        width: MediaQuery
                                            .of(context)
                                            .size
                                            .width / 1.8,
                                        child: Text(
                                          "${shippingProvider
                                              .shippingAddressModel!
                                              .streetAddress },${shippingProvider
                                              .shippingAddressModel!
                                              .countryName},${shippingProvider
                                              .shippingAddressModel!
                                              .city},${shippingProvider
                                              .shippingAddressModel!.zipCode}",
                                          style: TextStyle(
                                            fontSize: 15.0,
                                            color: kDarkColor.withOpacity(0.5),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }

              );
            }
    );
  }
}
