import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/constants/constants.dart';
import 'package:shop_app/models/statemangement/provider/category_items_provider.dart';
import 'package:shop_app/models/statemangement/provider/product_categrory_list_provider.dart';
import 'package:shop_app/models/statemangement/provider/top_menu_category_provider.dart';
import 'package:shop_app/routes/home_route.dart';
import 'package:shop_app/services/top_menu_categories_network_helper/dart/list_product_network_helper.dart';
import 'package:shop_app/services/top_menu_categories_network_helper/dart/network_helper_models/sub_category_network_helper__model.dart';
import 'package:shop_app/utils/parsing_html_helper_tool.dart';
import 'package:flutter/foundation.dart'show kIsWeb;
import '../route_generator.dart';

class AppDrawer extends StatelessWidget {
  final ProductCategoryListProvider productCategoryListProvider;
  const AppDrawer({required this.productCategoryListProvider});
  @override
  Widget build(BuildContext context) {
    return Container(
      width:!kIsWeb?300:500 ,
      child: Drawer(

        child: Consumer<TopMenuCategoryProvider>(
          builder: (context, topMenuCategoryProvider, child) {
            return ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                _createHeader(),
                ...productCategoryListProvider
                    .productsSubCategoriesOneRelevance.subCategoriesList
                    .map((subCategory) {
                  return _createDrawerItem(
                      icon: Icons.more_horiz,
                      topMenuName: ParsingHtmlHelperTool.parseHtmlString(
                          subCategory.topMenuName),
                      subMenus: subCategory.subMenu,
                      onTap: () {},
                      context: context);
                }).toList(),
                ListTile(
                  title: Text('0.0.1'),
                  onTap: () {},
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _createHeader() {
    String imageUrl = "";
    if (ParsingHtmlHelperTool.parseHtmlString(productCategoryListProvider
        .productsSubCategoriesOneRelevance.topCategoryName)
        .startsWith("${nav2ParentIds[0].categoryName}")) {
      imageUrl =
          "https://images.unsplash.com/photo-1579783902614-a3fb3927b6a5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=766&q=80";
    } else if (ParsingHtmlHelperTool.parseHtmlString(productCategoryListProvider
        .productsSubCategoriesOneRelevance.topCategoryName)
        .startsWith("${nav2ParentIds[1].categoryName}")) {
      imageUrl =
          "https://images.unsplash.com/photo-1544441893-675973e31985?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80";
    } else if (ParsingHtmlHelperTool.parseHtmlString(productCategoryListProvider
        .productsSubCategoriesOneRelevance.topCategoryName)
        .startsWith("${nav2ParentIds[2].categoryName}")) {
      imageUrl =
          "https://images.unsplash.com/photo-1516783154360-123b392d0833?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1489&q=80";
    } else if (ParsingHtmlHelperTool.parseHtmlString(productCategoryListProvider
        .productsSubCategoriesOneRelevance.topCategoryName)
        .startsWith("${nav2ParentIds[3].categoryName}")) {
      imageUrl =
          "https://images.unsplash.com/photo-1616627451515-cbc80e5ece35?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80";
    } else if (ParsingHtmlHelperTool.parseHtmlString(productCategoryListProvider
        .productsSubCategoriesOneRelevance.topCategoryName)
        .startsWith("${nav2ParentIds[4].categoryName}")) {
      imageUrl =
          "https://images.unsplash.com/photo-1599643478518-a784e5dc4c8f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80";
    } else if (ParsingHtmlHelperTool.parseHtmlString(productCategoryListProvider
        .productsSubCategoriesOneRelevance.topCategoryName)
        .startsWith("${nav2ParentIds[5].categoryName}")) {
      imageUrl =
          "https://images.unsplash.com/photo-1609741199743-341cf4ee3d02?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=564&q=80";
    } else if (ParsingHtmlHelperTool.parseHtmlString(productCategoryListProvider
        .productsSubCategoriesOneRelevance.topCategoryName)
        .startsWith("${nav2ParentIds[6].categoryName}")) {
      imageUrl =
          "https://images.unsplash.com/photo-1509281373149-e957c6296406?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=738&q=80";
    } else if (ParsingHtmlHelperTool.parseHtmlString(productCategoryListProvider
        .productsSubCategoriesOneRelevance.topCategoryName)
        .startsWith("${nav2ParentIds[7].categoryName}")) {
      imageUrl =
          "https://images.unsplash.com/photo-1612599542558-f3022089fb38?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1351&q=80";
    }
    return DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: NetworkImage(
            imageUrl,
          ),
        ),
      ),
      child: Stack(
        children: <Widget>[
          Positioned(
              bottom: 12.0,
              left: 16.0,
              child: Text(
                  ParsingHtmlHelperTool.parseHtmlString(
                      productCategoryListProvider
                          .productsSubCategoriesOneRelevance.topCategoryName),
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500))),
        ],
      ),
    );
  }

  Widget _createDrawerItem(
      {required IconData icon,
      required List<SubMenu> subMenus,
      required String topMenuName,
      required GestureTapCallback onTap,
      required BuildContext context}) {
    return ExpansionTile(
      iconColor: Colors.black,
      textColor: Colors.black,
      title: Row(
        children: [
          Icon(icon),
          Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Text(
              topMenuName,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
      children: subMenus.map((subMenu) {
        return Column(
          children: [
            ListTile(
              title: Text(
                  ParsingHtmlHelperTool.parseHtmlString(subMenu.subMenuName)),
              onTap: () async {
                Navigator.of(context).pop();

                TheTopCategoryRelevance topCategoryRelevance =
                    await ListProductNetworkHelper.getListProductNetwork(
                  subMenu.subMenuId,
                  context,
                  ParsingHtmlHelperTool.parseHtmlString(
                    subMenu.subMenuName,
                  ),
                );

                productCategoryListProvider
                    .addTopCategoryRelevance(topCategoryRelevance);
                Navigator.of(context)
                    .pushNamed(RouteGenerator.secondNavCategories);
              },
            ),
            Divider(
              color: Colors.grey,
              thickness: 0.3,
            ),
          ],
        );
      }).toList(),
    );
  }
}
