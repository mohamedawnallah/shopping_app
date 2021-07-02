import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/route_generator.dart';
import 'package:shop_app/routes/all_routes.dart';


import 'config/palette.dart';
import 'package:shop_app/view_models/provider/all_providers.dart';
import './view_models/blocs/all_blocs.dart';

void main() async {
  ErrorWidget.builder = (FlutterErrorDetails details) => Center(
        child: Container(color: Colors.white),
      );

  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb) {
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
        ChangeNotifierProvider<ReviewPaymentProvider>(
          create: (_) => ReviewPaymentProvider(),
        ),
        if (!kIsWeb)
          BlocProvider(
            create: (_) => ThemeBloc(),
          )
      ],
      child: MaterialApp(
        title: 'Shop Flutter App',
        theme: ThemeData(
          accentIconTheme: IconThemeData(color: Colors.black),
          appBarTheme: const AppBarTheme(backgroundColor: Palette.background),
          scaffoldBackgroundColor: Palette.background,
          primaryColor: Colors.white,
          accentColor: Palette.categoryItemsBackground,
          fontFamily: GoogleFonts.almendra().fontFamily,
          iconTheme: const IconThemeData(color: Colors.black),
        ),
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(),
        onGenerateRoute: RouteGenerator.generateRoute,
      ),
    );
  }
}
