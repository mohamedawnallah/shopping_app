import 'package:flutter/material.dart';
import 'package:shop_app/constants/constants.dart';
import 'package:shop_app/enums/categories.dart';
import 'package:shop_app/main.dart';
import 'package:shop_app/routes/animated_splash_route.dart';
import 'package:shop_app/routes/fourth_nav_route.dart';
import 'package:shop_app/routes/items_btm_navigation_route.dart';
import 'package:shop_app/routes/routes.dart';
import 'package:shop_app/routes/third_nav_categories_route.dart';

class RouteGenerator {
  static const String homeRoute = "/";


  static const String categoryItemsSubs = "/category_items_subs";

  static const String itemRoute = "/item_route";

  static const String userProfileRoute = "/user_profile_route";

  static const String itemsBottomNavigationBar = "/items_bottom_navigation_bar";

  static const String purchasesRoute = "/purchases_route";

  static const String animatedSplashRoute = "/animated_splash_route";

  static const String cartRoute = "/cart_route";

  static const String checkOutRoute = "/check_out_route";

  static const String favoritesRoute = "/favorites_route";

  static const String secondNavCategories = "/second_nav_categories_route";

  static const String thirdNavCategories = "/third_nav_categories_route";

  static const String fourthNavCategories = "/fourth_nav_categories_route";

  static Route<dynamic> generateRoute(RouteSettings? settings) {
    switch (settings!.name) {
      case homeRoute:
        return MaterialPageRoute(
          builder: (_) => HomeRoute(),
        );

      case categoryItemsSubs:
        return MaterialPageRoute(
          builder: (_) => CategoryItemsRoute(),
        );
      case purchasesRoute:
        return MaterialPageRoute(
          builder: (_) => UserPurchasesRoute(
            appBarTitle: "Checkout",
          ),
        );
      case cartRoute:
        return MaterialPageRoute(
          builder: (_) => CartRoute(
            appBarTitle: "Cart",
          ),
        );
      case checkOutRoute:
        return MaterialPageRoute(
          builder: (_) => CheckOutRoute(appBarTitle: "Checkout"),
        );

      case favoritesRoute:
        return MaterialPageRoute(
          builder: (_) => FavoritesRoute(appBarTitle: "My Favorites"),
        );
      case itemRoute:
        return MaterialPageRoute(
          builder: (_) => ItemRoute(),
        );
      case userProfileRoute:
        return MaterialPageRoute(
            builder: (_) => ProfilePage());
      case itemsBottomNavigationBar:
        return MaterialPageRoute(builder: (_) => ItemsBottomNavigation());
      case secondNavCategories:
        return MaterialPageRoute(builder: (_) => SecondNavCategoriesRoute());
      case thirdNavCategories:
        return MaterialPageRoute(builder: (_) => ThirdNavCategories());
      case fourthNavCategories:
        return MaterialPageRoute(builder: (_) => FourthNavCategories());

      case animatedSplashRoute:
        return MaterialPageRoute(builder: (_) => AnimatedSplashScreen());

      default:
        throw FormatException("Route Not Found");
    }
  }
}
