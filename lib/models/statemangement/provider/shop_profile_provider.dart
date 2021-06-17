import 'package:flutter/material.dart';
import 'package:shop_app/models/user_model.dart';

class ShopProfileProvider extends ChangeNotifier {
   User? shopProfile;
  void addShopProfile(User inputShopProfile) {
    this.shopProfile = inputShopProfile;
    notifyListeners();
  }
}
