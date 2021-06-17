import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/constants/user_preferences.dart';
import 'package:shop_app/models/statemangement/blocs/theme_bloc.dart';
import 'package:shop_app/models/statemangement/blocs/theme_bloc_events.dart';
import 'package:shop_app/models/statemangement/provider/dark_mode_saver_provider.dart';
import 'package:shop_app/models/statemangement/provider/shop_profile_provider.dart';
import 'package:shop_app/models/user_model.dart';
import 'package:shop_app/widgets/shop_profile_reusable_widgets/button_widget.dart';
import 'package:shop_app/widgets/shop_profile_reusable_widgets/numbers_widget.dart';
import 'package:shop_app/widgets/shop_profile_reusable_widgets/profile_widget.dart';

import '../route_generator.dart';
import 'edit_shop_profile_route.dart';

class ProfilePage extends StatefulWidget {
const  ProfilePage();
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final themeBloc;
  @override
  Widget build(BuildContext context) {
    if(!kIsWeb){
       themeBloc = BlocProvider.of<ThemeBloc>(context);

    }
    final user = UserPreferences.myUser;
    return !kIsWeb ? BlocBuilder<ThemeBloc, ThemeData>(
        builder: (BuildContext context, theme) {
          WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
            Provider.of<DarkModeSaverProvider>(context, listen: false)
                .setIsDarkMode(theme == ThemeData.dark());
          });
          return
            MaterialApp(
              theme: theme,
              debugShowCheckedModeBanner: false,
              home: Consumer<ShopProfileProvider>(
                  builder: (BuildContext context, shopProfile, Widget? child) {
                    return Consumer<DarkModeSaverProvider>(
                      builder: (BuildContext context, darkMode, Widget? child) {
                        return BlocListener<ThemeBloc, ThemeData>(
                          listener: (context, state) {
                            darkMode.setIsDarkMode(state == ThemeData.dark());
                          },
                          child: Scaffold(
                            appBar: AppBar(
                              automaticallyImplyLeading: false,

                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              actions: [
                             !kIsWeb?   IconButton(
                                  icon: darkMode.isDarkMode
                                      ? Icon(Icons.light_mode)
                                      : Icon(
                                    CupertinoIcons.moon_stars,
                                    color: Colors.black,
                                  ),
                                  onPressed: () {
                                    //Is Clicked =true
                                    if (!darkMode.isDarkMode) {
                                      themeBloc.add(DarkTheme());
                                    } else {
                                      themeBloc.add(LightTheme());
                                    }
                                  },
                                ):Icon(Icons.add),
                              ],
                            ),
                            body: Consumer<ShopProfileProvider>(
                              builder: (BuildContext context, shopProfile,
                                  Widget? child) {
                                void onImageClicked() {
                                  //TODO EditShopProfile Naming Generation in RouteGeneration.dart
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (_) =>
                                          EditShopProfileRoute(
                                            shopProfileProvider: shopProfile,
                                            isDarkMode: darkMode.isDarkMode,
                                            themeBloc: themeBloc,
                                          ),
                                    ),
                                  );
                                }

                                return ListView(
                                  physics: BouncingScrollPhysics(),
                                  children: [
                                    ProfileWidget(
                                      imagePath: shopProfile.shopProfile!
                                          .imagePath,
                                      onClicked: onImageClicked,
                                      isEditUserProfileOpened: false,
                                      openImagePicker: onImageClicked,
                                      fileImage: File(
                                          shopProfile.shopProfile != null &&
                                              !shopProfile.shopProfile!
                                                  .imagePath.contains("http")
                                              ? shopProfile.shopProfile!
                                              .imagePath
                                              : ""),
                                    ),
                                    const SizedBox(height: 24),
                                    buildName(user, shopProfile),
                                    const SizedBox(height: 24),
                                    Center(child: buildUpgradeButton()),
                                    const SizedBox(height: 24),
                                    NumbersWidget(),
                                    const SizedBox(height: 48),
                                    buildAbout(user, shopProfile),
                                  ],
                                );
                              },
                            ),
                          ),
                        );
                      },
                    );
                  }

              ),
            );

        }
    ) :
  MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.dark,
    ),
    home: Consumer<ShopProfileProvider>(
            builder: (BuildContext context, shopProfile, Widget? child) {
              return
                Scaffold(
                    appBar: AppBar(
                      automaticallyImplyLeading: false,

                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      actions: [
                        IconButton(
                          icon:
                              Icon(
                            CupertinoIcons.moon_stars,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            //Is Clicked =true
                            // if (!darkMode.isDarkMode) {
                            //   themeBloc.add(DarkTheme());
                            // } else {
                            //   themeBloc.add(LightTheme());
                            // }
                          },
                        ),
                      ],
                    ),
                    body: Consumer<ShopProfileProvider>(
                      builder: (BuildContext context, shopProfile,
                          Widget? child) {
                        void onImageClicked() {
                          //TODO EditShopProfile Naming Generation in RouteGeneration.dart
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) =>
                                  EditShopProfileRoute(
                                    shopProfileProvider: shopProfile,
                                    isDarkMode: false,

                                  ),
                            ),
                          );
                        }

                        return ListView(
                          physics: BouncingScrollPhysics(),
                          children: [
                            ProfileWidget(
                              imagePath: shopProfile.shopProfile!
                                  .imagePath,
                              onClicked: onImageClicked,
                              isEditUserProfileOpened: false,
                              openImagePicker: onImageClicked,
                              fileImage: File(
                                  shopProfile.shopProfile != null &&
                                      !shopProfile.shopProfile!.imagePath
                                          .contains("http")
                                      ? shopProfile.shopProfile!.imagePath
                                      : ""),
                            ),
                            const SizedBox(height: 24),
                            buildName(user, shopProfile),
                            const SizedBox(height: 24),
                            Center(child: buildUpgradeButton()),
                            const SizedBox(height: 24),
                            NumbersWidget(),
                            const SizedBox(height: 48),
                            buildAbout(user, shopProfile),
                          ],
                        );
                      },
                    ),
                  );


            }

        ),
  );

  }

  Widget buildName(User user, ShopProfileProvider shopProfileProvider) =>
      Column(
        children: [
          Text(
            shopProfileProvider.shopProfile != null
                ? shopProfileProvider.shopProfile!.name
                : "User Name",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          const SizedBox(height: 4),
          Text(
            shopProfileProvider.shopProfile != null
                ? shopProfileProvider.shopProfile!.email
                : "email@gmail.com",
            style: TextStyle(color: Colors.grey),
          )
        ],
      );

  Widget buildUpgradeButton() => ButtonWidget(
        text: 'Upgrade To PRO',
        onClicked: () {
          print("Upgrade To PRO");
        },
      );

  Widget buildAbout(User user, ShopProfileProvider shopProfile) => Container(
        padding: EdgeInsets.symmetric(horizontal: 48),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'About',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              shopProfile.shopProfile != null
                  ? shopProfile.shopProfile!.about
                  : "about",
              style: TextStyle(fontSize: 16, height: 1.4),
            ),
          ],
        ),
      );

}

