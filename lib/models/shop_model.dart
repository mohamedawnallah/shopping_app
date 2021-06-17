import 'package:flutter/material.dart';
import 'package:shop_app/models/shop_owner.dart';
class ShopModel{
  final String shopName;
  final String shopImage;
  final String shopLocation;
  final String description;
  final ShopOwner userProfileOwner;

  ShopModel({
     required this.shopName,required this.shopImage,required this.shopLocation,required this.userProfileOwner,required this.description});
}