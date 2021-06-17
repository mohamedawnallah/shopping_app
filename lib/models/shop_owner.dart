import 'package:shop_app/models/shop_item.dart';

class ShopOwner{
  final int id;
final String imageUrl;
final String name;
final int following;
final int followers;
final String overview;

  ShopOwner({required this.id,required this.imageUrl,required this.name,required this.following,required this.followers,required this.overview});
}