// To parse this JSON data, do
//
//     final subCategoryNetworkModel = subCategoryNetworkModelFromJson(jsonString);

import 'dart:convert';

List<SubCategoryNetworkModel> subCategoryNetworkModelFromJson(String str) => List<SubCategoryNetworkModel>.from(json.decode(str).map((x) => SubCategoryNetworkModel.fromJson(x)));

String subCategoryNetworkModelToJson(List<SubCategoryNetworkModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubCategoryNetworkModel {
  SubCategoryNetworkModel({
  required  this.topMenuId,
  required  this.topMenuName,
 required   this.subMenu,
  });

  String topMenuId;
  String topMenuName;
  List<SubMenu> subMenu;

  factory SubCategoryNetworkModel.fromJson(Map<String, dynamic> json) => SubCategoryNetworkModel(
    topMenuId: json["topMenuID"],
    topMenuName: json["topMenuName"],
    subMenu: List<SubMenu>.from(json["subMenu"].map((x) => SubMenu.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "topMenuID": topMenuId,
    "topMenuName": topMenuName,
    "subMenu": List<dynamic>.from(subMenu.map((x) => x.toJson())),
  };
}

class SubMenu {
  SubMenu({
   required this.subMenuId,
  required  this.subMenuName,
  });

  String subMenuId;
  String subMenuName;

  factory SubMenu.fromJson(Map<String, dynamic> json) => SubMenu(
    subMenuId: json["subMenuID"],
    subMenuName: json["subMenuName"],
  );

  Map<String, dynamic> toJson() => {
    "subMenuID": subMenuId,
    "subMenuName": subMenuName,
  };
}
