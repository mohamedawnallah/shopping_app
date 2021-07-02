// To parse this JSON data, do
//
//     final productCategoryNetworkModel = productCategoryNetworkModelFromJson(jsonString);

import 'dart:convert';

List<ProductCategoryNetworkModel> productCategoryNetworkModelFromJson(String str) => List<ProductCategoryNetworkModel>.from(json.decode(str).map((x) => ProductCategoryNetworkModel.fromJson(x)));

String productCategoryNetworkModelToJson(List<ProductCategoryNetworkModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductCategoryNetworkModel {
  ProductCategoryNetworkModel({
   required this.productId,
    required this.price,
    required this.discountedPrice,
    required this.stockQty,
    required this.mediaName,
    required this.mediaType,
    required this.productName,
    required this.bestSellerTag,
    required  this.giftWrapTag,
    required this.freeShippingTag,
    required  this.sellerName,
  });

  String productId;
  String price;
  String discountedPrice;
  String stockQty;
  String mediaName;
  MediaType mediaType;
  String productName;
  Tag bestSellerTag;
  Tag giftWrapTag;
  FreeShippingTag freeShippingTag;
  String sellerName;

  factory ProductCategoryNetworkModel.fromJson(Map<String, dynamic> json) => ProductCategoryNetworkModel(
    productId: json["productID"],
    price: json["price"],
    discountedPrice: json["discountedPrice"],
    stockQty: json["stockQty"],
    mediaName: json["mediaName"],
    mediaType: mediaTypeValues.map[json["mediaType"]]!,
    productName: json["productName"],
    bestSellerTag: tagValues.map[json["bestSellerTag"]]!,
    giftWrapTag: tagValues.map[json["giftWrapTag"]]!,
    freeShippingTag: freeShippingTagValues.map[json["freeShippingTag"]]!,
    sellerName: json["sellerName"],
  );

  Map<String, dynamic> toJson() => {
    "productID": productId,
    "price": price,
    "discountedPrice": discountedPrice,
    "stockQty": stockQty,
    "mediaName": mediaName,
    "mediaType": mediaTypeValues.reverse[mediaType],
    "productName": productName,
    "bestSellerTag": tagValues.reverse[bestSellerTag],
    "giftWrapTag": tagValues.reverse[giftWrapTag],
    "freeShippingTag": freeShippingTagValues.reverse[freeShippingTag],
    "sellerName": sellerName,
  };
}

enum Tag { N, Y }

final tagValues = EnumValues({
  "N": Tag.N,
  "Y": Tag.Y
});

enum FreeShippingTag { FREE, EMPTY }

final freeShippingTagValues = EnumValues({
  "": FreeShippingTag.EMPTY,
  "free": FreeShippingTag.FREE
});



final mediaTypeValues = EnumValues({
  "Image": MediaType.IMAGE
});

class EnumValues<T> {
  Map<String, T> map={};
  Map<T, String> reverseMap={};

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
  
}
enum MediaType { IMAGE }