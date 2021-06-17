import 'package:flutter/cupertino.dart';
import 'package:shop_app/services/top_menu_categories_network_helper/dart/network_helper_models/item_route_network_helper_model.dart';

class ItemProductProvider extends ChangeNotifier{
  ItemProductModel? itemProductModel;
  void addItemProductModel(ItemProductModel itemProductModel){
    this.itemProductModel=itemProductModel;
    notifyListeners();
  }
}