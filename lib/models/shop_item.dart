import 'package:shop_app/enums/categories.dart';
import 'package:shop_app/models/shop_model.dart';
import 'package:shop_app/models/faq_model.dart';
import 'package:shop_app/models/item_overview.dart';
import 'package:shop_app/enums/shop_item_style.dart';

class ShopItem {
  final int id;
  final String title;
  final String subtitle;
  //If it has not sale the free shipping text will appear then
  final bool hasSale;
  final double price;
  final int reviews;
  final List<String> listOfImages;
  final ShopItemStyle style;
  final bool isAvailable;
  final ItemOverview itemOverview;
  final String itemDetails;
  final String shippingPolicies;
  final List<FAQ> fAQS;
  final ShopModel shopModel;
  final double salePercentage;
  final Category category;

  ShopItem({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.hasSale,
    required this.price,
    required this.reviews,
    required this.listOfImages,
    required this.style,
    required this.isAvailable,
    required this.itemOverview,
    required this.itemDetails,
    required this.shippingPolicies,
    required this.fAQS,
    this.salePercentage=0,
    required this.shopModel,
    required this.category
  });
}
