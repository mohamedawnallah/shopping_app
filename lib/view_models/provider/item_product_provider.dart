import 'package:flutter/cupertino.dart';
import 'package:shop_app/services/all_services.dart';

class ItemProductProvider extends ChangeNotifier{
  ItemProductModel? itemProductModel;
  void addItemProductModel(ItemProductModel itemProductModel){
    this.itemProductModel=itemProductModel;
    notifyListeners();
  }
}
