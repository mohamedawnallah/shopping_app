import 'package:flutter/cupertino.dart';
import 'package:shop_app/services/all_services.dart';
import 'package:shop_app/services/network_helper_models/product_category_network_helper_model.dart';


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
