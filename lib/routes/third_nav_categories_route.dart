import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/constants/constants.dart';
import 'package:shop_app/models/statemangement/provider/top_menu_category_provider.dart';
import 'package:shop_app/utils/parsing_html_helper_tool.dart';
import 'package:shop_app/widgets/widgets.dart';

import '../route_generator.dart';

class ThirdNavCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Provider.of<TopMenuCategoryProvider>(context)
                    .thirdNavCategories
                    .length !=
                0
            ? Text(
                ParsingHtmlHelperTool.parseHtmlString(
                  Provider.of<TopMenuCategoryProvider>(context)
                      .thirdNavCategories[0]
                      .parentMenuLabel,
                ),
              )
            : Text("There're no subcategory"),
        centerTitle: true,
      ),
      body: Consumer<TopMenuCategoryProvider>(
        builder: (context, value, child) {
          print(value.thirdNavCategories);
          if (value.thirdNavCategories.length != 0) {
            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: value.thirdNavCategories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    for (int i = 0; i < nav4ParentIds.length; i++) {
                      if (nav4ParentIds[i].categoryName ==
                          value.thirdNavCategories[index].childMenuLabel) {
                        print(nav4ParentIds[i].categoryName);
                        print(value.thirdNavCategories[index].childMenuLabel);
                        value.fourthNavCategories.clear();
                        value.addFourthNavCategories(
                          topCategoryModelList: value.categories,
                          parentId: nav4ParentIds[i].parentId,
                        );
                        Navigator.of(context)
                            .pushNamed(RouteGenerator.fourthNavCategories);
                        break;
                      }
                    }
                  },
                  child: AllCategoriesWidget(
                    imageUrl:
                        "https://images.unsplash.com/photo-1603400521630-9f2de124b33b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80",
                    categoryName: ParsingHtmlHelperTool.parseHtmlString(
                      value.thirdNavCategories[index].childMenuLabel,
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Text("There is No Data found"),
            );
          }
        },
      ),
    );
  }
}
