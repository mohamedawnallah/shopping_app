import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart'show kIsWeb;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/statemangement/provider/index_btm_navigation_saver_provider.dart';
import 'package:shop_app/models/statemangement/provider/item_product_provider.dart';
import 'package:shop_app/models/statemangement/provider/purchases_items_product_model_provider.dart';
import 'package:shop_app/models/statemangement/provider/shop_profile_provider.dart';
import 'package:shop_app/models/user_model.dart';
import 'package:shop_app/route_generator.dart';
import 'package:shop_app/services/top_menu_categories_network_helper/dart/network_helper_models/home_page_network_helper_model.dart';
import 'package:shop_app/utils/parsing_html_helper_tool.dart';
import 'package:video_player/video_player.dart';

class ItemRoute extends StatefulWidget {
  const ItemRoute();

  @override
  _ItemRouteState createState() => _ItemRouteState();
}

class _ItemRouteState extends State<ItemRoute> {
  String _colorChosenValue = "Colors";
  String _numChosenItem = "number";
  late VideoPlayerController _controller;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
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
          double difference =
              double.parse(itemProduct.itemProductModel!.options[0].price) -
                  double.parse(
                      itemProduct.itemProductModel!.options[0].discountedPrice);
          return Consumer<ShopProfileProvider>(builder: (_, shopProfile, __) {
            return ListView(
              children: <Widget>[
                Expanded(
                  child: Container(
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
                            children: <Widget>[
                              Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: Image.network(
                                      !itemProduct.itemProductModel!.sellerPhoto
                                              .contains("http")
                                          ? "https://homepages.cae.wisc.edu/~ece533/images/arctichare.png"
                                          : itemProduct
                                              .itemProductModel!.sellerPhoto,
                                      fit: BoxFit.cover,
                                    ).image,
                                    fit: BoxFit.cover,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                  border: Border.all(
                                      color: Colors.black45, width: 2.0),
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Expanded(
                                child: Container(
                                  height: 50,
                                  margin: const EdgeInsets.only(right: 19.0),
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        height: 15,
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          "${itemProduct.itemProductModel!.sellerName}",
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Flexible(
                                        child: Container(
                                          height: 30,
                                          child: Row(
                                            children: <Widget>[
                                              Icon(
                                                Icons.location_on,
                                                color: Colors.black,
                                              ),
                                              Text(
                                                "${itemProduct.itemProductModel!.sellerLocation}",
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
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
                              ),
                            ],
                          ),
                        ),
                        CarouselSlider(
                          options: CarouselOptions(height:!kIsWeb? 400.0:700),
                          items:
                              itemProduct.itemProductModel!.medias.map((media) {
                            return Builder(
                              builder: (BuildContext context) {
                                if (media.mediaType != "Image") {
                                  _controller.dispose();
                                  VideoPlayerController.network(media.mediaName)
                                    ..initialize().then((_) {
                                      // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
                                      setState(() {});
                                    });
                                  _controller.play();
                                }

                                return Container(
                                  width: !kIsWeb?400:800,
                                  margin:
                                      EdgeInsets.symmetric(horizontal: 20.0),
                                  padding: const EdgeInsets.all(4.0),
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                  ),
                                  child: Expanded(
                                    child: Container(
                                      height: 400,
                                      margin: const EdgeInsets.fromLTRB(
                                          28.0, 0, 28.0, 0),
                                      child: media.mediaType == "Image"
                                          ? Image.network(
                                              !media.mediaName.contains("http")
                                                  ? "https://homepages.cae.wisc.edu/~ece533/images/boat.png"
                                                  : media.mediaName,
                                              fit: BoxFit.fill,
                                            )
                                          : _controller.value.isInitialized
                                              ? AspectRatio(
                                                  aspectRatio: _controller
                                                      .value.aspectRatio,
                                                  child:
                                                      VideoPlayer(_controller),
                                                )
                                              : Container(),
                                    ),
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Expanded(
                  child: Container(
                    height: 200.0,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "${ParsingHtmlHelperTool.parseHtmlString(itemProduct.itemProductModel!.productName)}",
                            style: TextStyle(fontSize: 25.0),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          if (itemProduct.itemProductModel!.options[0]
                                  .discountIndicator ==
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
                                          decoration:
                                              TextDecoration.lineThrough,
                                          color: Color(0xFF247E34),
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            "(${((difference / double.parse(itemProduct.itemProductModel!.options[0].price)) * 100).toStringAsFixed(2)}% off)",
                                        style: const TextStyle(
                                          color: Color(0xFF247E34),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 10.0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Text(
                                      '\$${itemProduct.itemProductModel!.options[0].discountedPrice}',
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
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
                          if (itemProduct.itemProductModel!.options[0]
                                  .discountIndicator ==
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
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
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
                            child: DropdownButtonHideUnderline(
                              child: ButtonTheme(
                                alignedDropdown: true,
                                child: DropdownButton<String>(
                                    focusColor: Colors.white,
                                    value: _colorChosenValue,
                                    //elevation: 5,
                                    style: TextStyle(color: Colors.white),
                                    iconEnabledColor: Colors.black,
                                    items: <String>[
                                      'Colors',
                                      itemProduct.itemProductModel!.primaryColor
                                              .isEmpty
                                          ? "1st Color"
                                          : itemProduct
                                              .itemProductModel!.primaryColor,
                                      itemProduct.itemProductModel!
                                              .secondaryColor.isEmpty
                                          ? "2nd Color"
                                          : itemProduct
                                              .itemProductModel!.secondaryColor,
                                    ].map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: TextStyle(
                                              color: value == "Colors"
                                                  ? Colors.grey
                                                  : Colors.black),
                                        ),
                                      );
                                    }).toList(),
                                    hint: Text(
                                      "Colors",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        _colorChosenValue = value!;
                                      });
                                    }),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Container(
                              width: 300,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 2),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: ButtonTheme(
                                  alignedDropdown: true,
                                  child: DropdownButton<String>(
                                      focusColor: Colors.white,
                                      value: _numChosenItem,
                                      //elevation: 5,
                                      style: TextStyle(color: Colors.white),
                                      iconEnabledColor: Colors.black,
                                      items: <String>[
                                        'number',
                                        '1',
                                        '2',
                                        '3',
                                        '4',
                                        '5',
                                      ].map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(
                                            value,
                                            style: TextStyle(
                                                color: value == "number"
                                                    ? Colors.grey
                                                    : Colors.black),
                                          ),
                                        );
                                      }).toList(),
                                      hint: Text(
                                        "number",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          _numChosenItem = value!;
                                        });
                                      }),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed(RouteGenerator.purchasesRoute);
                              },
                              child: Container(
                                  padding: const EdgeInsets.all(14.0),
                                  alignment: Alignment.center,
                                  width: 350,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.black, width: 3),
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
                                        Icon(Icons.check_circle,color: Colors.green,size: 30,),
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
                ),
                Expanded(
                  child: Container(
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
                              title: Text(
                                "Item Overview",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              children: <Widget>[
                                ListTile(
                                  title: Row(
                                    children: <Widget>[
                                      Text(
                                        "• Product Type: ${ParsingHtmlHelperTool.parseHtmlString(itemProduct.itemProductModel!.productType)}"
                                            "\n"
                                        "\n• BestSeller tag: ${ParsingHtmlHelperTool.parseHtmlString(itemProduct.itemProductModel!.bestSellerTag)}"
                                            "\n"
                                        "\n• Gift Wrap Tag:${ParsingHtmlHelperTool.parseHtmlString(itemProduct.itemProductModel!.giftWrapTag)}"
                                            "\n"
                                        "\n• Shipping From ${ParsingHtmlHelperTool.parseHtmlString(itemProduct.itemProductModel!.shipFrom)}"
                                            "\n"
                                        "\n• Option Label ${ParsingHtmlHelperTool.parseHtmlString(itemProduct.itemProductModel!.options[0].optionLabel)}"
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
                                    ],
                                  ),
                                )
                              ],
                            ),
                            ExpansionTile(
                              iconColor: Colors.black,
                              textColor: Colors.black,
                              title: Text(
                                "Item Details",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              children: <Widget>[
                                ListTile(
                                  title: Expanded(
                                    child: Text(
                                      "${ParsingHtmlHelperTool.parseHtmlString(itemProduct.itemProductModel!.productDesc)}",
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            ExpansionTile(
                              iconColor: Colors.black,
                              textColor: Colors.black,
                              title: Text(
                                "Shipping & Policies",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              children: <Widget>[
                                ListTile(
                                    title: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Text(
                                          "• Local Tax: ${itemProduct.itemProductModel!.localTax}"
                                          "\n"
                                          "\n• Shipping From: ${itemProduct.itemProductModel!.shipFrom}"
                                              "\n"
                                          "\n• Shipping Cost: ${itemProduct.itemProductModel!.shippingCost}"
                                              "\n"
                                          "\n• Schedule: ${itemProduct.itemProductModel!.schedule}"
                                              "\n"
                                          "\n• Return Exchange Notes: ${itemProduct.itemProductModel!.returnExchangeNote}"
                                              "\n"
                                              "\n• Production Policy: ${itemProduct.itemProductModel!.productionPolicy}"
                                              "\n"
                                          "\n• Delivery Policy: ${itemProduct.itemProductModel!.deliveryPolicy}"
                                              "\n"

                                          "\n• Shop Policy: ${itemProduct.itemProductModel!.shopPolicy}"
                                              "\n"
                                          "\n• Production Partner: ${itemProduct.itemProductModel!.deliveryPolicy}"),
                                    ),
                                  ],
                                ))
                              ],
                            ),
                            ExpansionTile(
                              iconColor: Colors.black,
                              textColor: Colors.black,
                              title: Text(
                                "FAQs",
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black),
                              ),
                              children: <Widget>[
                                ListTile(
                                    title: Expanded(
                                  child: Row(
                                    children: <Widget>[
                                      //Frequently Asked Questions
                                    ],
                                  ),
                                ))
                              ],
                            ),
                          ],
                        ),
                      )),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Made by ${itemProduct.itemProductModel!.sellerName}",
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Color(0xffF46402),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15.0,
                ),
                Expanded(
                  child: Container(
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
                                border: Border.all(
                                    color: Colors.black45, width: 2.0),
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
                                      ? itemProduct
                                          .itemProductModel!.sellerPhoto
                                      : "https://images.unsplash.com/photo-1554151228-14d9def656e4?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=333&q=80",
                                  name:
                                      itemProduct.itemProductModel!.sellerName,
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
                                  border: Border.all(
                                      color: Colors.grey, width: 2.0),
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: Text(
                                "View shop",
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 13.0,
                          ),
                          GestureDetector(
                            onTap: () {
                              //TODO Asking a Question
                            },
                            child: Container(
                              width: 300,
                              height: 50,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.grey, width: 2.0),
                                  borderRadius: BorderRadius.circular(5.0)),
                              child: Text.rich(
                                TextSpan(
                                  children: <InlineSpan>[
                                    WidgetSpan(
                                        child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Icon(Icons.email),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Text(
                                          "Ask a Question",
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold),
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
    _controller.dispose();
  }
}
