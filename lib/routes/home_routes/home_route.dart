
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shop_app/config/palette.dart';
import 'package:shop_app/config/constants.dart';
import 'dart:convert';

import 'package:shop_app/route_generator.dart';
import 'package:shop_app/services/network_helpers_request/list_product_network_helper.dart';
import 'package:shop_app/widgets/home_reusable_widgets/bg_items_occausions.dart';
import 'package:shop_app/services/all_services.dart';
import 'package:shop_app/services/network_helpers_request/home_route_network_helper.dart';
import 'package:shop_app/services/network_helpers_request/top_menu_categories_network_helper.dart';
import 'package:shop_app/utils/parsing_html_helper_tool.dart';
import 'package:shop_app/view_models/provider/all_providers.dart';
import 'package:shop_app/widgets/home_reusable_widgets/black_see_more_button.dart';
import 'package:shop_app/widgets/home_reusable_widgets/horizontal_list_view_items.dart';
import 'package:shop_app/widgets/home_reusable_widgets/info_widget.dart';
import 'package:shop_app/widgets/home_reusable_widgets/main_home_item_container.dart';
import 'package:shop_app/widgets/home_reusable_widgets/orange_see_more_btn.dart';
import 'package:shop_app/widgets/all_widgets.dart';

import 'category_items_route.dart';

class HomeRoute extends StatefulWidget {
  const HomeRoute();

  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  Future<List<TopCategoryModel>>? topCategoriesFuture;
  Future<List<HomePageModel>>? homePageFuture;

  Future<List<TopCategoryModel>> getCategories(context) async {
    List<TopCategoryModel> listOfTopCategoryModel =
        await TopMenuCategoriesNetworkHelper.getTopCategories(context);
    return listOfTopCategoryModel;
  }

  Future<List<HomePageModel>> getHomePage(context) async {
    List<HomePageModel> listOfHomePage =
        await HomeRouteNetworkHelper.getHomePage(context);
    return listOfHomePage;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    // categories = getCategories(context);
    // homePage=getHomePage(context);
    topCategoriesFuture = getCategories(context);
    homePageFuture = getHomePage(context);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Consumer<CategoryItemsProvider>(
          builder: (context, homePageProvider, child) {
        return Consumer<HomePageProvider>(
            builder: (context, homePageProvider, child) {
          return Consumer<TopMenuCategoryProvider>(
            builder: (context, topMenuCategoryProvider, child) {
              return Consumer<ProductCategoryListProvider>(
                  builder: (context, productCategoryListProvider, child) {
                return FutureBuilder<List<TopCategoryModel>>(
                  future: topCategoriesFuture,
                  builder: (context, topCategoriesSnapshot) {
                    if (topCategoriesSnapshot.hasData) {
                      return FutureBuilder<List<HomePageModel>>(
                          future: homePageFuture,
                          builder: (context, homePageProductsSnapshot) {
                            if (homePageProductsSnapshot.hasData) {
                              return ListView(
                                children: <Widget>[
                                  Container(
                                    height: 50,
                                    margin: const EdgeInsets.all(5.0),
                                    child: Material(
                                      elevation: 10.0,
                                      shadowColor: Color(0xffE4E5E4),
                                      child: TextFormField(
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: "Search for anything",
                                          hintStyle: TextStyle(
                                            fontFamily: "GraphikThin",
                                            color:Colors.black,
                                          ),

                                          prefixIcon: Container(
                                            child: const Icon(
                                              Icons.search,
                                              color: Colors.black,
                                            ),
                                          ),
                                          suffixIcon: IconButton(
                                            onPressed: () async {
                                              //TODO Functionality of Mic Icon Button
                                              print("Mic Is Clicked");
                                              // await HomeRouteNetworkHelper.getHomePage(context);
                                            },
                                            icon: const Icon(
                                              Icons.mic,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  
                                  Container(
                                    height:!kIsWeb? 200:250,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 8,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () async {
                                          
                                            TheTopCategoryRelevance
                                                topCategoryRelevance =
                                                await ListProductNetworkHelper
                                                    .getListProductNetwork(
                                                        topMenuCategoryProvider
                                                            .firstNavCategories[
                                                                index]
                                                            .childId,
                                                        context,
                                                        topMenuCategoryProvider
                                                            .firstNavCategories[
                                                                index]
                                                            .childMenuLabel);

                                            productCategoryListProvider
                                                .addTopCategoryRelevance(
                                                    topCategoryRelevance);

                                            Navigator.of(context).pushNamed(
                                                RouteGenerator
                                                    .secondNavCategories);
                                          },
                                          child: AllCategoriesWidget(
                                              imageUrl:
                                                  imagesFirstNavCategories[
                                                      index],
                                              categoryName: ParsingHtmlHelperTool
                                                  .parseHtmlString(
                                                      topMenuCategoryProvider
                                                          .firstNavCategories[
                                                              index]
                                                          .childMenuLabel)),
                                        );
                                      },
                                    ),
                                  ),
                                  InfoWidget(),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  ...getHomeWidgets(homePageProvider),
                                ],
                              );
                            } else {
                              return Center(
                                child: SpinKitPouringHourglass(
                                  color: Colors.red,
                                ),
                              );
                            }
                          });
                    } else {
                      return Center(
                        child: SpinKitPouringHourglass(
                          color: Colors.red,
                        ),
                      );
                    }
                  },
                );
              });
            },
          );
        });
      }),
    );
  }

  getHomeWidgets(HomePageProvider homePageProvider) {
    return [
      Container(
        height:!kIsWeb? 320:360,
        child: BgItemsOccasion(
          imageUrlBackground:
              "https://images.unsplash.com/photo-1483232539664-d89822fb5d3e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80",
          topTag: homePageProvider.itemsHandPickedByOurEditors!.topTag,
          topLabel: homePageProvider.itemsHandPickedByOurEditors!.toplabel,
          labelDesc: homePageProvider.itemsHandPickedByOurEditors!.labelDesc,
          items: homePageProvider.itemsHandPickedByOurEditors!.subs[0].products,

        ),
      ),
      ...getHorizontalListViewModel(homePageProvider).map((e) {
        return HorizontalListViewItems(
          topLabel: e.topLabel,
          labelDesc: e.labelDesc,
          items: e.items,

        );
      }),
    ];
  }

  List<HorizontalListViewModel> getHorizontalListViewModel(
      HomePageProvider homePageProvider) {
    List<HorizontalListViewModel> listHorizontalListViewModel = [
      HorizontalListViewModel(
        topLabel: homePageProvider.inspirationMessagesHomePageModel!.toplabel,
        labelDesc: homePageProvider.inspirationMessagesHomePageModel!.labelDesc,
        items:
            homePageProvider.inspirationMessagesHomePageModel!.subs[0].products,

      ),
      HorizontalListViewModel(
          topLabel: homePageProvider.modernPetsHomePageModel!.toplabel,
          labelDesc: homePageProvider.modernPetsHomePageModel!.labelDesc,
          items: homePageProvider.modernPetsHomePageModel!.subs[0].products,
      ),
      HorizontalListViewModel(
          topLabel: homePageProvider.cozyUpHomePageModel!.toplabel,
          labelDesc: homePageProvider.cozyUpHomePageModel!.labelDesc,
          items: homePageProvider.cozyUpHomePageModel!.subs[0].products,
      ),
      HorizontalListViewModel(
          topLabel: homePageProvider.transitionStyleHomePageModel!.toplabel,
          labelDesc: homePageProvider.transitionStyleHomePageModel!.labelDesc,
          items:
              homePageProvider.transitionStyleHomePageModel!.subs[0].products,
      ),

      HorizontalListViewModel(
          topLabel: homePageProvider.houseWarmingGiftsHomePageModel!.toplabel,
          labelDesc: homePageProvider.houseWarmingGiftsHomePageModel!.labelDesc,
          items: homePageProvider.houseWarmingGiftsHomePageModel!.subs[0].products,
      ),
    ];
    return listHorizontalListViewModel;
  }
}

List<String> imagesFirstNavCategories = [
  //Art
  "https://images.unsplash.com/photo-1579783902614-a3fb3927b6a5?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=766&q=80",
  "https://images.unsplash.com/photo-1544441893-675973e31985?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80",
  "https://images.unsplash.com/photo-1516783154360-123b392d0833?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1489&q=80",
  "https://images.unsplash.com/photo-1616627451515-cbc80e5ece35?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80",
  "https://images.unsplash.com/photo-1599643478518-a784e5dc4c8f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80",
  "https://images.unsplash.com/photo-1609741199743-341cf4ee3d02?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=564&q=80",
  "https://images.unsplash.com/photo-1509281373149-e957c6296406?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=738&q=80",
  "https://images.unsplash.com/photo-1612599542558-f3022089fb38?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1351&q=80",
];

class HorizontalListViewModel {
  final String topLabel;
  final String labelDesc;
  final List<Product> items;

  const HorizontalListViewModel(
      {required this.topLabel, required this.labelDesc, required this.items});
}
