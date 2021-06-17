import 'package:shop_app/services/top_menu_categories_network_helper/dart/network_helper_models/home_page_network_helper_model.dart';

class ProductsListModel{
  final List<Product>productsList;
  final String labelProducts;
  ProductsListModel({required this.productsList,required this.labelProducts});
}