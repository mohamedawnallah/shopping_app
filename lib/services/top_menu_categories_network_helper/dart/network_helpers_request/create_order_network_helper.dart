import 'package:flutter/material.dart';
import 'package:shop_app/models/purchase_models/review_model.dart';
import 'package:shop_app/models/statemangement/provider/purchases_items_product_model_provider.dart';
import 'package:shop_app/models/statemangement/provider/review_payment_provider.dart';
import 'package:shop_app/routes/cart_routes/check_out_route.dart';
import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class CreateOrderNetworkHelper {
  static Future<List> createOrder(ReviewModel reviewModel,CartProductItemsProductModelProvider cartProvider
 ) async {
    String uuid = Uuid().v1();
    var response = await http.post(
      Uri.parse("https://api.iqstars.me/Clique/CreateOrder.aspx"),
      body: {
        "TotalAmount": "${cartProvider.totalPrice}",
        "StatusUpdate": "1",
        "StatusPhone": "01017271971",
        "CustName": "${reviewModel.shippingAddressModel!.fullName}",
        "Company": "Pixel",
        "AptSuite": "${reviewModel.shippingAddressModel!.aptSuiteAddress}",
        "Address":"${ reviewModel.shippingAddressModel!.streetAddress}",
        "City": "${reviewModel.shippingAddressModel!.city}",
        "Country": "${reviewModel.shippingAddressModel!.countryName}",
        "Phone": "01017271971",
        "PaymentOption": generatePaidBy(reviewModel.cardInfo!.cardType),
        "DiscountCode": "ABC123",
        "UniqueID": uuid,
        "Email": "mohamedmohey2352@gmail.com",
     },
    );

    return json.decode(response.body);
  }
}
