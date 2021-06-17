import 'package:flutter/cupertino.dart';
import 'package:shop_app/services/top_menu_categories_network_helper/dart/network_helper_models/ProductCategoryNetworkModel.dart';
import 'package:shop_app/services/top_menu_categories_network_helper/dart/network_helper_models/item_route_network_helper_model.dart';
import 'package:shop_app/services/top_menu_categories_network_helper/dart/network_helper_models/sub_category_network_helper__model.dart';

//Contains:
/*
*SubCategories
*Products
 */
class ProductCategoryListProvider extends ChangeNotifier {
  late TheTopCategoryRelevance productsSubCategoriesOneRelevance;
  void addTopCategoryRelevance(
      TheTopCategoryRelevance   theTopCategoryRelevance) {
    productsSubCategoriesOneRelevance = theTopCategoryRelevance;
    notifyListeners();
  }
  void removeTopCategoryRelevance(){
  }
}

class TheTopCategoryRelevance {
  final List<ProductCategoryNetworkModel> productCategoryList;
  final List<SubCategoryNetworkModel> subCategoriesList;
  final String topCategoryName;
  const TheTopCategoryRelevance({
    required this.productCategoryList,
    required this.subCategoriesList,
    required this.topCategoryName,
  });
}
