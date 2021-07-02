import 'package:flutter/material.dart';
import 'package:shop_app/config/constants.dart';
import 'package:shop_app/main.dart';
import 'package:shop_app/routes/splash_route/animated_splash_route.dart';
import 'package:shop_app/routes/items_btm_navigation_route.dart';
import 'package:shop_app/routes/cart_routes/review_payment_route.dart';
import 'package:shop_app/routes/all_routes.dart';

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

  static const String reviewPaymentRoute = "/review_payment_route";


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

      case animatedSplashRoute:
        return MaterialPageRoute(builder: (_) => AnimatedSplashScreen());
      case reviewPaymentRoute:
        return MaterialPageRoute(builder: (_) => ReviewPaymentRoute());

      default:
        throw FormatException("Route Not Found");
    }
  }
}
