import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/statemangement/provider/category_items_provider.dart';
import 'package:shop_app/models/statemangement/provider/home_page_provider.dart';
import 'package:shop_app/models/statemangement/provider/index_btm_navigation_saver_provider.dart';
import 'package:shop_app/models/statemangement/provider/top_menu_category_provider.dart';
import 'package:shop_app/route_generator.dart';
import 'package:shop_app/routes/cart_route.dart';
import 'package:shop_app/routes/favorites_route.dart';
import 'package:shop_app/routes/home_route.dart';
import 'package:shop_app/routes/purchases_route.dart';
import 'package:shop_app/services/top_menu_categories_network_helper/dart/network_helper_models/item_route_network_helper_model.dart';

import 'config/palette.dart';
import 'models/statemangement/blocs/theme_bloc.dart';
import 'models/statemangement/provider/dark_mode_saver_provider.dart';
import 'models/statemangement/provider/item_product_provider.dart';
import 'models/statemangement/provider/product_categrory_list_provider.dart';
import 'models/statemangement/provider/purchases_items_product_model_provider.dart';
import 'models/statemangement/provider/shop_profile_provider.dart';
import 'package:flutter/foundation.dart'show kIsWeb;
void main()async {
  // ErrorWidget.builder = (FlutterErrorDetails details) => Center(
  //       child: CircularProgressIndicator(),
  //     );

  WidgetsFlutterBinding.ensureInitialized();
  if(!kIsWeb){
    HydratedBloc.storage = await HydratedStorage.build(
        storageDirectory: await getApplicationDocumentsDirectory());
  }

  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<TopMenuCategoryProvider>(
          create: (_) => TopMenuCategoryProvider(),
        ),
        ChangeNotifierProvider<HomePageProvider>(
          create: (_) => HomePageProvider(),
        ),
        ChangeNotifierProvider<CategoryItemsProvider>(
          create: (_) => CategoryItemsProvider(),
        ),
        ChangeNotifierProvider<ItemProductProvider>(
          create: (_) => ItemProductProvider(),
        ),
        ChangeNotifierProvider<ShopProfileProvider>(
          create: (_) => ShopProfileProvider(),
        ),

        ChangeNotifierProvider<IndexBottomNavigationSaver>(
          create: (_) => IndexBottomNavigationSaver(),
        ),

        ChangeNotifierProvider<ProductCategoryListProvider>(
          create: (_) => ProductCategoryListProvider(),
        ),
        ChangeNotifierProvider<CartProductItemsProductModelProvider>(
          create: (_) => CartProductItemsProductModelProvider(),
        ),

        ChangeNotifierProvider<DarkModeSaverProvider>(
          create: (_) => DarkModeSaverProvider(),
        ),
        if(!kIsWeb)
          BlocProvider(
          create: (_) => ThemeBloc(),
        )
      ],
      child: MaterialApp(
          title: 'Shop Flutter App',
          theme: ThemeData(
            appBarTheme: const AppBarTheme(backgroundColor: Palette.background),
            scaffoldBackgroundColor: Palette.background,
            primaryColor: Colors.white,
            accentColor: Palette.categoryItemsBackground,
            fontFamily: "Roboto-Regular",

            iconTheme: const IconThemeData(color: Colors.black),
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: RouteGenerator.animatedSplashRoute,
          onGenerateRoute: RouteGenerator.generateRoute,
        ),

    );
  }
}
