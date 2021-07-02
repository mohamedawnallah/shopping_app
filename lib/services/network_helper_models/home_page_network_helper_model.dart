// To parse this JSON data, do
//
//     final homePageModel = homePageModelFromJson(jsonString);

import 'dart:convert';

import 'package:equatable/equatable.dart';

List<HomePageModel> homePageModelFromJson(String str) =>
    List<HomePageModel>.from(
        json.decode(str).map((x) => HomePageModel.fromJson(x)));

String homePageModelToJson(List<HomePageModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class HomePageModel {
  HomePageModel({
    required this.topId,
    required this.toplabel,
    required this.subs,
    required this.topTag,
    required this.labelDesc,
  });

  String topId;
  String toplabel;
  String labelDesc;
  String topTag;
  List<Sub> subs;

  factory HomePageModel.fromJson(Map<String, dynamic> json) => HomePageModel(
        topId: json["topID"],
        toplabel: json["toplabel"],
        labelDesc: json['labelDesc'],
        topTag: json['topTag'],
        subs: List<Sub>.from(json["subs"].map((x) => Sub.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "topID": topId,
        "toplabel": toplabel,
        "subs": List<dynamic>.from(subs.map((x) => x.toJson())),
      };
}

class Sub {
  Sub({
    required this.id,
    required this.label,
    required this.products,
  });

  String id;
  String label;
  List<Product> products;

  factory Sub.fromJson(Map<String, dynamic> json) => Sub(
        id: json["ID"] ?? json["id"],
        label: json["label"],
        products: List<Product>.from(
            json["products"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "ID": id == null ? null : id,
        "label": label,
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class Product extends Equatable{
  Product({
    required this.productId,
    required this.mediaName,
     this.mediaType,
    required this.oriprice,
    required this.discountprice,
    required this.discountindicator,
  });
  @override
  String toString() {
    return '#####$productId : $mediaName : $mediaType : $oriprice : $discountprice : $discountindicator ###';
  }
  final String productId;
  final String mediaName;
   MediaType? mediaType;
  final String oriprice;
  final String discountprice;
  final Discountindicator discountindicator;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        productId: json["productID"],
        mediaName: json["mediaName"],
        mediaType: mediaTypeValues.map![json["mediaType"]]!,
        oriprice: json["oriprice"],
        discountprice: json["discountprice"],
        discountindicator:
            discountindicatorValues.map![json["discountindicator"]]!,
      );

  Map<String, dynamic> toJson() => {
        "productID": productId,
        "mediaName": mediaName,
        "mediaType": mediaTypeValues.reverse[mediaType],
        "oriprice": oriprice,
        "discountprice": discountprice,
        "discountindicator": discountindicatorValues.reverse[discountindicator],
      };

  @override
  // TODO: implement props
  List<Object?> get props =>[productId,mediaName,mediaType,oriprice,discountprice,discountindicator];
}

enum Discountindicator { YES, NO }

final discountindicatorValues =
    EnumValues({"No": Discountindicator.NO, "Yes": Discountindicator.YES});

enum MediaType { IMAGE }

final mediaTypeValues = EnumValues({"Image": MediaType.IMAGE});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap!;
  }


}
