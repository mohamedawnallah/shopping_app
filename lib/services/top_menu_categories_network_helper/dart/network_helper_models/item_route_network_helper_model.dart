// To parse this JSON data, do
//
//     final itemProductModel = itemProductModelFromJson(jsonString);

import 'dart:convert';

List<ItemProductModel> itemProductModelFromJson(String str) => List<ItemProductModel>.from(json.decode(str).map((x) => ItemProductModel.fromJson(x)));

String itemProductModelToJson(List<ItemProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ItemProductModel {
  ItemProductModel({
  required  this.productName,
    required  this.productDesc,
    required  this.productType,
    required  this.bestSellerTag,
    required  this.giftWrapTag,
    required  this.localTax,
    required  this.processingTimeframe,
    required  this.estimationFrom,
    required  this.estimationTo,
    required  this.timeIndicator,
    required  this.shippingCost,
    required this.returnExchangeNote,
    required  this.shipFrom,
    required  this.shopPolicy,
    required  this.salesTerms,
    required  this.productionPartner,
    required   this.schedule,
    required   this.deliveryPolicy,
    required   this.productionPolicy,
    required  this.currency,
    required  this.creatorType,
    required  this.productionDate,
    required this.productUse,
    required  this.primaryColor,
    required  this.secondaryColor,
    required  this.sellerName,
    required  this.sellerPhoto,
    required  this.sellerLocation,
    required  this.materials,
    required  this.options,
    required  this.medias,
    required this.highlights,
    required  this.faq,
    required  this.shipping,
    required  this.destination,
  });

  String productName;
  String productDesc;
  String productType;
  String bestSellerTag;
  String giftWrapTag;
  String localTax;
  String processingTimeframe;
  String estimationFrom;
  String estimationTo;
  String timeIndicator;
  String shippingCost;
  String returnExchangeNote;
  String shipFrom;
  String shopPolicy;
  String salesTerms;
  String productionPartner;
  String schedule;
  String deliveryPolicy;
  String productionPolicy;
  String currency;
  String creatorType;
  String productionDate;
  String productUse;
  String primaryColor;
  String secondaryColor;
  String sellerName;
  String sellerPhoto;
  String sellerLocation;
  List<dynamic> materials;
  List<Option> options;
  List<Media> medias;
  List<Highlight> highlights;
  List<dynamic> faq;
  List<dynamic> shipping;
  List<dynamic> destination;

  factory ItemProductModel.fromJson(Map<String, dynamic> json) => ItemProductModel(
    productName: json["productName"],
    productDesc: json["productDesc"],
    productType: json["productType"],
    bestSellerTag: json["bestSellerTag"],
    giftWrapTag: json["giftWrapTag"],
    localTax: json["localTax"],
    processingTimeframe: json["processingTimeframe"],
    estimationFrom: json["estimationFrom"],
    estimationTo: json["estimationTo"],
    timeIndicator: json["timeIndicator"],
    shippingCost: json["shippingCost"],
    returnExchangeNote: json["returnExchangeNote"],
    shipFrom: json["shipFrom"],
    shopPolicy: json["shopPolicy"],
    salesTerms: json["salesTerms"],
    productionPartner: json["productionPartner"],
    schedule: json["schedule"],
    deliveryPolicy: json["deliveryPolicy"],
    productionPolicy: json["productionPolicy"],
    currency: json["currency"],
    creatorType: json["creatorType"],
    productionDate: json["productionDate"],
    productUse: json["productUse"],
    primaryColor: json["primaryColor"],
    secondaryColor: json["secondaryColor"],
    sellerName: json["sellerName"],
    sellerPhoto: json["sellerPhoto"],
    sellerLocation: json["sellerLocation"],
    materials: List<dynamic>.from(json["materials"].map((x) => x)),
    options: List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
    medias: List<Media>.from(json["medias"].map((x) => Media.fromJson(x))),
    highlights: List<Highlight>.from(json["highlights"].map((x) => Highlight.fromJson(x))),
    faq: List<dynamic>.from(json["FAQ"].map((x) => x)),
    shipping: List<dynamic>.from(json["shipping"].map((x) => x)),
    destination: List<dynamic>.from(json["destination"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "productName": productName,
    "productDesc": productDesc,
    "productType": productType,
    "bestSellerTag": bestSellerTag,
    "giftWrapTag": giftWrapTag,
    "localTax": localTax,
    "processingTimeframe": processingTimeframe,
    "estimationFrom": estimationFrom,
    "estimationTo": estimationTo,
    "timeIndicator": timeIndicator,
    "shippingCost": shippingCost,
    "returnExchangeNote": returnExchangeNote,
    "shipFrom": shipFrom,
    "shopPolicy": shopPolicy,
    "salesTerms": salesTerms,
    "productionPartner": productionPartner,
    "schedule": schedule,
    "deliveryPolicy": deliveryPolicy,
    "productionPolicy": productionPolicy,
    "currency": currency,
    "creatorType": creatorType,
    "productionDate": productionDate,
    "productUse": productUse,
    "primaryColor": primaryColor,
    "secondaryColor": secondaryColor,
    "sellerName": sellerName,
    "sellerPhoto": sellerPhoto,
    "sellerLocation": sellerLocation,
    "materials": List<dynamic>.from(materials.map((x) => x)),
    "options": List<dynamic>.from(options.map((x) => x.toJson())),
    "medias": List<dynamic>.from(medias.map((x) => x.toJson())),
    "highlights": List<dynamic>.from(highlights.map((x) => x.toJson())),
    "FAQ": List<dynamic>.from(faq.map((x) => x)),
    "shipping": List<dynamic>.from(shipping.map((x) => x)),
    "destination": List<dynamic>.from(destination.map((x) => x)),
  };
}

class Highlight {
  Highlight({
    required  this.labelName,
    required  this.labelValue,
  });

  String labelName;
  String labelValue;

  factory Highlight.fromJson(Map<String, dynamic> json) => Highlight(
    labelName: json["labelName"],
    labelValue: json["labelValue"],
  );

  Map<String, dynamic> toJson() => {
    "labelName": labelName,
    "labelValue": labelValue,
  };
}

class Media {
  Media({
    required this.mediaName,
    required this.mediaType,
  });

  String mediaName;
  String mediaType;

  factory Media.fromJson(Map<String, dynamic> json) => Media(
    mediaName: json["mediaName"],
    mediaType: json["mediaType"],
  );

  Map<String, dynamic> toJson() => {
    "mediaName": mediaName,
    "mediaType": mediaType,
  };
}

class Option {
  Option({
    required this.optionLabel,
    required this.optionValue,
    required  this.optionTag,
    required  this.price,
    required  this.discountedPrice,
    required this.discountIndicator,
    required  this.discountEod,
    required this.stockQty,
    required this.personalizationNote,
  });

  String optionLabel;
  String optionValue;
  String optionTag;
  String price;
  String discountedPrice;
  String discountIndicator;
  String discountEod;
  String stockQty;
  String personalizationNote;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
    optionLabel: json["optionLabel"],
    optionValue: json["optionValue"],
    optionTag: json["optionTag"],
    price: json["price"],
    discountedPrice: json["discountedPrice"],
    discountIndicator: json["discountIndicator"],
    discountEod: json["discountEOD"],
    stockQty: json["stockQty"],
    personalizationNote: json["personalizationNote"],
  );

  Map<String, dynamic> toJson() => {
    "optionLabel": optionLabel,
    "optionValue": optionValue,
    "optionTag": optionTag,
    "price": price,
    "discountedPrice": discountedPrice,
    "discountIndicator": discountIndicator,
    "discountEOD": discountEod,
    "stockQty": stockQty,
    "personalizationNote": personalizationNote,
  };
}
