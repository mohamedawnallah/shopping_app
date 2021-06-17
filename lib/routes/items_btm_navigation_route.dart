import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/statemangement/provider/index_btm_navigation_saver_provider.dart';

import 'cart_route.dart';
import 'favorites_route.dart';
import 'home_route.dart';
class ItemsBottomNavigation extends StatelessWidget {
  static const List<Widget> _pages = <Widget>[
    HomeRoute(),
    FavoritesRoute(appBarTitle: "Your Favorites"),
    CartRoute(appBarTitle: "Your Purchases"),
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
                  Icons.shopping_cart,
                  color: value.index == 2 ? Color(0xffF9A075) : Colors.black,
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