import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/statemangement/provider/top_menu_category_provider.dart';
import 'package:shop_app/utils/parsing_html_helper_tool.dart';
import 'package:shop_app/widgets/widgets.dart';

class FourthNavCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Provider.of<TopMenuCategoryProvider>(context)
                    .fourthNavCategories
                    .length !=
                0
            ? Text(
                ParsingHtmlHelperTool.parseHtmlString(
                  Provider.of<TopMenuCategoryProvider>(context)
                      .fourthNavCategories[0]
                      .parentMenuLabel,
                ),
              )
            : Text("There're no subcategory"),
        centerTitle: true,
      ),
      body: Consumer<TopMenuCategoryProvider>(
        builder: (context, value, child) {
          print(value.fourthNavCategories);
          if (value.fourthNavCategories.length != 0) {
            return GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: value.fourthNavCategories.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: AllCategoriesWidget(
                      imageUrl:
                          "https://images.unsplash.com/photo-1603400521630-9f2de124b33b?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80",
                      categoryName: ParsingHtmlHelperTool.parseHtmlString(value
                          .firstNavCategories[index].childMenuLabel)
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
