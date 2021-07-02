import 'dart:async';
import 'package:better_player/better_player.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mailto/mailto.dart';
import 'package:provider/provider.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:shop_app/config/constants.dart';
import 'package:shop_app/models/shop_seller_model/user_model.dart';
import 'package:shop_app/route_generator.dart';
import 'package:shop_app/utils/parsing_html_helper_tool.dart';
import 'package:shop_app/view_models/provider/all_providers.dart';
import 'package:url_launcher/url_launcher.dart';

import 'category_items_route.dart';

class ItemRoute extends StatefulWidget {
  const ItemRoute();

  @override
  _ItemRouteState createState() => _ItemRouteState();
}

class _ItemRouteState extends State<ItemRoute> {
  String _colorChosenValue = "Colors";
  Map<String, String> selectedValueMap = Map();
  String _numChosenItem = "number";

  int selectedIndex1 = 0, selectedIndex2 = 0;
  PageController pageController = PageController(initialPage: 0);
  MediaQueryData? mediaQueryData;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
 
  
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Timer.periodic(Duration(seconds: 10), (Timer timer) {
      if (currentIndex <
          Provider.of<ItemProductProvider>(context, listen: true)
              .itemProductModel!
              .medias
              .length) {
        currentIndex++;
      } else {
        currentIndex = 0;
      }
      pageController.animateToPage(
        currentIndex,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text(
          ParsingHtmlHelperTool.parseHtmlString(
              Provider.of<ItemProductProvider>(context, listen: true)
                  .itemProductModel!
                  .productName),
          overflow: TextOverflow.ellipsis,
        ),
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              //TODO Share Icon
              print("Share Icon Is Pressed");
            },
            icon: Icon(
              Icons.share,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Consumer<ItemProductProvider>(
        builder: (_, itemProduct, __) {
          List<String>sizeDropListDown=['size',"First Size","Second Size"];

          // for(int index=0;index<sizeDropListDown.length;index++){
          //   sizeDropListDown.add(itemProduct.itemProductModel!.options[index].optionValue.isEmpty?"First Size":itemProduct.itemProductModel!.options[index].optionValue);
          // }

          List<String> colorsDropListDown = [
            'Colors',
            itemProduct.itemProductModel!.primaryColor.isEmpty
                ? "1st Color"
                : itemProduct.itemProductModel!.primaryColor,
            itemProduct.itemProductModel!.secondaryColor.isEmpty
                ? "2nd Color"
                : itemProduct.itemProductModel!.secondaryColor,
          ];
          List<String> numbersDropDownList = [
            'number',
            '1',
            '2',
            '3',
            '4',
            '5',
          ];
          double difference =
              double.parse(itemProduct.itemProductModel!.options[0].price) -
                  double.parse(
                      itemProduct.itemProductModel!.options[0].discountedPrice);
          return Consumer<ShopProfileProvider>(builder: (_, shopProfile, __) {
            return ListView(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: <BoxShadow>[
                      BoxShadow(color: Colors.grey, blurRadius: 3.0),
                    ],
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    //TODO Seller Gmail Needs To Be Added
                                    //TODO Seller About Summary
                                    print("Seller Photo");
                                    print(itemProduct
                                        .itemProductModel!.sellerPhoto);
                                    print("Seller Photo");

                                    shopProfile.addShopProfile(
                                      User(
                                        imagePath: itemProduct
                                                .itemProductModel!.sellerPhoto
                                                .contains("https")
                                            ? itemProduct
                                                .itemProductModel!.sellerPhoto
                                            : "https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80",
                                        name: itemProduct
                                            .itemProductModel!.sellerName,
                                        email: "mohamedmohey2352@gmail.com",
                                        about:
                                            "We're from Georgia.We make hand-made products that are sold over the world we use this app to be specialized at only hand-made ones and the app comes with the new idea we've sold to over 100,000 customers with 99.99 percent of satisfaction",
                                        location: itemProduct
                                            .itemProductModel!.sellerLocation,
                                      ),
                                    );

                                    Navigator.of(context).pushNamed(
                                        RouteGenerator.userProfileRoute);
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: Image.network(
                                          !itemProduct
                                                  .itemProductModel!.sellerPhoto
                                                  .contains("http")
                                              ? "https://homepages.cae.wisc.edu/~ece533/images/arctichare.png"
                                              : itemProduct.itemProductModel!
                                                  .sellerPhoto,
                                          fit: BoxFit.cover,
                                        ).image,
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                      border: Border.all(
                                          color: Colors.black45, width: 2.0),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  height: 50,
                                  margin: const EdgeInsets.only(right: 19.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        height: 15,
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "${itemProduct.itemProductModel!.sellerName}",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: GoogleFonts.almendra()
                                                .fontFamily,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 30,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: <Widget>[
                                            Icon(
                                              Icons.location_on,
                                              color: Colors.black,
                                            ),
                                            Text(
                                              "${itemProduct.itemProductModel!.sellerLocation}",
                                              style: TextStyle(
                                                fontFamily:
                                                    GoogleFonts.almendra()
                                                        .fontFamily,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              height: 50,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  ...List.generate(
                                    5,
                                    (index) => Icon(
                                      Icons.star,
                                      size: 20.0,
                                    ),
                                  ),
                                  Container(
                                    child: Text('(334)'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            height: 350.0,
                            child: PageView.builder(
                              controller: pageController,
                              onPageChanged: (value) {
                                setState(() {
                                  currentIndex = value;
                                });
                              },
                              itemCount:
                                  itemProduct.itemProductModel!.medias.length,
                              itemBuilder: (context, index) {

                                if (itemProduct.itemProductModel!.medias[index]
                                        .mediaType !=
                                    "Image") {
                             
                          
                                  return BetterPlayerListVideoPlayer(
                    BetterPlayerDataSource(BetterPlayerDataSourceType.network,
                       itemProduct.itemProductModel!.medias[index].mediaName),
                    configuration: BetterPlayerConfiguration(
                        autoPlay: true, aspectRatio: 10 / 9),
                    key: Key(itemProduct.itemProductModel!.medias.hashCode.toString()),
                    playFraction: 0.8,
                  );
                                } else {
                                  return Image.network(
                                    itemProduct.itemProductModel!.medias[index]
                                        .mediaName,
                                    width: MediaQuery.of(context).size.width,
                                    fit: BoxFit.cover,
                                  );
                                }
                              },
                            ),
                          ),
                          Positioned(
                            bottom: 16.0,
                            left: 0.0,
                            right: 0.0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                itemProduct.itemProductModel!.medias.length,
                                (index) => AnimatedContainer(
                                  duration: Duration(milliseconds: 400),
                                  height: 8.0,
                                  width: currentIndex == index ? 24.0 : 8.0,
                                  margin: EdgeInsets.only(right: 4.0),
                                  decoration: BoxDecoration(
                                    color: currentIndex == index
                                        ? kPrimaryColor
                                        : kLightColor,
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      // CarouselSlider(
                      //   options: CarouselOptions(
                      //     height: 500.0,
                      //     enlargeCenterPage: true,
                      //     autoPlay: true,
                      //     aspectRatio: 16 / 9,
                      //     autoPlayCurve: Curves.fastOutSlowIn,
                      //     enableInfiniteScroll: true,
                      //     autoPlayAnimationDuration:
                      //         Duration(milliseconds: 800),
                      //     viewportFraction: 0.8,
                      //   ),
                      //   items: [
                      //     ...itemProduct.itemProductModel!.medias.map((e) {
                      //       return Container(
                      //         margin: EdgeInsets.all(6.0),
                      //         decoration: BoxDecoration(
                      //           borderRadius: BorderRadius.circular(8.0),
                      //           image: DecorationImage(
                      //             image: NetworkImage(e.mediaName),
                      //             fit: BoxFit.cover,
                      //           ),
                      //         ),
                      //       );
                      //     }).toList()
                      //   ],
                      // ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  height: 250.0,
                  padding: const EdgeInsets.all(15.0),
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: <BoxShadow>[
                      BoxShadow(color: Colors.grey, blurRadius: 3.0),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "${ParsingHtmlHelperTool.parseHtmlString(itemProduct.itemProductModel!.productName)}",
                        style: TextStyle(
                          fontSize: 22.0,
                          fontFamily: GoogleFonts.almendra().fontFamily,
                        ),
                      ),
                      if (itemProduct
                              .itemProductModel!.options[0].discountIndicator ==
                          "Yes")
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text.rich(
                              TextSpan(
                                children: <InlineSpan>[
                                  TextSpan(
                                    text:
                                        "\$${itemProduct.itemProductModel!.options[0].price} ",
                                    style: const TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: Color(0xFF247E34),
                                      fontSize: 28,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        "(${((difference / double.parse(itemProduct.itemProductModel!.options[0].price)) * 100).toStringAsFixed(2)}% off)",
                                    style: const TextStyle(
                                      color: Color(0xFF247E34),
                                      fontSize: 28,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 3.0,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Text(
                                  '\$${itemProduct.itemProductModel!.options[0].discountedPrice}',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 28,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    print("More Vert Icon Is Tapped");
                                  },
                                  child: Icon(
                                    Icons.more_vert,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      if (itemProduct
                              .itemProductModel!.options[0].discountIndicator ==
                          "No")
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "No sale",
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 15.0),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              '\$${itemProduct.itemProductModel!.options[0].price}',
                              style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 28,
                              ),
                            ),
                          ],
                        )
                    ],
                  ),
                ),
                Container(
                  height: 320.0,
                  padding: const EdgeInsets.all(15.0),
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: <BoxShadow>[
                      BoxShadow(color: Colors.grey, blurRadius: 3.0),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        Container(
                          width: 300,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 2),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: getSearchableDropdown(
                              colorsDropListDown, "colors", "Select color"),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Container(
                            width: 300,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 2),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: getSearchableDropdown(
                                sizeDropListDown, "size", "Select Size"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(14.0),
                          child: Container(
                            width: 300,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 2),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            child: getSearchableDropdown(numbersDropDownList,
                                "numbers", "Select number"),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: GestureDetector(
                            onTap: () {
                              Provider.of<CartProductItemsProductModelProvider>(context,listen:false).addTotalPriceCheckedItems(double.parse(itemProduct.itemProductModel!.options[0].price));
                              Navigator.of(context)
                                  .pushNamed(RouteGenerator.purchasesRoute);
                            },
                            child: Container(
                                padding: const EdgeInsets.all(14.0),
                                alignment: Alignment.center,
                                width: 350,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: Colors.black, width: 3),
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: <Widget>[
                                    Icon(
                                      Icons.paid,
                                      color: Colors.black,
                                    ),
                                    Text(
                                      "Buy it now",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ],
                                )),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Builder(builder: (context) {
                            return GestureDetector(
                              onTap: () {
                                print("Add To Cart Button Is Clicked");
                                // Provider.of<PurchasesShopItems>(context,
                                //     listen: false)
                                //     .addToPurchaseShopItem(value.shopItem!);

                                //Index of Cart
                                Provider.of<CartProductItemsProductModelProvider>(
                                        context,
                                        listen: false)
                                    .addItemProductToCart(
                                        itemProduct.itemProductModel!);
                                final snackBar = SnackBar(
                                  content: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text(
                                        "Item added to the Cart",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      Icon(
                                        Icons.check_circle,
                                        color: Colors.green,
                                        size: 30,
                                      ),
                                    ],
                                  ),
                                );
                                Scaffold.of(context).showSnackBar(snackBar);
                              },
                              child: Container(
                                  padding: const EdgeInsets.all(14.0),
                                  alignment: Alignment.center,
                                  width: 350,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    border: Border.all(
                                        color: Colors.black, width: 3),
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: <Widget>[
                                      Icon(
                                        Icons.shopping_cart,
                                        color: Colors.white,
                                      ),
                                      Text(
                                        "Add to cart",
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                    ],
                                  )),
                            );
                          }),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                    margin: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: <BoxShadow>[
                        BoxShadow(color: Colors.grey, blurRadius: 3.0),
                      ],
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ExpansionTile(
                            iconColor: Colors.black,
                            textColor: Colors.black,
                            initiallyExpanded: true,
                            title: Text(
                              "Item Overview",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: GoogleFonts.almendra().fontFamily,
                                  color: Colors.black),
                            ),
                            children: <Widget>[
                              ListTile(
                                title: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                        "• Product Type: ${ParsingHtmlHelperTool.parseHtmlString(itemProduct.itemProductModel!.productType)}"
                                        "\n"
                                        "\n• BestSeller tag: ${ParsingHtmlHelperTool.parseHtmlString(itemProduct.itemProductModel!.bestSellerTag)}"
                                        "\n"
                                        "\n• Gift Wrap Tag:${ParsingHtmlHelperTool.parseHtmlString(itemProduct.itemProductModel!.giftWrapTag)}"
                                        "\n"
                                        "\n• Shipping From: ${ParsingHtmlHelperTool.parseHtmlString(itemProduct.itemProductModel!.shipFrom)}"
                                        "\n"
                                        "\n• Option Label: ${ParsingHtmlHelperTool.parseHtmlString(itemProduct.itemProductModel!.options[0].optionLabel)}"
                                        "\n"
                                        "\n• Option Value: ${ParsingHtmlHelperTool.parseHtmlString(itemProduct.itemProductModel!.options[0].optionValue)}"
                                        "\n"
                                        "\n• Option Tag: ${ParsingHtmlHelperTool.parseHtmlString(itemProduct.itemProductModel!.options[0].optionTag)}"
                                        "\n"
                                        "\n• price: ${ParsingHtmlHelperTool.parseHtmlString(itemProduct.itemProductModel!.options[0].price)}"
                                        "\n"
                                        "\n• Discounted Price: ${ParsingHtmlHelperTool.parseHtmlString(itemProduct.itemProductModel!.options[0].discountedPrice)}"
                                        "\n"
                                        "\n• Discounted Indicator: ${ParsingHtmlHelperTool.parseHtmlString(itemProduct.itemProductModel!.options[0].discountIndicator)}"
                                        "\n"
                                        "\n• Discounted EOD: ${ParsingHtmlHelperTool.parseHtmlString(itemProduct.itemProductModel!.options[0].discountEod)}"
                                        "\n"
                                        "\n• Stock Qty: ${ParsingHtmlHelperTool.parseHtmlString(itemProduct.itemProductModel!.options[0].stockQty)}"
                                        "\n"
                                        "\n• Production Date: ${ParsingHtmlHelperTool.parseHtmlString(itemProduct.itemProductModel!.productionDate)}"
                                        "\n"
                                        "\n• Personalization Note: ${ParsingHtmlHelperTool.parseHtmlString(itemProduct.itemProductModel!.options[0].personalizationNote)}",
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          ExpansionTile(
                            initiallyExpanded: true,
                            iconColor: Colors.black,
                            textColor: Colors.black,
                            title: Text(
                              "Item Details",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: GoogleFonts.almendra().fontFamily,
                                  color: Colors.black),
                            ),
                            children: <Widget>[
                              ListTile(
                                title: Text(
                                  "${ParsingHtmlHelperTool.parseHtmlString(itemProduct.itemProductModel!.productDesc)}",
                                  style: GoogleFonts.almendra()
                                      .copyWith(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                          ExpansionTile(
                            initiallyExpanded: true,
                            iconColor: Colors.black,
                            textColor: Colors.black,
                            title: Text(
                              "Shipping & Policies",
                              style: TextStyle(
                                fontSize: 16.0,
                                fontFamily: GoogleFonts.almendra().fontFamily,
                                fontWeight: FontWeight.w500,
                                color: Colors.black,
                              ),
                            ),
                            children: <Widget>[
                              ListTile(
                                  title: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Text(
                                      "• Local Tax: ${ParsingHtmlHelperTool.parseHtmlString(itemProduct.itemProductModel!.localTax)}"
                                      "\n"
                                      "\n• Shipping From: ${ParsingHtmlHelperTool.parseHtmlString(itemProduct.itemProductModel!.shipFrom)}"
                                      "\n"
                                      "\n• Shipping Cost: ${ParsingHtmlHelperTool.parseHtmlString(itemProduct.itemProductModel!.shippingCost)}"
                                      "\n"
                                      "\n• Schedule: ${ParsingHtmlHelperTool.parseHtmlString(itemProduct.itemProductModel!.schedule)}"
                                      "\n"
                                      "\n• Return Exchange Notes: ${ParsingHtmlHelperTool.parseHtmlString(itemProduct.itemProductModel!.returnExchangeNote)}"
                                      "\n"
                                      "\n• Production Policy: ${ParsingHtmlHelperTool.parseHtmlString(itemProduct.itemProductModel!.productionPolicy)}"
                                      "\n"
                                      "\n• Delivery Policy: ${ParsingHtmlHelperTool.parseHtmlString(itemProduct.itemProductModel!.deliveryPolicy)}"
                                      "\n"
                                      "\n• Shop Policy: ${ParsingHtmlHelperTool.parseHtmlString(itemProduct.itemProductModel!.shopPolicy)}"
                                      "\n"
                                      "\n• Production Partner: ${ParsingHtmlHelperTool.parseHtmlString(itemProduct.itemProductModel!.deliveryPolicy)}",
                                      style: GoogleFonts.almendra().copyWith(
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ))
                            ],
                          ),
                          ExpansionTile(
                            initiallyExpanded: true,
                            iconColor: Colors.black,
                            textColor: Colors.black,
                            title: Text(
                              "Highlights",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: GoogleFonts.almendra().fontFamily,
                                  color: Colors.black),
                            ),
                            children: <Widget>[
                              ListTile(
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    //Frequently Asked Questions
                                    ...itemProduct.itemProductModel!.highlights
                                        .map(
                                          (highlight) => Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text.rich(
                                                  TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: "LabelName ",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      TextSpan(
                                                          text: ParsingHtmlHelperTool
                                                              .parseHtmlString(
                                                                  highlight
                                                                      .labelName)),
                                                    ],
                                                  ),
                                                ),
                                                Text.rich(
                                                  TextSpan(
                                                    children: [
                                                      TextSpan(
                                                        text: "LabelValue ",
                                                        style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                      TextSpan(
                                                          text: ParsingHtmlHelperTool
                                                              .parseHtmlString(
                                                                  highlight
                                                                      .labelValue)),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                        .toList(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          ExpansionTile(
                            initiallyExpanded: true,
                            iconColor: Colors.black,
                            textColor: Colors.black,
                            title: Text(
                              "FAQs",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: GoogleFonts.almendra().fontFamily,
                                  color: Colors.black),
                            ),
                            children: <Widget>[
                              ListTile(
                                title: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    //Frequently Asked Questions
                                    ...itemProduct.itemProductModel!.faq
                                        .map((faq) => Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text.rich(
                                                    TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: "Question ",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        TextSpan(
                                                            text: ParsingHtmlHelperTool
                                                                    .parseHtmlString(
                                                                        faq.question) +
                                                                " ?"),
                                                      ],
                                                    ),
                                                  ),
                                                  Text.rich(
                                                    TextSpan(
                                                      children: [
                                                        TextSpan(
                                                          text: "Answer ",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        TextSpan(
                                                            text: ParsingHtmlHelperTool
                                                                .parseHtmlString(
                                                                    faq.answer)),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ))
                                        .toList(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    )),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Text(
                    "Made by ${ParsingHtmlHelperTool.parseHtmlString(itemProduct.itemProductModel!.sellerName)}",
                    style: TextStyle(
                        fontSize: 20.0,
                        color: Color(0xffF46402),
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.almendra().fontFamily),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: <BoxShadow>[
                      BoxShadow(color: Colors.grey, blurRadius: 3.0),
                    ],
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: Image.network(
                                  !itemProduct.itemProductModel!.sellerPhoto
                                          .contains("http")
                                      ? "https://homepages.cae.wisc.edu/~ece533/images/boat.png"
                                      : itemProduct
                                          .itemProductModel!.sellerPhoto,
                                  fit: BoxFit.cover,
                                ).image,
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                              border:
                                  Border.all(color: Colors.black45, width: 2.0),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 3.0,
                        ),
                        Text(
                          '${itemProduct.itemProductModel!.sellerName}',
                          style: const TextStyle(fontSize: 20),
                        ),
                        SizedBox(
                          height: 3.0,
                        ),
                        //TODO Online Shop Description
                        Text('Online Shop for selling hand-made products'),
                        SizedBox(
                          height: 7.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            //TODO Seller Gmail Needs To Be Added
                            //TODO Seller About Summary
                            print("Seller Photo");
                            print(itemProduct.itemProductModel!.sellerPhoto);
                            print("Seller Photo");

                            shopProfile.addShopProfile(
                              User(
                                imagePath: itemProduct
                                        .itemProductModel!.sellerPhoto
                                        .contains("https")
                                    ? itemProduct.itemProductModel!.sellerPhoto
                                    : "https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80",
                                name: itemProduct.itemProductModel!.sellerName,
                                email: "mohamedmohey2352@gmail.com",
                                about:
                                    "We're from Georgia.We make hand-made products that are sold over the world we use this app to be specialized at only hand-made ones and the app comes with the new idea we've sold to over 100,000 customers with 99.99 percent of satisfaction",
                                location: itemProduct
                                    .itemProductModel!.sellerLocation,
                              ),
                            );

                            Navigator.of(context)
                                .pushNamed(RouteGenerator.userProfileRoute);
                          },
                          child: Container(
                            width: 300,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.grey, width: 2.0),
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.store,
                                  color: Colors.red,
                                  size: 30,
                                ),
                                Text(
                                  "View shop",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                      fontFamily:
                                          GoogleFonts.almendra().fontFamily),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 13.0,
                        ),
                        GestureDetector(
                          onTap: () async {
                            //TODO Asking a Question

                            final mailtoLink = Mailto(
                              to: ['mohamedmohey2352@gmail.com'],
                              cc: ['cc1@example.com', 'cc2@example.com'],
                              subject:
                                  '️I loved ❣️ your Shop Item on Alex Shopping App 🛍',
                              body:
                                  'I want to ensure only one thing is this item made by hand-made people or by factory?',
                            );
                            // Convert the Mailto instance into a string.
                            // Use either Dart's string interpolation
                            // or the toString() method.
                            await launch('$mailtoLink');
                          },
                          child: Container(
                            width: 300,
                            height: 50,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                    Border.all(color: Colors.grey, width: 2.0),
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Text.rich(
                              TextSpan(
                                children: <InlineSpan>[
                                  WidgetSpan(
                                      child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      Container(
                                        margin: const EdgeInsets.only(left: 19),
                                        child: Icon(
                                          Icons.email,
                                          color: Colors.red,
                                          size: 30,
                                        ),
                                      ),
                                      GestureDetector(
                                        child: Text(
                                          "Ask a Question",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              fontFamily: GoogleFonts.almendra()
                                                  .fontFamily),
                                        ),
                                      ),
                                    ],
                                  ))
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          });
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
 
  }

  Widget getSearchableDropdown(List<String> listData, mapKey, String hint) {
    List<DropdownMenuItem> items = [];

    for (int i = 0; i < listData.length; i++) {
      items.add(new DropdownMenuItem(
        child: new Text(
          listData[i],
        ),
        value: listData[i],
      ));
    }
    return new SearchableDropdown(
      items: items,
      value: selectedValueMap[mapKey],
      isCaseSensitiveSearch: false,
      hint: new Text(hint),
      searchHint: new Text(
        hint,
        style: new TextStyle(fontSize: 20),
      ),
      onChanged: (value) {

        setState(() {
          selectedValueMap[mapKey] = value;
        });

      },
      isExpanded: true,
    );
  }
}

