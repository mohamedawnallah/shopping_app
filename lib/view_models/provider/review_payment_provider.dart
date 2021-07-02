import 'package:flutter/material.dart';
import 'package:shop_app/models/all_models.dart';


class ReviewPaymentProvider extends ChangeNotifier{
  late  ShippingAddressModel? shippingAddressModel;
  late CardInfoModel? cardInfoModel;
  late ReviewModel? reviewModel;
  void addShippingAddressModel(ShippingAddressModel shippingAddressModel){
    this.shippingAddressModel=shippingAddressModel;
     notifyListeners();
  }
  void addCardInfoModel (CardInfoModel cardInfoModel){
    this.cardInfoModel=cardInfoModel;
    notifyListeners();
  }
  void addReviewModel(ReviewModel reviewModel){
    this.reviewModel=reviewModel;
    notifyListeners();
  }
}