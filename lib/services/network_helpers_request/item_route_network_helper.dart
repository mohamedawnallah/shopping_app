import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../all_services.dart';

class ItemRouteNetworkHelper {
  static Future<ItemProductModel> getItemProductModel(
       String productId) async {
    var response = await http.post(
        Uri.parse("https://api.iqstars.me/Clique/ListProductDetail.aspx"),
        body: {
          "productID": productId,
        });

   return  ItemProductModel.fromJson(
      json.decode(response.body)[0],productId
    );
  }
}
