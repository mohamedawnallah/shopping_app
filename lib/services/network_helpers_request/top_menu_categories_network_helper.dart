import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shop_app/config/constants.dart';
import 'package:shop_app/view_models/provider/all_providers.dart';
import 'dart:convert';


import '../all_services.dart';
import 'home_route_network_helper.dart';

class TopMenuCategoriesNetworkHelper {
  static Future<List<TopCategoryModel>> getTopCategories(context) async {
    var response = await http.post(
      Uri.parse(
        "https://api.iqstars.me/Clique/RetrieveTopMenu.aspx",
      ),
    );
    print("Body");
    print(response.body);
    print("Body");

    List<dynamic> jsonData = json.decode(response.body);
    print("Json Data is $jsonData}");
    List<TopCategoryModel> topCategoriesModel = [];

    for (Map<String, dynamic> element in jsonData) {
      topCategoriesModel.add(TopCategoryModel.fromJson(element));
    }
      WidgetsBinding.instance!.addPostFrameCallback((timeStamp) async{
        Provider.of<TopMenuCategoryProvider>(context,listen: false).addCategories(topCategoriesModel);
        Provider.of<TopMenuCategoryProvider>(context,listen: false).addFirstNavCategories(topCategoriesModel);
        Provider.of<TopMenuCategoryProvider>(context,listen: false).addSecondNavCategories(topCategoryModelList: topCategoriesModel);
        Provider.of<TopMenuCategoryProvider>(context,listen: false).addThirdNavCategories(topCategoryModelList:topCategoriesModel);
        Provider.of<TopMenuCategoryProvider>(context,listen: false).addFourthNavCategories(topCategoryModelList: topCategoriesModel);

    });
    return topCategoriesModel;
  }
}

String topMenuCategories=''' 
[
    {
        "parentID": "485",
        "parentMenuLabel": "All Categories",
        "childID": "45",
        "childMenuLabel": "Art &amp; Collectibles",
        "navLevel": "1"
    },
    {
        "parentID": "485",
        "parentMenuLabel": "All Categories",
        "childID": "132",
        "childMenuLabel": "Clothing &amp; Shoes",
        "navLevel": "1"
    },
    {
        "parentID": "485",
        "parentMenuLabel": "All Categories",
        "childID": "148",
        "childMenuLabel": "Craft Supplies &amp; Tools",
        "navLevel": "1"
    },
    {
        "parentID": "485",
        "parentMenuLabel": "All Categories",
        "childID": "243",
        "childMenuLabel": "Home &amp; Living",
        "navLevel": "1"
    },
    {
        "parentID": "485",
        "parentMenuLabel": "All Categories",
        "childID": "257",
        "childMenuLabel": "Jewelry &amp; Accessories",
        "navLevel": "1"
    },
    {
        "parentID": "485",
        "parentMenuLabel": "All Categories",
        "childID": "439",
        "childMenuLabel": "Toys &amp; Entertainment",
        "navLevel": "1"
    },
    {
        "parentID": "485",
        "parentMenuLabel": "All Categories",
        "childID": "451",
        "childMenuLabel": "Vintage",
        "navLevel": "1"
    },
    {
        "parentID": "485",
        "parentMenuLabel": "All Categories",
        "childID": "460",
        "childMenuLabel": "Wedding &amp; Party",
        "navLevel": "1"
    },
    {
        "parentID": "45",
        "parentMenuLabel": "Art &amp; Collectibles",
        "childID": "7",
        "childMenuLabel": "All Art &amp; Collectibles",
        "navLevel": "2"
    },
    {
        "parentID": "45",
        "parentMenuLabel": "Art &amp; Collectibles",
        "childID": "138",
        "childMenuLabel": "Collectibles",
        "navLevel": "2"
    },
    {
        "parentID": "45",
        "parentMenuLabel": "Art &amp; Collectibles",
        "childID": "174",
        "childMenuLabel": "Dolls &amp; Miniatures",
        "navLevel": "2"
    },
    {
        "parentID": "45",
        "parentMenuLabel": "Art &amp; Collectibles",
        "childID": "176",
        "childMenuLabel": "Drawing &amp; Illustration",
        "navLevel": "2"
    },
    {
        "parentID": "45",
        "parentMenuLabel": "Art &amp; Collectibles",
        "childID": "193",
        "childMenuLabel": "Fiber Arts",
        "navLevel": "2"
    },
    {
        "parentID": "45",
        "parentMenuLabel": "Art &amp; Collectibles",
        "childID": "219",
        "childMenuLabel": "Glass Art",
        "navLevel": "2"
    },
    {
        "parentID": "45",
        "parentMenuLabel": "Art &amp; Collectibles",
        "childID": "301",
        "childMenuLabel": "Mixed Media &amp; Collage",
        "navLevel": "2"
    },
    {
        "parentID": "45",
        "parentMenuLabel": "Art &amp; Collectibles",
        "childID": "325",
        "childMenuLabel": "Painting",
        "navLevel": "2"
    },
    {
        "parentID": "45",
        "parentMenuLabel": "Art &amp; Collectibles",
        "childID": "350",
        "childMenuLabel": "Photography",
        "navLevel": "2"
    },
    {
        "parentID": "45",
        "parentMenuLabel": "Art &amp; Collectibles",
        "childID": "359",
        "childMenuLabel": "Prints",
        "navLevel": "2"
    },
    {
        "parentID": "45",
        "parentMenuLabel": "Art &amp; Collectibles",
        "childID": "373",
        "childMenuLabel": "Sculpture",
        "navLevel": "2"
    },
    {
        "parentID": "132",
        "parentMenuLabel": "Clothing &amp; Shoes",
        "childID": "12",
        "childMenuLabel": "All Clothing &amp; Shoes",
        "navLevel": "2"
    },
    {
        "parentID": "132",
        "parentMenuLabel": "Clothing &amp; Shoes",
        "childID": "55",
        "childMenuLabel": "Bags &amp; Purses",
        "navLevel": "2"
    },
    {
        "parentID": "132",
        "parentMenuLabel": "Clothing &amp; Shoes",
        "childID": "267",
        "childMenuLabel": "Kids&apos; &amp; Baby",
        "navLevel": "2"
    },
    {
        "parentID": "132",
        "parentMenuLabel": "Clothing &amp; Shoes",
        "childID": "295",
        "childMenuLabel": "Men&apos;s",
        "navLevel": "2"
    },
    {
        "parentID": "132",
        "parentMenuLabel": "Clothing &amp; Shoes",
        "childID": "474",
        "childMenuLabel": "Women&apos;s",
        "navLevel": "2"
    },
    {
        "parentID": "148",
        "parentMenuLabel": "Craft Supplies &amp; Tools",
        "childID": "13",
        "childMenuLabel": "All Craft Supplies &amp; Tools",
        "navLevel": "2"
    },
    {
        "parentID": "148",
        "parentMenuLabel": "Craft Supplies &amp; Tools",
        "childID": "242",
        "childMenuLabel": "Home &amp; Hobby",
        "navLevel": "2"
    },
    {
        "parentID": "148",
        "parentMenuLabel": "Craft Supplies &amp; Tools",
        "childID": "258",
        "childMenuLabel": "Jewelry &amp; Beauty",
        "navLevel": "2"
    },
    {
        "parentID": "148",
        "parentMenuLabel": "Craft Supplies &amp; Tools",
        "childID": "331",
        "childMenuLabel": "Papercraft",
        "navLevel": "2"
    },
    {
        "parentID": "148",
        "parentMenuLabel": "Craft Supplies &amp; Tools",
        "childID": "372",
        "childMenuLabel": "Sculpting &amp; Forming",
        "navLevel": "2"
    },
    {
        "parentID": "148",
        "parentMenuLabel": "Craft Supplies &amp; Tools",
        "childID": "376",
        "childMenuLabel": "Sewing &amp; Fiber",
        "navLevel": "2"
    },
    {
        "parentID": "148",
        "parentMenuLabel": "Craft Supplies &amp; Tools",
        "childID": "452",
        "childMenuLabel": "Visual Arts",
        "navLevel": "2"
    },
    {
        "parentID": "243",
        "parentMenuLabel": "Home &amp; Living",
        "childID": "17",
        "childMenuLabel": "All Home &amp; Living",
        "navLevel": "2"
    },
    {
        "parentID": "243",
        "parentMenuLabel": "Home &amp; Living",
        "childID": "62",
        "childMenuLabel": "Bath &amp; Beauty",
        "navLevel": "2"
    },
    {
        "parentID": "243",
        "parentMenuLabel": "Home &amp; Living",
        "childID": "241",
        "childMenuLabel": "Home",
        "navLevel": "2"
    },
    {
        "parentID": "243",
        "parentMenuLabel": "Home &amp; Living",
        "childID": "348",
        "childMenuLabel": "Pet Supplies",
        "navLevel": "2"
    },
    {
        "parentID": "257",
        "parentMenuLabel": "Jewelry &amp; Accessories",
        "childID": "1",
        "childMenuLabel": "Accessories",
        "navLevel": "2"
    },
    {
        "parentID": "257",
        "parentMenuLabel": "Jewelry &amp; Accessories",
        "childID": "55",
        "childMenuLabel": "Bags &amp; Purses",
        "navLevel": "2"
    },
    {
        "parentID": "257",
        "parentMenuLabel": "Jewelry &amp; Accessories",
        "childID": "80",
        "childMenuLabel": "Body Jewelry",
        "navLevel": "2"
    },
    {
        "parentID": "257",
        "parentMenuLabel": "Jewelry &amp; Accessories",
        "childID": "90",
        "childMenuLabel": "Bracelets",
        "navLevel": "2"
    },
    {
        "parentID": "257",
        "parentMenuLabel": "Jewelry &amp; Accessories",
        "childID": "181",
        "childMenuLabel": "Earrings",
        "navLevel": "2"
    },
    {
        "parentID": "257",
        "parentMenuLabel": "Jewelry &amp; Accessories",
        "childID": "311",
        "childMenuLabel": "Necklaces",
        "navLevel": "2"
    },
    {
        "parentID": "257",
        "parentMenuLabel": "Jewelry &amp; Accessories",
        "childID": "338",
        "childMenuLabel": "Pendants",
        "navLevel": "2"
    },
    {
        "parentID": "257",
        "parentMenuLabel": "Jewelry &amp; Accessories",
        "childID": "365",
        "childMenuLabel": "Rings",
        "navLevel": "2"
    },
    {
        "parentID": "439",
        "parentMenuLabel": "Toys &amp; Entertainment",
        "childID": "31",
        "childMenuLabel": "All Toys &amp; Entertainment",
        "navLevel": "2"
    },
    {
        "parentID": "439",
        "parentMenuLabel": "Toys &amp; Entertainment",
        "childID": "83",
        "childMenuLabel": "Books",
        "navLevel": "2"
    },
    {
        "parentID": "439",
        "parentMenuLabel": "Toys &amp; Entertainment",
        "childID": "182",
        "childMenuLabel": "Electronics &amp; Accessories",
        "navLevel": "2"
    },
    {
        "parentID": "439",
        "parentMenuLabel": "Toys &amp; Entertainment",
        "childID": "305",
        "childMenuLabel": "Movies &amp; Music",
        "navLevel": "2"
    },
    {
        "parentID": "439",
        "parentMenuLabel": "Toys &amp; Entertainment",
        "childID": "438",
        "childMenuLabel": "Toys",
        "navLevel": "2"
    },
    {
        "parentID": "460",
        "parentMenuLabel": "Wedding &amp; Party",
        "childID": "33",
        "childMenuLabel": "All Wedding",
        "navLevel": "2"
    },
    {
        "parentID": "460",
        "parentMenuLabel": "Wedding &amp; Party",
        "childID": "34",
        "childMenuLabel": "All Wedding &amp; Party",
        "navLevel": "2"
    },
    {
        "parentID": "460",
        "parentMenuLabel": "Wedding &amp; Party",
        "childID": "254",
        "childMenuLabel": "Invitations &amp; Paper",
        "navLevel": "2"
    },
    {
        "parentID": "460",
        "parentMenuLabel": "Wedding &amp; Party",
        "childID": "335",
        "childMenuLabel": "Party Supplies",
        "navLevel": "2"
    },
    {
        "parentID": "460",
        "parentMenuLabel": "Wedding &amp; Party",
        "childID": "461",
        "childMenuLabel": "Wedding Accessories",
        "navLevel": "2"
    },
    {
        "parentID": "460",
        "parentMenuLabel": "Wedding &amp; Party",
        "childID": "463",
        "childMenuLabel": "Wedding Clothing",
        "navLevel": "2"
    },
    {
        "parentID": "460",
        "parentMenuLabel": "Wedding &amp; Party",
        "childID": "464",
        "childMenuLabel": "Wedding Decorations",
        "navLevel": "2"
    },
    {
        "parentID": "460",
        "parentMenuLabel": "Wedding &amp; Party",
        "childID": "466",
        "childMenuLabel": "Wedding gifts",
        "navLevel": "2"
    },
    {
        "parentID": "460",
        "parentMenuLabel": "Wedding &amp; Party",
        "childID": "469",
        "childMenuLabel": "Wedding Jewelry",
        "navLevel": "2"
    },
    {
        "parentID": "1",
        "parentMenuLabel": "Accessories",
        "childID": "6",
        "childMenuLabel": "All Accessories",
        "navLevel": "3"
    },
    {
        "parentID": "1",
        "parentMenuLabel": "Accessories",
        "childID": "75",
        "childMenuLabel": "Belts &amp; Suspenders",
        "navLevel": "3"
    },
    {
        "parentID": "1",
        "parentMenuLabel": "Accessories",
        "childID": "222",
        "childMenuLabel": "Gloves &amp; Mittens",
        "navLevel": "3"
    },
    {
        "parentID": "1",
        "parentMenuLabel": "Accessories",
        "childID": "229",
        "childMenuLabel": "Hair Accessories",
        "navLevel": "3"
    },
    {
        "parentID": "1",
        "parentMenuLabel": "Accessories",
        "childID": "237",
        "childMenuLabel": "Hats &amp; Caps",
        "navLevel": "3"
    },
    {
        "parentID": "1",
        "parentMenuLabel": "Accessories",
        "childID": "266",
        "childMenuLabel": "Keychains &amp; Lanyards",
        "navLevel": "3"
    },
    {
        "parentID": "1",
        "parentMenuLabel": "Accessories",
        "childID": "370",
        "childMenuLabel": "Scarves &amp; Wraps",
        "navLevel": "3"
    },
    {
        "parentID": "1",
        "parentMenuLabel": "Accessories",
        "childID": "419",
        "childMenuLabel": "Sun Hats",
        "navLevel": "3"
    },
    {
        "parentID": "1",
        "parentMenuLabel": "Accessories",
        "childID": "420",
        "childMenuLabel": "Sunglasses &amp; Eyewear",
        "navLevel": "3"
    },
    {
        "parentID": "1",
        "parentMenuLabel": "Accessories",
        "childID": "443",
        "childMenuLabel": "Umbrellas &amp; Rain Accessories",
        "navLevel": "3"
    },
    {
        "parentID": "55",
        "parentMenuLabel": "Bags &amp; Purses",
        "childID": "8",
        "childMenuLabel": "All Bags &amp; Purses",
        "navLevel": "3"
    },
    {
        "parentID": "55",
        "parentMenuLabel": "Bags &amp; Purses",
        "childID": "54",
        "childMenuLabel": "Backpacks",
        "navLevel": "3"
    },
    {
        "parentID": "55",
        "parentMenuLabel": "Bags &amp; Purses",
        "childID": "164",
        "childMenuLabel": "Diaper Bags",
        "navLevel": "3"
    },
    {
        "parentID": "55",
        "parentMenuLabel": "Bags &amp; Purses",
        "childID": "234",
        "childMenuLabel": "Handbags",
        "navLevel": "3"
    },
    {
        "parentID": "55",
        "parentMenuLabel": "Bags &amp; Purses",
        "childID": "287",
        "childMenuLabel": "Luggage &amp; Duffel Bags",
        "navLevel": "3"
    },
    {
        "parentID": "55",
        "parentMenuLabel": "Bags &amp; Purses",
        "childID": "349",
        "childMenuLabel": "Phone Cases",
        "navLevel": "3"
    },
    {
        "parentID": "62",
        "parentMenuLabel": "Bath &amp; Beauty",
        "childID": "9",
        "childMenuLabel": "All Bath &amp; Beauty",
        "navLevel": "3"
    },
    {
        "parentID": "62",
        "parentMenuLabel": "Bath &amp; Beauty",
        "childID": "64",
        "childMenuLabel": "Bath Accessories",
        "navLevel": "3"
    },
    {
        "parentID": "62",
        "parentMenuLabel": "Bath &amp; Beauty",
        "childID": "187",
        "childMenuLabel": "Essential Oils",
        "navLevel": "3"
    },
    {
        "parentID": "62",
        "parentMenuLabel": "Bath &amp; Beauty",
        "childID": "190",
        "childMenuLabel": "Face Masks &amp; Coverings",
        "navLevel": "3"
    },
    {
        "parentID": "62",
        "parentMenuLabel": "Bath &amp; Beauty",
        "childID": "204",
        "childMenuLabel": "Fragrances",
        "navLevel": "3"
    },
    {
        "parentID": "62",
        "parentMenuLabel": "Bath &amp; Beauty",
        "childID": "230",
        "childMenuLabel": "Hair Care",
        "navLevel": "3"
    },
    {
        "parentID": "62",
        "parentMenuLabel": "Bath &amp; Beauty",
        "childID": "291",
        "childMenuLabel": "Makeup &amp; Cosmetics",
        "navLevel": "3"
    },
    {
        "parentID": "62",
        "parentMenuLabel": "Bath &amp; Beauty",
        "childID": "378",
        "childMenuLabel": "Sex Toys",
        "navLevel": "3"
    },
    {
        "parentID": "62",
        "parentMenuLabel": "Bath &amp; Beauty",
        "childID": "391",
        "childMenuLabel": "Skin Care",
        "navLevel": "3"
    },
    {
        "parentID": "62",
        "parentMenuLabel": "Bath &amp; Beauty",
        "childID": "395",
        "childMenuLabel": "Soaps &amp; Bath Bombs",
        "navLevel": "3"
    },
    {
        "parentID": "80",
        "parentMenuLabel": "Body Jewelry",
        "childID": "10",
        "childMenuLabel": "All Body Jewelry",
        "navLevel": "3"
    },
    {
        "parentID": "80",
        "parentMenuLabel": "Body Jewelry",
        "childID": "41",
        "childMenuLabel": "Anklets",
        "navLevel": "3"
    },
    {
        "parentID": "80",
        "parentMenuLabel": "Body Jewelry",
        "childID": "44",
        "childMenuLabel": "Arm Bands",
        "navLevel": "3"
    },
    {
        "parentID": "80",
        "parentMenuLabel": "Body Jewelry",
        "childID": "72",
        "childMenuLabel": "Belly Rings",
        "navLevel": "3"
    },
    {
        "parentID": "80",
        "parentMenuLabel": "Body Jewelry",
        "childID": "231",
        "childMenuLabel": "Hair Jewelry",
        "navLevel": "3"
    },
    {
        "parentID": "80",
        "parentMenuLabel": "Body Jewelry",
        "childID": "284",
        "childMenuLabel": "Lip Rings",
        "navLevel": "3"
    },
    {
        "parentID": "80",
        "parentMenuLabel": "Body Jewelry",
        "childID": "314",
        "childMenuLabel": "Nipple Jewelry",
        "navLevel": "3"
    },
    {
        "parentID": "80",
        "parentMenuLabel": "Body Jewelry",
        "childID": "315",
        "childMenuLabel": "Nose Rings &amp; Studs",
        "navLevel": "3"
    },
    {
        "parentID": "80",
        "parentMenuLabel": "Body Jewelry",
        "childID": "388",
        "childMenuLabel": "Shoulder Jewelry",
        "navLevel": "3"
    },
    {
        "parentID": "80",
        "parentMenuLabel": "Body Jewelry",
        "childID": "432",
        "childMenuLabel": "Toe Rings",
        "navLevel": "3"
    },
    {
        "parentID": "83",
        "parentMenuLabel": "Books",
        "childID": "46",
        "childMenuLabel": "Art &amp; Photography Books",
        "navLevel": "3"
    },
    {
        "parentID": "83",
        "parentMenuLabel": "Books",
        "childID": "77",
        "childMenuLabel": "Blank Books",
        "navLevel": "3"
    },
    {
        "parentID": "83",
        "parentMenuLabel": "Books",
        "childID": "81",
        "childMenuLabel": "Book Accessories",
        "navLevel": "3"
    },
    {
        "parentID": "83",
        "parentMenuLabel": "Books",
        "childID": "103",
        "childMenuLabel": "Calendars &amp; Planners",
        "navLevel": "3"
    },
    {
        "parentID": "83",
        "parentMenuLabel": "Books",
        "childID": "125",
        "childMenuLabel": "Children&apos;s Books",
        "navLevel": "3"
    },
    {
        "parentID": "83",
        "parentMenuLabel": "Books",
        "childID": "139",
        "childMenuLabel": "Comics &amp; Graphic Novels",
        "navLevel": "3"
    },
    {
        "parentID": "83",
        "parentMenuLabel": "Books",
        "childID": "147",
        "childMenuLabel": "Craft &amp; Hobby Books",
        "navLevel": "3"
    },
    {
        "parentID": "83",
        "parentMenuLabel": "Books",
        "childID": "228",
        "childMenuLabel": "Guides &amp; How Tos",
        "navLevel": "3"
    },
    {
        "parentID": "83",
        "parentMenuLabel": "Books",
        "childID": "285",
        "childMenuLabel": "Literature &amp; Fiction",
        "navLevel": "3"
    },
    {
        "parentID": "83",
        "parentMenuLabel": "Books",
        "childID": "355",
        "childMenuLabel": "Poetry",
        "navLevel": "3"
    },
    {
        "parentID": "83",
        "parentMenuLabel": "Books",
        "childID": "481",
        "childMenuLabel": "Zines &amp; Magazines",
        "navLevel": "3"
    },
    {
        "parentID": "90",
        "parentMenuLabel": "Bracelets",
        "childID": "11",
        "childMenuLabel": "All Bracelets",
        "navLevel": "3"
    },
    {
        "parentID": "90",
        "parentMenuLabel": "Bracelets",
        "childID": "58",
        "childMenuLabel": "Bangles",
        "navLevel": "3"
    },
    {
        "parentID": "90",
        "parentMenuLabel": "Bracelets",
        "childID": "68",
        "childMenuLabel": "Beaded Bracelets",
        "navLevel": "3"
    },
    {
        "parentID": "90",
        "parentMenuLabel": "Bracelets",
        "childID": "118",
        "childMenuLabel": "Chain &amp; Link Bracelets",
        "navLevel": "3"
    },
    {
        "parentID": "90",
        "parentMenuLabel": "Bracelets",
        "childID": "122",
        "childMenuLabel": "Charm Bracelets",
        "navLevel": "3"
    },
    {
        "parentID": "90",
        "parentMenuLabel": "Bracelets",
        "childID": "154",
        "childMenuLabel": "Cuff Bracelets",
        "navLevel": "3"
    },
    {
        "parentID": "90",
        "parentMenuLabel": "Bracelets",
        "childID": "478",
        "childMenuLabel": "Woven &amp; Braided Bracelets",
        "navLevel": "3"
    },
    {
        "parentID": "138",
        "parentMenuLabel": "Collectibles",
        "childID": "136",
        "childMenuLabel": "Coins &amp; Money",
        "navLevel": "3"
    },
    {
        "parentID": "138",
        "parentMenuLabel": "Collectibles",
        "childID": "195",
        "childMenuLabel": "Figurines &amp; Knick Knacks",
        "navLevel": "3"
    },
    {
        "parentID": "138",
        "parentMenuLabel": "Collectibles",
        "childID": "294",
        "childMenuLabel": "Memorabilia",
        "navLevel": "3"
    },
    {
        "parentID": "181",
        "parentMenuLabel": "Earrings",
        "childID": "14",
        "childMenuLabel": "All Earrings",
        "navLevel": "3"
    },
    {
        "parentID": "181",
        "parentMenuLabel": "Earrings",
        "childID": "120",
        "childMenuLabel": "Chandelier Earrings",
        "navLevel": "3"
    },
    {
        "parentID": "181",
        "parentMenuLabel": "Earrings",
        "childID": "129",
        "childMenuLabel": "Clip-On Earrings",
        "navLevel": "3"
    },
    {
        "parentID": "181",
        "parentMenuLabel": "Earrings",
        "childID": "133",
        "childMenuLabel": "Cluster Earrings",
        "navLevel": "3"
    },
    {
        "parentID": "181",
        "parentMenuLabel": "Earrings",
        "childID": "153",
        "childMenuLabel": "Cuff &amp; Wrap Earrings",
        "navLevel": "3"
    },
    {
        "parentID": "181",
        "parentMenuLabel": "Earrings",
        "childID": "158",
        "childMenuLabel": "Dangle &amp; Drop Earrings",
        "navLevel": "3"
    },
    {
        "parentID": "181",
        "parentMenuLabel": "Earrings",
        "childID": "180",
        "childMenuLabel": "Ear Jackets &amp; Climbers",
        "navLevel": "3"
    },
    {
        "parentID": "181",
        "parentMenuLabel": "Earrings",
        "childID": "247",
        "childMenuLabel": "Hoop Earrings",
        "navLevel": "3"
    },
    {
        "parentID": "181",
        "parentMenuLabel": "Earrings",
        "childID": "414",
        "childMenuLabel": "Stud Earrings",
        "navLevel": "3"
    },
    {
        "parentID": "182",
        "parentMenuLabel": "Electronics &amp; Accessories",
        "childID": "106",
        "childMenuLabel": "Cameras",
        "navLevel": "3"
    },
    {
        "parentID": "182",
        "parentMenuLabel": "Electronics &amp; Accessories",
        "childID": "115",
        "childMenuLabel": "Cell Phone Accessories",
        "navLevel": "3"
    },
    {
        "parentID": "182",
        "parentMenuLabel": "Electronics &amp; Accessories",
        "childID": "140",
        "childMenuLabel": "Computers &amp; Peripherals",
        "navLevel": "3"
    },
    {
        "parentID": "182",
        "parentMenuLabel": "Electronics &amp; Accessories",
        "childID": "159",
        "childMenuLabel": "Decals &amp; Skins",
        "navLevel": "3"
    },
    {
        "parentID": "182",
        "parentMenuLabel": "Electronics &amp; Accessories",
        "childID": "208",
        "childMenuLabel": "Gadgets",
        "navLevel": "3"
    },
    {
        "parentID": "182",
        "parentMenuLabel": "Electronics &amp; Accessories",
        "childID": "450",
        "childMenuLabel": "Video Games",
        "navLevel": "3"
    },
    {
        "parentID": "241",
        "parentMenuLabel": "Home",
        "childID": "15",
        "childMenuLabel": "All Home",
        "navLevel": "3"
    },
    {
        "parentID": "241",
        "parentMenuLabel": "Home",
        "childID": "66",
        "childMenuLabel": "Bathroom",
        "navLevel": "3"
    },
    {
        "parentID": "241",
        "parentMenuLabel": "Home",
        "childID": "71",
        "childMenuLabel": "Bedding",
        "navLevel": "3"
    },
    {
        "parentID": "241",
        "parentMenuLabel": "Home",
        "childID": "201",
        "childMenuLabel": "Food &amp; Drink",
        "navLevel": "3"
    },
    {
        "parentID": "241",
        "parentMenuLabel": "Home",
        "childID": "207",
        "childMenuLabel": "Furniture",
        "navLevel": "3"
    },
    {
        "parentID": "241",
        "parentMenuLabel": "Home",
        "childID": "244",
        "childMenuLabel": "Home Décor",
        "navLevel": "3"
    },
    {
        "parentID": "241",
        "parentMenuLabel": "Home",
        "childID": "269",
        "childMenuLabel": "Kitchen &amp; Dining",
        "navLevel": "3"
    },
    {
        "parentID": "241",
        "parentMenuLabel": "Home",
        "childID": "280",
        "childMenuLabel": "Lighting",
        "navLevel": "3"
    },
    {
        "parentID": "241",
        "parentMenuLabel": "Home",
        "childID": "316",
        "childMenuLabel": "Office",
        "navLevel": "3"
    },
    {
        "parentID": "241",
        "parentMenuLabel": "Home",
        "childID": "323",
        "childMenuLabel": "Outdoor &amp; Gardening",
        "navLevel": "3"
    },
    {
        "parentID": "241",
        "parentMenuLabel": "Home",
        "childID": "366",
        "childMenuLabel": "Rugs",
        "navLevel": "3"
    },
    {
        "parentID": "241",
        "parentMenuLabel": "Home",
        "childID": "402",
        "childMenuLabel": "Spirituality &amp; Religion",
        "navLevel": "3"
    },
    {
        "parentID": "241",
        "parentMenuLabel": "Home",
        "childID": "412",
        "childMenuLabel": "Storage &amp; Organization",
        "navLevel": "3"
    },
    {
        "parentID": "242",
        "parentMenuLabel": "Home &amp; Hobby",
        "childID": "108",
        "childMenuLabel": "Candle Making",
        "navLevel": "3"
    },
    {
        "parentID": "242",
        "parentMenuLabel": "Home &amp; Hobby",
        "childID": "172",
        "childMenuLabel": "Doll &amp; Model Making",
        "navLevel": "3"
    },
    {
        "parentID": "242",
        "parentMenuLabel": "Home &amp; Hobby",
        "childID": "183",
        "childMenuLabel": "Electronics &amp; Circuitry",
        "navLevel": "3"
    },
    {
        "parentID": "242",
        "parentMenuLabel": "Home &amp; Hobby",
        "childID": "198",
        "childMenuLabel": "Floral &amp; Garden Crafts",
        "navLevel": "3"
    },
    {
        "parentID": "242",
        "parentMenuLabel": "Home &amp; Hobby",
        "childID": "202",
        "childMenuLabel": "Food &amp; Fermenting",
        "navLevel": "3"
    },
    {
        "parentID": "242",
        "parentMenuLabel": "Home &amp; Hobby",
        "childID": "206",
        "childMenuLabel": "Framing",
        "navLevel": "3"
    },
    {
        "parentID": "242",
        "parentMenuLabel": "Home &amp; Hobby",
        "childID": "245",
        "childMenuLabel": "Home Improvement",
        "navLevel": "3"
    },
    {
        "parentID": "242",
        "parentMenuLabel": "Home &amp; Hobby",
        "childID": "477",
        "childMenuLabel": "Woodworking &amp; Carpentry",
        "navLevel": "3"
    },
    {
        "parentID": "254",
        "parentMenuLabel": "Invitations &amp; Paper",
        "childID": "18",
        "childMenuLabel": "All Invitations &amp; Paper",
        "navLevel": "3"
    },
    {
        "parentID": "254",
        "parentMenuLabel": "Invitations &amp; Paper",
        "childID": "212",
        "childMenuLabel": "Gift Wrapping",
        "navLevel": "3"
    },
    {
        "parentID": "254",
        "parentMenuLabel": "Invitations &amp; Paper",
        "childID": "224",
        "childMenuLabel": "Greeting Cards",
        "navLevel": "3"
    },
    {
        "parentID": "254",
        "parentMenuLabel": "Invitations &amp; Paper",
        "childID": "240",
        "childMenuLabel": "Holiday &amp; Seasonal Cards",
        "navLevel": "3"
    },
    {
        "parentID": "254",
        "parentMenuLabel": "Invitations &amp; Paper",
        "childID": "253",
        "childMenuLabel": "Invitations &amp; Announcements",
        "navLevel": "3"
    },
    {
        "parentID": "254",
        "parentMenuLabel": "Invitations &amp; Paper",
        "childID": "409",
        "childMenuLabel": "Stationery",
        "navLevel": "3"
    },
    {
        "parentID": "258",
        "parentMenuLabel": "Jewelry &amp; Beauty",
        "childID": "261",
        "childMenuLabel": "Jewelry Making &amp; Beading",
        "navLevel": "3"
    },
    {
        "parentID": "258",
        "parentMenuLabel": "Jewelry &amp; Beauty",
        "childID": "292",
        "childMenuLabel": "Makeup &amp; Face Painting",
        "navLevel": "3"
    },
    {
        "parentID": "267",
        "parentMenuLabel": "Kids&apos; &amp; Baby",
        "childID": "20",
        "childMenuLabel": "All Kids&apos; &amp; Baby",
        "navLevel": "3"
    },
    {
        "parentID": "267",
        "parentMenuLabel": "Kids&apos; &amp; Baby",
        "childID": "52",
        "childMenuLabel": "Baby Boys&apos; Clothing",
        "navLevel": "3"
    },
    {
        "parentID": "267",
        "parentMenuLabel": "Kids&apos; &amp; Baby",
        "childID": "53",
        "childMenuLabel": "Baby Girls&apos; Clothing",
        "navLevel": "3"
    },
    {
        "parentID": "267",
        "parentMenuLabel": "Kids&apos; &amp; Baby",
        "childID": "88",
        "childMenuLabel": "Boys&apos; Clothing",
        "navLevel": "3"
    },
    {
        "parentID": "267",
        "parentMenuLabel": "Kids&apos; &amp; Baby",
        "childID": "89",
        "childMenuLabel": "Boys&apos; Shoes",
        "navLevel": "3"
    },
    {
        "parentID": "267",
        "parentMenuLabel": "Kids&apos; &amp; Baby",
        "childID": "217",
        "childMenuLabel": "Girls&apos; Clothing",
        "navLevel": "3"
    },
    {
        "parentID": "267",
        "parentMenuLabel": "Kids&apos; &amp; Baby",
        "childID": "218",
        "childMenuLabel": "Girls&apos; Shoes",
        "navLevel": "3"
    },
    {
        "parentID": "295",
        "parentMenuLabel": "Men&apos;s",
        "childID": "21",
        "childMenuLabel": "All Men&apos;s",
        "navLevel": "3"
    },
    {
        "parentID": "295",
        "parentMenuLabel": "Men&apos;s",
        "childID": "296",
        "childMenuLabel": "Men&apos;s Clothing",
        "navLevel": "3"
    },
    {
        "parentID": "295",
        "parentMenuLabel": "Men&apos;s",
        "childID": "297",
        "childMenuLabel": "Men&apos;s Shoes",
        "navLevel": "3"
    },
    {
        "parentID": "305",
        "parentMenuLabel": "Movies &amp; Music",
        "childID": "22",
        "childMenuLabel": "All Movies",
        "navLevel": "3"
    },
    {
        "parentID": "305",
        "parentMenuLabel": "Movies &amp; Music",
        "childID": "23",
        "childMenuLabel": "All Music",
        "navLevel": "3"
    },
    {
        "parentID": "305",
        "parentMenuLabel": "Movies &amp; Music",
        "childID": "252",
        "childMenuLabel": "Instrument Straps",
        "navLevel": "3"
    },
    {
        "parentID": "305",
        "parentMenuLabel": "Movies &amp; Music",
        "childID": "310",
        "childMenuLabel": "Musical Instruments",
        "navLevel": "3"
    },
    {
        "parentID": "305",
        "parentMenuLabel": "Movies &amp; Music",
        "childID": "363",
        "childMenuLabel": "Recorded Audio",
        "navLevel": "3"
    },
    {
        "parentID": "305",
        "parentMenuLabel": "Movies &amp; Music",
        "childID": "380",
        "childMenuLabel": "Sheet Music",
        "navLevel": "3"
    },
    {
        "parentID": "325",
        "parentMenuLabel": "Painting",
        "childID": "3",
        "childMenuLabel": "Acrylic",
        "navLevel": "3"
    },
    {
        "parentID": "325",
        "parentMenuLabel": "Painting",
        "childID": "319",
        "childMenuLabel": "Oil",
        "navLevel": "3"
    },
    {
        "parentID": "325",
        "parentMenuLabel": "Painting",
        "childID": "458",
        "childMenuLabel": "Watercolor",
        "navLevel": "3"
    },
    {
        "parentID": "331",
        "parentMenuLabel": "Papercraft",
        "childID": "82",
        "childMenuLabel": "Bookbinding",
        "navLevel": "3"
    },
    {
        "parentID": "331",
        "parentMenuLabel": "Papercraft",
        "childID": "113",
        "childMenuLabel": "Card Making &amp; Stationery",
        "navLevel": "3"
    },
    {
        "parentID": "331",
        "parentMenuLabel": "Papercraft",
        "childID": "320",
        "childMenuLabel": "Origami",
        "navLevel": "3"
    },
    {
        "parentID": "331",
        "parentMenuLabel": "Papercraft",
        "childID": "332",
        "childMenuLabel": "Party &amp; Gifting",
        "navLevel": "3"
    },
    {
        "parentID": "331",
        "parentMenuLabel": "Papercraft",
        "childID": "371",
        "childMenuLabel": "Scrapbooking",
        "navLevel": "3"
    },
    {
        "parentID": "331",
        "parentMenuLabel": "Papercraft",
        "childID": "406",
        "childMenuLabel": "Stamping",
        "navLevel": "3"
    },
    {
        "parentID": "335",
        "parentMenuLabel": "Party Supplies",
        "childID": "26",
        "childMenuLabel": "All Party Supplies",
        "navLevel": "3"
    },
    {
        "parentID": "335",
        "parentMenuLabel": "Party Supplies",
        "childID": "56",
        "childMenuLabel": "Baking &amp; Cake Decoration",
        "navLevel": "3"
    },
    {
        "parentID": "335",
        "parentMenuLabel": "Party Supplies",
        "childID": "333",
        "childMenuLabel": "Party Décor",
        "navLevel": "3"
    },
    {
        "parentID": "338",
        "parentMenuLabel": "Pendants",
        "childID": "24",
        "childMenuLabel": "All Necklaces",
        "navLevel": "3"
    },
    {
        "parentID": "338",
        "parentMenuLabel": "Pendants",
        "childID": "69",
        "childMenuLabel": "Beaded Necklaces",
        "navLevel": "3"
    },
    {
        "parentID": "338",
        "parentMenuLabel": "Pendants",
        "childID": "76",
        "childMenuLabel": "Bib Necklaces",
        "navLevel": "3"
    },
    {
        "parentID": "338",
        "parentMenuLabel": "Pendants",
        "childID": "119",
        "childMenuLabel": "Chains",
        "navLevel": "3"
    },
    {
        "parentID": "338",
        "parentMenuLabel": "Pendants",
        "childID": "123",
        "childMenuLabel": "Charm Necklaces",
        "navLevel": "3"
    },
    {
        "parentID": "338",
        "parentMenuLabel": "Pendants",
        "childID": "126",
        "childMenuLabel": "Chokers",
        "navLevel": "3"
    },
    {
        "parentID": "338",
        "parentMenuLabel": "Pendants",
        "childID": "152",
        "childMenuLabel": "Crystal Necklaces",
        "navLevel": "3"
    },
    {
        "parentID": "338",
        "parentMenuLabel": "Pendants",
        "childID": "303",
        "childMenuLabel": "Monogram &amp; Name Necklaces",
        "navLevel": "3"
    },
    {
        "parentID": "338",
        "parentMenuLabel": "Pendants",
        "childID": "427",
        "childMenuLabel": "Tassel Necklaces",
        "navLevel": "3"
    },
    {
        "parentID": "348",
        "parentMenuLabel": "Pet Supplies",
        "childID": "27",
        "childMenuLabel": "All Pet Supplies",
        "navLevel": "3"
    },
    {
        "parentID": "348",
        "parentMenuLabel": "Pet Supplies",
        "childID": "342",
        "childMenuLabel": "Pet Bedding",
        "navLevel": "3"
    },
    {
        "parentID": "348",
        "parentMenuLabel": "Pet Supplies",
        "childID": "343",
        "childMenuLabel": "Pet Carriers &amp; Houses",
        "navLevel": "3"
    },
    {
        "parentID": "348",
        "parentMenuLabel": "Pet Supplies",
        "childID": "344",
        "childMenuLabel": "Pet Clothing &amp; Shoes",
        "navLevel": "3"
    },
    {
        "parentID": "348",
        "parentMenuLabel": "Pet Supplies",
        "childID": "345",
        "childMenuLabel": "Pet Collars &amp; Leashes",
        "navLevel": "3"
    },
    {
        "parentID": "348",
        "parentMenuLabel": "Pet Supplies",
        "childID": "346",
        "childMenuLabel": "Pet Furniture",
        "navLevel": "3"
    },
    {
        "parentID": "365",
        "parentMenuLabel": "Rings",
        "childID": "28",
        "childMenuLabel": "All Rings",
        "navLevel": "3"
    },
    {
        "parentID": "365",
        "parentMenuLabel": "Rings",
        "childID": "57",
        "childMenuLabel": "Bands",
        "navLevel": "3"
    },
    {
        "parentID": "365",
        "parentMenuLabel": "Rings",
        "childID": "300",
        "childMenuLabel": "Midi Rings",
        "navLevel": "3"
    },
    {
        "parentID": "365",
        "parentMenuLabel": "Rings",
        "childID": "306",
        "childMenuLabel": "Multi-Stone Rings",
        "navLevel": "3"
    },
    {
        "parentID": "365",
        "parentMenuLabel": "Rings",
        "childID": "389",
        "childMenuLabel": "Signet Rings",
        "navLevel": "3"
    },
    {
        "parentID": "365",
        "parentMenuLabel": "Rings",
        "childID": "398",
        "childMenuLabel": "Solitaire Rings",
        "navLevel": "3"
    },
    {
        "parentID": "365",
        "parentMenuLabel": "Rings",
        "childID": "405",
        "childMenuLabel": "Stackable Rings",
        "navLevel": "3"
    },
    {
        "parentID": "365",
        "parentMenuLabel": "Rings",
        "childID": "408",
        "childMenuLabel": "Statement Rings",
        "navLevel": "3"
    },
    {
        "parentID": "365",
        "parentMenuLabel": "Rings",
        "childID": "459",
        "childMenuLabel": "Wedding &amp; Engagement",
        "navLevel": "3"
    },
    {
        "parentID": "372",
        "parentMenuLabel": "Sculpting &amp; Forming",
        "childID": "29",
        "childMenuLabel": "All Sculpting &amp; Forming",
        "navLevel": "3"
    },
    {
        "parentID": "372",
        "parentMenuLabel": "Sculpting &amp; Forming",
        "childID": "114",
        "childMenuLabel": "Carving &amp; Whittling",
        "navLevel": "3"
    },
    {
        "parentID": "372",
        "parentMenuLabel": "Sculpting &amp; Forming",
        "childID": "117",
        "childMenuLabel": "Ceramics &amp; Pottery",
        "navLevel": "3"
    },
    {
        "parentID": "372",
        "parentMenuLabel": "Sculpting &amp; Forming",
        "childID": "299",
        "childMenuLabel": "Metalworking",
        "navLevel": "3"
    },
    {
        "parentID": "376",
        "parentMenuLabel": "Sewing &amp; Fiber",
        "childID": "30",
        "childMenuLabel": "All Sewing &amp; Fiber ",
        "navLevel": "3"
    },
    {
        "parentID": "376",
        "parentMenuLabel": "Sewing &amp; Fiber",
        "childID": "149",
        "childMenuLabel": "Crochet",
        "navLevel": "3"
    },
    {
        "parentID": "376",
        "parentMenuLabel": "Sewing &amp; Fiber",
        "childID": "150",
        "childMenuLabel": "Cross Stitch",
        "navLevel": "3"
    },
    {
        "parentID": "376",
        "parentMenuLabel": "Sewing &amp; Fiber",
        "childID": "185",
        "childMenuLabel": "Embroidery",
        "navLevel": "3"
    },
    {
        "parentID": "376",
        "parentMenuLabel": "Sewing &amp; Fiber",
        "childID": "272",
        "childMenuLabel": "Knitting",
        "navLevel": "3"
    },
    {
        "parentID": "376",
        "parentMenuLabel": "Sewing &amp; Fiber",
        "childID": "362",
        "childMenuLabel": "Quilting",
        "navLevel": "3"
    },
    {
        "parentID": "376",
        "parentMenuLabel": "Sewing &amp; Fiber",
        "childID": "375",
        "childMenuLabel": "Sewing",
        "navLevel": "3"
    },
    {
        "parentID": "438",
        "parentMenuLabel": "Toys",
        "childID": "51",
        "childMenuLabel": "Baby &amp; Toddler Toys",
        "navLevel": "3"
    },
    {
        "parentID": "438",
        "parentMenuLabel": "Toys",
        "childID": "173",
        "childMenuLabel": "Dolls &amp; Action Figures",
        "navLevel": "3"
    },
    {
        "parentID": "438",
        "parentMenuLabel": "Toys",
        "childID": "209",
        "childMenuLabel": "Games &amp; Puzzles",
        "navLevel": "3"
    },
    {
        "parentID": "438",
        "parentMenuLabel": "Toys",
        "childID": "268",
        "childMenuLabel": "Kids&apos; Crafts",
        "navLevel": "3"
    },
    {
        "parentID": "438",
        "parentMenuLabel": "Toys",
        "childID": "278",
        "childMenuLabel": "Learning &amp; School",
        "navLevel": "3"
    },
    {
        "parentID": "438",
        "parentMenuLabel": "Toys",
        "childID": "393",
        "childMenuLabel": "Slime &amp; Foam",
        "navLevel": "3"
    },
    {
        "parentID": "438",
        "parentMenuLabel": "Toys",
        "childID": "415",
        "childMenuLabel": "Stuffed Animals",
        "navLevel": "3"
    },
    {
        "parentID": "452",
        "parentMenuLabel": "Visual Arts",
        "childID": "104",
        "childMenuLabel": "Calligraphy &amp; Pens",
        "navLevel": "3"
    },
    {
        "parentID": "452",
        "parentMenuLabel": "Visual Arts",
        "childID": "137",
        "childMenuLabel": "Collage",
        "navLevel": "3"
    },
    {
        "parentID": "452",
        "parentMenuLabel": "Visual Arts",
        "childID": "175",
        "childMenuLabel": "Drawing &amp; Drafting",
        "navLevel": "3"
    },
    {
        "parentID": "452",
        "parentMenuLabel": "Visual Arts",
        "childID": "325",
        "childMenuLabel": "Painting",
        "navLevel": "3"
    },
    {
        "parentID": "452",
        "parentMenuLabel": "Visual Arts",
        "childID": "350",
        "childMenuLabel": "Photography",
        "navLevel": "3"
    },
    {
        "parentID": "452",
        "parentMenuLabel": "Visual Arts",
        "childID": "358",
        "childMenuLabel": "Printing &amp; Printmaking",
        "navLevel": "3"
    },
    {
        "parentID": "461",
        "parentMenuLabel": "Wedding Accessories",
        "childID": "35",
        "childMenuLabel": "All Wedding Accessories",
        "navLevel": "3"
    },
    {
        "parentID": "461",
        "parentMenuLabel": "Wedding Accessories",
        "childID": "55",
        "childMenuLabel": "Bags &amp; Purses",
        "navLevel": "3"
    },
    {
        "parentID": "461",
        "parentMenuLabel": "Wedding Accessories",
        "childID": "85",
        "childMenuLabel": "Bouquets &amp; Corsages",
        "navLevel": "3"
    },
    {
        "parentID": "461",
        "parentMenuLabel": "Wedding Accessories",
        "childID": "146",
        "childMenuLabel": "Cover Ups &amp; Scarves",
        "navLevel": "3"
    },
    {
        "parentID": "461",
        "parentMenuLabel": "Wedding Accessories",
        "childID": "157",
        "childMenuLabel": "Cummerbunds",
        "navLevel": "3"
    },
    {
        "parentID": "461",
        "parentMenuLabel": "Wedding Accessories",
        "childID": "229",
        "childMenuLabel": "Hair Accessories",
        "navLevel": "3"
    },
    {
        "parentID": "461",
        "parentMenuLabel": "Wedding Accessories",
        "childID": "236",
        "childMenuLabel": "Hats",
        "navLevel": "3"
    },
    {
        "parentID": "461",
        "parentMenuLabel": "Wedding Accessories",
        "childID": "312",
        "childMenuLabel": "Neckties",
        "navLevel": "3"
    },
    {
        "parentID": "461",
        "parentMenuLabel": "Wedding Accessories",
        "childID": "399",
        "childMenuLabel": "Something Blue",
        "navLevel": "3"
    },
    {
        "parentID": "461",
        "parentMenuLabel": "Wedding Accessories",
        "childID": "442",
        "childMenuLabel": "Umbrellas",
        "navLevel": "3"
    },
    {
        "parentID": "461",
        "parentMenuLabel": "Wedding Accessories",
        "childID": "449",
        "childMenuLabel": "Veils",
        "navLevel": "3"
    },
    {
        "parentID": "463",
        "parentMenuLabel": "Wedding Clothing",
        "childID": "177",
        "childMenuLabel": "Dresses",
        "navLevel": "3"
    },
    {
        "parentID": "463",
        "parentMenuLabel": "Wedding Clothing",
        "childID": "283",
        "childMenuLabel": "Lingerie &amp; Garters",
        "navLevel": "3"
    },
    {
        "parentID": "463",
        "parentMenuLabel": "Wedding Clothing",
        "childID": "418",
        "childMenuLabel": "Suits",
        "navLevel": "3"
    },
    {
        "parentID": "464",
        "parentMenuLabel": "Wedding Decorations",
        "childID": "37",
        "childMenuLabel": "All Wedding Decorations",
        "navLevel": "3"
    },
    {
        "parentID": "464",
        "parentMenuLabel": "Wedding Decorations",
        "childID": "61",
        "childMenuLabel": "Baskets &amp; Boxes",
        "navLevel": "3"
    },
    {
        "parentID": "464",
        "parentMenuLabel": "Wedding Decorations",
        "childID": "102",
        "childMenuLabel": "Cake Toppers",
        "navLevel": "3"
    },
    {
        "parentID": "464",
        "parentMenuLabel": "Wedding Decorations",
        "childID": "109",
        "childMenuLabel": "Candles &amp; Holders",
        "navLevel": "3"
    },
    {
        "parentID": "464",
        "parentMenuLabel": "Wedding Decorations",
        "childID": "116",
        "childMenuLabel": "Centerpieces",
        "navLevel": "3"
    },
    {
        "parentID": "464",
        "parentMenuLabel": "Wedding Decorations",
        "childID": "353",
        "childMenuLabel": "Plants",
        "navLevel": "3"
    },
    {
        "parentID": "464",
        "parentMenuLabel": "Wedding Decorations",
        "childID": "364",
        "childMenuLabel": "Ring Bearer Pillows",
        "navLevel": "3"
    },
    {
        "parentID": "464",
        "parentMenuLabel": "Wedding Decorations",
        "childID": "374",
        "childMenuLabel": "Serving &amp; Dining",
        "navLevel": "3"
    },
    {
        "parentID": "466",
        "parentMenuLabel": "Wedding gifts",
        "childID": "5",
        "childMenuLabel": "Albums &amp; Scrapbooks",
        "navLevel": "3"
    },
    {
        "parentID": "466",
        "parentMenuLabel": "Wedding gifts",
        "childID": "38",
        "childMenuLabel": "All Wedding Gifts",
        "navLevel": "3"
    },
    {
        "parentID": "466",
        "parentMenuLabel": "Wedding gifts",
        "childID": "94",
        "childMenuLabel": "Bridesmaids Gifts",
        "navLevel": "3"
    },
    {
        "parentID": "466",
        "parentMenuLabel": "Wedding gifts",
        "childID": "216",
        "childMenuLabel": "Gifts For The Couple",
        "navLevel": "3"
    },
    {
        "parentID": "466",
        "parentMenuLabel": "Wedding gifts",
        "childID": "226",
        "childMenuLabel": "Groomsmen Gifts",
        "navLevel": "3"
    },
    {
        "parentID": "466",
        "parentMenuLabel": "Wedding gifts",
        "childID": "227",
        "childMenuLabel": "Guest Books",
        "navLevel": "3"
    },
    {
        "parentID": "466",
        "parentMenuLabel": "Wedding gifts",
        "childID": "356",
        "childMenuLabel": "Portraits &amp; Frames",
        "navLevel": "3"
    },
    {
        "parentID": "466",
        "parentMenuLabel": "Wedding gifts",
        "childID": "465",
        "childMenuLabel": "Wedding Favors",
        "navLevel": "3"
    },
    {
        "parentID": "469",
        "parentMenuLabel": "Wedding Jewelry",
        "childID": "90",
        "childMenuLabel": "Bracelets",
        "navLevel": "3"
    },
    {
        "parentID": "469",
        "parentMenuLabel": "Wedding Jewelry",
        "childID": "181",
        "childMenuLabel": "Earrings",
        "navLevel": "3"
    },
    {
        "parentID": "469",
        "parentMenuLabel": "Wedding Jewelry",
        "childID": "262",
        "childMenuLabel": "Jewelry Sets",
        "navLevel": "3"
    },
    {
        "parentID": "469",
        "parentMenuLabel": "Wedding Jewelry",
        "childID": "311",
        "childMenuLabel": "Necklaces",
        "navLevel": "3"
    },
    {
        "parentID": "469",
        "parentMenuLabel": "Wedding Jewelry",
        "childID": "365",
        "childMenuLabel": "Rings",
        "navLevel": "3"
    },
    {
        "parentID": "474",
        "parentMenuLabel": "Women&apos;s",
        "childID": "40",
        "childMenuLabel": "All Women&apos;s",
        "navLevel": "3"
    },
    {
        "parentID": "474",
        "parentMenuLabel": "Women&apos;s",
        "childID": "367",
        "childMenuLabel": "Sandals",
        "navLevel": "3"
    },
    {
        "parentID": "474",
        "parentMenuLabel": "Women&apos;s",
        "childID": "475",
        "childMenuLabel": "Women&apos;s Clothing",
        "navLevel": "3"
    },
    {
        "parentID": "474",
        "parentMenuLabel": "Women&apos;s",
        "childID": "476",
        "childMenuLabel": "Women&apos;s Shoes",
        "navLevel": "3"
    },
    {
        "parentID": "88",
        "parentMenuLabel": "Boys&apos; Clothing",
        "childID": "255",
        "childMenuLabel": "Jackets &amp; Coats",
        "navLevel": "4"
    },
    {
        "parentID": "88",
        "parentMenuLabel": "Boys&apos; Clothing",
        "childID": "436",
        "childMenuLabel": "Tops",
        "navLevel": "4"
    },
    {
        "parentID": "177",
        "parentMenuLabel": "Dresses",
        "childID": "91",
        "childMenuLabel": "Bridal Gowns &amp; Separates",
        "navLevel": "4"
    },
    {
        "parentID": "177",
        "parentMenuLabel": "Dresses",
        "childID": "93",
        "childMenuLabel": "Bridesmaid Dresses",
        "navLevel": "4"
    },
    {
        "parentID": "177",
        "parentMenuLabel": "Dresses",
        "childID": "200",
        "childMenuLabel": "Flower Girl Dresses",
        "navLevel": "4"
    },
    {
        "parentID": "177",
        "parentMenuLabel": "Dresses",
        "childID": "304",
        "childMenuLabel": "Mother of the Bride Dresses",
        "navLevel": "4"
    },
    {
        "parentID": "198",
        "parentMenuLabel": "Floral &amp; Garden Crafts",
        "childID": "199",
        "childMenuLabel": "Floral Arranging",
        "navLevel": "4"
    },
    {
        "parentID": "198",
        "parentMenuLabel": "Floral &amp; Garden Crafts",
        "childID": "210",
        "childMenuLabel": "Gardening &amp; Plants",
        "navLevel": "4"
    },
    {
        "parentID": "217",
        "parentMenuLabel": "Girls&apos; Clothing",
        "childID": "177",
        "childMenuLabel": "Dresses",
        "navLevel": "4"
    },
    {
        "parentID": "217",
        "parentMenuLabel": "Girls&apos; Clothing",
        "childID": "255",
        "childMenuLabel": "Jackets &amp; Coats",
        "navLevel": "4"
    },
    {
        "parentID": "217",
        "parentMenuLabel": "Girls&apos; Clothing",
        "childID": "392",
        "childMenuLabel": "Skirts",
        "navLevel": "4"
    },
    {
        "parentID": "217",
        "parentMenuLabel": "Girls&apos; Clothing",
        "childID": "436",
        "childMenuLabel": "Tops",
        "navLevel": "4"
    },
    {
        "parentID": "229",
        "parentMenuLabel": "Hair Accessories",
        "childID": "60",
        "childMenuLabel": "Barrettes &amp; Clips",
        "navLevel": "4"
    },
    {
        "parentID": "229",
        "parentMenuLabel": "Hair Accessories",
        "childID": "161",
        "childMenuLabel": "Decorative Combs",
        "navLevel": "4"
    },
    {
        "parentID": "229",
        "parentMenuLabel": "Hair Accessories",
        "childID": "192",
        "childMenuLabel": "Fascinators &amp; Mini Hats",
        "navLevel": "4"
    },
    {
        "parentID": "229",
        "parentMenuLabel": "Hair Accessories",
        "childID": "231",
        "childMenuLabel": "Hair Jewelry",
        "navLevel": "4"
    },
    {
        "parentID": "229",
        "parentMenuLabel": "Hair Accessories",
        "childID": "232",
        "childMenuLabel": "Hair Pins",
        "navLevel": "4"
    },
    {
        "parentID": "229",
        "parentMenuLabel": "Hair Accessories",
        "childID": "238",
        "childMenuLabel": "Headbands",
        "navLevel": "4"
    },
    {
        "parentID": "229",
        "parentMenuLabel": "Hair Accessories",
        "childID": "479",
        "childMenuLabel": "Wreaths &amp; Tiaras",
        "navLevel": "4"
    },
    {
        "parentID": "234",
        "parentMenuLabel": "Handbags",
        "childID": "134",
        "childMenuLabel": "Clutches &amp; Evening Bags",
        "navLevel": "4"
    },
    {
        "parentID": "234",
        "parentMenuLabel": "Handbags",
        "childID": "387",
        "childMenuLabel": "Shoulder Bags",
        "navLevel": "4"
    },
    {
        "parentID": "244",
        "parentMenuLabel": "Home Décor",
        "childID": "109",
        "childMenuLabel": "Candles &amp; Holders",
        "navLevel": "4"
    },
    {
        "parentID": "244",
        "parentMenuLabel": "Home Décor",
        "childID": "130",
        "childMenuLabel": "Clocks",
        "navLevel": "4"
    },
    {
        "parentID": "244",
        "parentMenuLabel": "Home Décor",
        "childID": "162",
        "childMenuLabel": "Decorative Pillows",
        "navLevel": "4"
    },
    {
        "parentID": "244",
        "parentMenuLabel": "Home Décor",
        "childID": "352",
        "childMenuLabel": "Picture Frames &amp; Displays",
        "navLevel": "4"
    },
    {
        "parentID": "244",
        "parentMenuLabel": "Home Décor",
        "childID": "448",
        "childMenuLabel": "Vases",
        "navLevel": "4"
    },
    {
        "parentID": "244",
        "parentMenuLabel": "Home Décor",
        "childID": "453",
        "childMenuLabel": "Wall Décor",
        "navLevel": "4"
    },
    {
        "parentID": "253",
        "parentMenuLabel": "Invitations &amp; Announcements",
        "childID": "368",
        "childMenuLabel": "Save The Dates",
        "navLevel": "4"
    },
    {
        "parentID": "253",
        "parentMenuLabel": "Invitations &amp; Announcements",
        "childID": "467",
        "childMenuLabel": "Wedding Invitation Kits",
        "navLevel": "4"
    },
    {
        "parentID": "253",
        "parentMenuLabel": "Invitations &amp; Announcements",
        "childID": "468",
        "childMenuLabel": "Wedding Invitations",
        "navLevel": "4"
    },
    {
        "parentID": "253",
        "parentMenuLabel": "Invitations &amp; Announcements",
        "childID": "471",
        "childMenuLabel": "Wedding Templates",
        "navLevel": "4"
    },
    {
        "parentID": "261",
        "parentMenuLabel": "Jewelry Making &amp; Beading",
        "childID": "70",
        "childMenuLabel": "Beads",
        "navLevel": "4"
    },
    {
        "parentID": "261",
        "parentMenuLabel": "Jewelry Making &amp; Beading",
        "childID": "100",
        "childMenuLabel": "Cabochons",
        "navLevel": "4"
    },
    {
        "parentID": "261",
        "parentMenuLabel": "Jewelry Making &amp; Beading",
        "childID": "124",
        "childMenuLabel": "Charms",
        "navLevel": "4"
    },
    {
        "parentID": "261",
        "parentMenuLabel": "Jewelry Making &amp; Beading",
        "childID": "260",
        "childMenuLabel": "Jewelry Findings",
        "navLevel": "4"
    },
    {
        "parentID": "261",
        "parentMenuLabel": "Jewelry Making &amp; Beading",
        "childID": "338",
        "childMenuLabel": "Pendants",
        "navLevel": "4"
    },
    {
        "parentID": "296",
        "parentMenuLabel": "Men&apos;s Clothing",
        "childID": "255",
        "childMenuLabel": "Jackets &amp; Coats",
        "navLevel": "4"
    },
    {
        "parentID": "296",
        "parentMenuLabel": "Men&apos;s Clothing",
        "childID": "382",
        "childMenuLabel": "Shirts",
        "navLevel": "4"
    },
    {
        "parentID": "296",
        "parentMenuLabel": "Men&apos;s Clothing",
        "childID": "386",
        "childMenuLabel": "Shorts",
        "navLevel": "4"
    },
    {
        "parentID": "365",
        "parentMenuLabel": "Rings",
        "childID": "92",
        "childMenuLabel": "Bridal Sets",
        "navLevel": "4"
    },
    {
        "parentID": "365",
        "parentMenuLabel": "Rings",
        "childID": "186",
        "childMenuLabel": "Engagement Rings",
        "navLevel": "4"
    },
    {
        "parentID": "365",
        "parentMenuLabel": "Rings",
        "childID": "462",
        "childMenuLabel": "Wedding Bands",
        "navLevel": "4"
    },
    {
        "parentID": "374",
        "parentMenuLabel": "Serving &amp; Dining",
        "childID": "101",
        "childMenuLabel": "Cake Servers &amp; Knives",
        "navLevel": "4"
    },
    {
        "parentID": "374",
        "parentMenuLabel": "Serving &amp; Dining",
        "childID": "425",
        "childMenuLabel": "Table Décor",
        "navLevel": "4"
    },
    {
        "parentID": "459",
        "parentMenuLabel": "Wedding &amp; Engagement",
        "childID": "92",
        "childMenuLabel": "Bridal Sets",
        "navLevel": "4"
    },
    {
        "parentID": "459",
        "parentMenuLabel": "Wedding &amp; Engagement",
        "childID": "186",
        "childMenuLabel": "Engagement Rings",
        "navLevel": "4"
    },
    {
        "parentID": "459",
        "parentMenuLabel": "Wedding &amp; Engagement",
        "childID": "360",
        "childMenuLabel": "Promise Rings",
        "navLevel": "4"
    },
    {
        "parentID": "459",
        "parentMenuLabel": "Wedding &amp; Engagement",
        "childID": "462",
        "childMenuLabel": "Wedding Bands",
        "navLevel": "4"
    },
    {
        "parentID": "475",
        "parentMenuLabel": "Women&apos;s Clothing",
        "childID": "177",
        "childMenuLabel": "Dresses",
        "navLevel": "4"
    },
    {
        "parentID": "475",
        "parentMenuLabel": "Women&apos;s Clothing",
        "childID": "255",
        "childMenuLabel": "Jackets &amp; Coats",
        "navLevel": "4"
    },
    {
        "parentID": "475",
        "parentMenuLabel": "Women&apos;s Clothing",
        "childID": "327",
        "childMenuLabel": "Pants &amp; Capris",
        "navLevel": "4"
    },
    {
        "parentID": "475",
        "parentMenuLabel": "Women&apos;s Clothing",
        "childID": "386",
        "childMenuLabel": "Shorts",
        "navLevel": "4"
    },
    {
        "parentID": "475",
        "parentMenuLabel": "Women&apos;s Clothing",
        "childID": "392",
        "childMenuLabel": "Skirts",
        "navLevel": "4"
    },
    {
        "parentID": "475",
        "parentMenuLabel": "Women&apos;s Clothing",
        "childID": "424",
        "childMenuLabel": "Swimwear",
        "navLevel": "4"
    },
    {
        "parentID": "475",
        "parentMenuLabel": "Women&apos;s Clothing",
        "childID": "437",
        "childMenuLabel": "Tops &amp; Tees",
        "navLevel": "4"
    }
]
''';