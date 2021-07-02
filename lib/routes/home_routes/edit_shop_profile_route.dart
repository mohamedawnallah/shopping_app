import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

import 'package:shop_app/models/shop_seller_model/user_model.dart';
import 'package:shop_app/view_models/blocs/all_blocs.dart';
import 'package:shop_app/view_models/provider/all_providers.dart';
import 'package:shop_app/widgets/shop_profile_reusable_widgets/profile_widget.dart';

import 'category_items_route.dart';

class EditShopProfileRoute extends StatefulWidget {
  final ShopProfileProvider shopProfileProvider;
  final bool isDarkMode;
   ThemeBloc? themeBloc;
   EditShopProfileRoute(
      {required this.shopProfileProvider,
      required this.isDarkMode,
       this.themeBloc});
  @override
  _EditShopProfileRouteState createState() => _EditShopProfileRouteState();
}

class _EditShopProfileRouteState extends State<EditShopProfileRoute> {
  TextEditingController? fullNameController;
  TextEditingController? emailController;
  TextEditingController? locationController;
  TextEditingController? aboutController;
  final formKey = GlobalKey<FormState>();
  File? _image = File("");
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fullNameController = TextEditingController();
    emailController = TextEditingController();
    locationController = TextEditingController();
    aboutController = TextEditingController();
    if (widget.shopProfileProvider.shopProfile != null) {
      fullNameController!.text = widget.shopProfileProvider.shopProfile!.name;
      emailController!.text = widget.shopProfileProvider.shopProfile!.email;
      locationController!.text =
          widget.shopProfileProvider.shopProfile!.location;
      aboutController!.text = widget.shopProfileProvider.shopProfile!.about;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    fullNameController!.dispose();
    emailController!.dispose();
    locationController!.dispose();
    aboutController!.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: widget.isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            icon:kIsWeb?Icon(
      CupertinoIcons.moon_stars,
        color: Colors.black,
      ):  widget.isDarkMode
                ? Icon(Icons.light_mode)
                : Icon(
                    CupertinoIcons.moon_stars,
                    color: Colors.black,
                  ),
            onPressed: () {
              //Is Clicked =true
              if( !kIsWeb){
                if (!widget.isDarkMode) {
                  widget.themeBloc!.add(DarkTheme());
                } else {
                  widget.themeBloc!.add(LightTheme());
                }
              }

            },
          ),
        ],
      ),
      body: Form(
        key: formKey,
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: <Widget>[
            ProfileWidget(
              imagePath: widget.shopProfileProvider.shopProfile!.imagePath,
              openImagePicker: getImage,
              isEditUserProfileOpened: true,
              fileImage: widget.shopProfileProvider.shopProfile != null &&
                      _image!.path.isEmpty &&
                      !widget.shopProfileProvider.shopProfile!.imagePath
                          .contains("http")
                  ? File(widget.shopProfileProvider.shopProfile!.imagePath)
                  : File(_image!.path),
            ),
            SizedBox(
              height: 40,
            ),
//Full Name
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 25),
              child: TextFormField(
                controller: fullNameController,
                validator: (fullName) {
                  if (fullName!.isEmpty) {
                    return "FullName is Empty";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  labelText: "Full Name",
                  labelStyle: TextStyle(
                      color:!kIsWeb && kIsWeb?Colors.white: widget.isDarkMode ? Colors.white : Colors.black),
                ),
              ),
            ),
//Email
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 25),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                validator: (email) {
                  if (email!.isEmpty || !email.contains("@")) {
                    return "Email is not valid";
                  } else {
                    return null;
                  }
                },
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: InputBorder.none,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  labelStyle: TextStyle(
                      color: kIsWeb?Colors.white:widget.isDarkMode ? Colors.white : Colors.black),
                ),
              ),
            ),
//Location
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 25),
              child: TextFormField(
                validator: (location) {
                  if (location!.isEmpty) {
                    return "Location is Empty";
                  } else {
                    return null;
                  }
                },
                controller: locationController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  labelText: "Location",
                  labelStyle: TextStyle(
                      color:kIsWeb?Colors.white: widget.isDarkMode ? Colors.white : Colors.black),
                ),
              ),
            ),
//About
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                validator: (about) {
                  if (about!.isNotEmpty) {
                    return null;
                  } else {
                    return "About is empty";
                  }
                },
                controller: aboutController,
                decoration: InputDecoration(
                  contentPadding: new EdgeInsets.symmetric(
                      vertical: 25.0, horizontal: 10.0),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  labelText: "About",
                  labelStyle: TextStyle(
                      color:kIsWeb?Colors.white: widget.isDarkMode ? Colors.white : Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                if (formKey.currentState!.validate()) {
                  print("All Form Fields Are Validated");
                  print(fullNameController!.text);
                  print(emailController!.text);
                  print(aboutController!.text);
                  print(locationController!.text);

                  widget.shopProfileProvider.addShopProfile(
                    User(
                      name: fullNameController!.text,
                      email: emailController!.text,
                      about: aboutController!.text,
                      imagePath: _image!.path.isEmpty
                          ? widget.shopProfileProvider.shopProfile!.imagePath
                          : _image!.path,
                      location: locationController!.text,
                    ),
                  );
                  Navigator.of(context).pop();
                }
              },
              child: Container(
                width: 60,
                height: 60,
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Color(0xff4FA3EA),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "Save",
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
