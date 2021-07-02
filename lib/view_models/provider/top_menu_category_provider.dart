import 'package:flutter/material.dart';
import 'package:shop_app/services/all_services.dart';

class TopMenuCategoryProvider extends ChangeNotifier {
  List<TopCategoryModel> categories = [];
  List<TopCategoryModel> firstNavCategories = [];
  List<TopCategoryModel> secondNavCategories = [];
  List<TopCategoryModel> thirdNavCategories = [];
  List<TopCategoryModel> fourthNavCategories = [];

  void addCategories(List<TopCategoryModel> topCategories) {
    categories.addAll(topCategories);
    notifyListeners();
  }

  void addFirstNavCategories(List<TopCategoryModel> topCategoryModelList) {
    //Filter Map According to Nav Level which Is One
    List<TopCategoryModel> firstNavCategories = topCategoryModelList
        .where((element) => element.navLevel == "1")
        .toList();

    this.firstNavCategories.addAll(firstNavCategories);
    notifyListeners();
  }

  void addSecondNavCategories(
      {required List<TopCategoryModel> topCategoryModelList, String? parentId}) {
    List<TopCategoryModel> secondNavCategories = topCategoryModelList
        .where((element) => element.navLevel == "2")
        .toList();
    if(parentId!=null){
      List<TopCategoryModel> secondSpecificNavCategories = secondNavCategories
          .where((element) => element.parentId == parentId)
          .toList();
      this.secondNavCategories.addAll(secondSpecificNavCategories);
    }else{
      this.secondNavCategories.addAll(secondNavCategories);
    }

    notifyListeners();
  }

  void addThirdNavCategories({
    required List<TopCategoryModel> topCategoryModelList,
     String? parentId,

  }) {
    print(parentId);
    List<TopCategoryModel> thirdNavCategories = topCategoryModelList
        .where((element) => element.navLevel == "3")
        .toList();
    if(parentId!=null){
      List<TopCategoryModel> thirdSpecificNavCategories = thirdNavCategories
          .where((element) =>
      element.parentId == parentId )
          .toList();
      this.thirdNavCategories.addAll(thirdSpecificNavCategories);
    }else{
      this.thirdNavCategories.addAll(thirdNavCategories);
    }

    notifyListeners();
  }

  void addFourthNavCategories(
      {required List<TopCategoryModel> topCategoryModelList, String? parentId}) {
    List<TopCategoryModel> fourthNavCategories = topCategoryModelList
        .where((element) => element.navLevel == "4")
        .toList();
    if(parentId!=null){
      List<TopCategoryModel> fourthSpecificNavCategories = fourthNavCategories
          .where((element) => element.parentId == parentId)
          .toList();
      this.fourthNavCategories.addAll(fourthSpecificNavCategories);
    }else{
      this.fourthNavCategories.addAll(fourthNavCategories);
    }


    notifyListeners();
  }
}
