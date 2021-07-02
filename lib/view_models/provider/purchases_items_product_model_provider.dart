import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:shop_app/services/all_services.dart';

class CartProductItemsProductModelProvider extends ChangeNotifier {
  late List<ItemProductModel> cartItemsProductModel = [];
  late List<PairProductIdCheckedState> pairProductIdCheckedState=[];
 late double totalPrice=0;
late List<ItemProductModel>checkedItems=[];
late List<ItemToBuy>itemsToBuy=[];
  void modifyPairProductIdCheckedState(String parentId,bool originalVlaue,bool newValue) {
    int index=this.pairProductIdCheckedState.indexOf(PairProductIdCheckedState(productId: parentId,checkedState: originalVlaue));
    pairProductIdCheckedState[index]=PairProductIdCheckedState(productId: parentId,checkedState: newValue);
    notifyListeners();
  }

  void addTotalPriceCheckedItems(double totalPriceCheckedItems){
   this.totalPrice=totalPriceCheckedItems;
    notifyListeners();
  }
  void addListPairProductIdCheckedState(List<PairProductIdCheckedState> pairListProductIdCheckedState) {
    this.pairProductIdCheckedState.addAll(pairListProductIdCheckedState);
    notifyListeners();
  }
  void addPairProductIdCheckedState(PairProductIdCheckedState pairListProductIdCheckedState) {
    this.pairProductIdCheckedState.add(pairListProductIdCheckedState);
    notifyListeners();
  }
  void addItemProductToCart(ItemProductModel itemProductModel) {
    this.cartItemsProductModel.add(itemProductModel);
    this.pairProductIdCheckedState.add(PairProductIdCheckedState(productId: itemProductModel.intId!,checkedState: false));
    notifyListeners();
  }
  void addItemsProductsToCart(List<ItemProductModel> itemProductModelList) {
    this.cartItemsProductModel.addAll(itemProductModelList);
    notifyListeners();
  }
  void addItemsToBuy(ItemToBuy itemToBuy){
    this.itemsToBuy.add(itemToBuy);
    notifyListeners();
  }
}

class ItemToBuy{
final ItemProductModel itemProductModel;
final String datePurchase;
const ItemToBuy({required this.itemProductModel,required this.datePurchase});
}
 class PairProductIdCheckedState extends Equatable{
  final bool checkedState;
  final String productId;
  const PairProductIdCheckedState({ this.checkedState=false,required this.productId});

  @override
  // TODO: implement props
  List<Object?> get props => [checkedState,productId];
 }