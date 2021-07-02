import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/view_models/provider/all_providers.dart';

import 'user_profile_routes/account_route.dart';
import 'cart_routes/cart_route.dart';
import 'favorite_routes/favorites_route.dart';
import 'home_routes/home_route.dart';
class ItemsBottomNavigation extends StatelessWidget {
  static const List<Widget> _pages = <Widget>[
    HomeRoute(),
    FavoritesRoute(appBarTitle: "Your Favorites"),
    Account(),
    CartRoute(appBarTitle: "Cart"),

  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<IndexBottomNavigationSaver>(
      builder: (BuildContext context, value, Widget? child) {
        return Scaffold(
          key: Key("First_value"),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.black,
            currentIndex: value.index,
            selectedItemColor: Colors.black,
            showUnselectedLabels: true,
            onTap: (index) {
              value.setIndex(index);
            },
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: value.index == 0 ? Color(0xffF9A075) : Colors.black,
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.favorite,
                  color: value.index == 1 ? Color(0xffF9A075) : Colors.black,
                ),
                label: "Favorites",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle,
                  color: value.index == 2 ? Color(0xffF9A075) : Colors.black,
                ),
                label: "Account",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.shopping_cart,
                  color: value.index == 3 ? Color(0xffF9A075) : Colors.black,
                ),
                label: "Cart",
              ),

            ],
          ),
          body: _pages[value.index],
        );
      },
    );
  }
}