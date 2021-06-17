import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:shop_app/services/top_menu_categories_network_helper/dart/network_helper_models/item_route_network_helper_model.dart';

class CartProductItemsProductModelProvider extends ChangeNotifier {
  late List<ItemProductModel> cartItemsProductModel = [];
  late List<PairProductIdCheckedState> pairProductIdCheckedState=[];


  void modifyPairProductIdCheckedState(String parentId,bool originalVlaue,bool newValue) {
    int index=this.pairProductIdCheckedState.indexOf(PairProductIdCheckedState(productId: parentId,checkedState: originalVlaue));
    pairProductIdCheckedState[index]=PairProductIdCheckedState(productId: parentId,checkedState: newValue);
    notifyListeners();
  }
  void addListPairProductIdCheckedState(List<PairProductIdCheckedState> pairListProductIdCheckedState) {
    this.pairProductIdCheckedState.addAll(pairListProductIdCheckedState);
    notifyListeners();
  }
  void addItemProductToCart(ItemProductModel itemProductModel) {
    this.cartItemsProductModel.add(itemProductModel);
    notifyListeners();
  }
}

 class PairProductIdCheckedState extends Equatable{
  final bool checkedState;
  final String productId;
  const PairProductIdCheckedState({ this.checkedState=false,required this.productId});

  @override
  // TODO: implement props
  List<Object?> get props => [checkedState,productId];
 }