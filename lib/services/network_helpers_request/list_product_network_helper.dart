import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shop_app/services/network_helper_models/product_category_network_helper_model.dart';
import 'dart:convert';

import 'package:shop_app/view_models/provider/all_providers.dart';

import '../all_services.dart';

class ListProductNetworkHelper {
  static Future<TheTopCategoryRelevance> getListProductNetwork(
      String categoryID, BuildContext context,String topCategoryName) async {
    var response = await http.post(
      Uri.parse("https://api.iqstars.me/Clique/ListProduct.aspx"),
      body: {
        "CategoryID": categoryID,
      },
    );
    print("-------------------");
    print(response.body);
    print("-------------------");
    String listItemProductModelSpecificCategory =
    response.body.substring(0, response.body.indexOf('][') + 1);


    List<ProductCategoryNetworkModel> listProductsCategoryNetworkModel =
        productCategoryNetworkModelFromJson(
            listItemProductModelSpecificCategory);

    List<SubCategoryNetworkModel> listSubCategoriesNetworkModel =
        getSubCategoryNetworkModel(
      listItemProductModelSpecificCategory,
          response.body,
      context,
    );

  return TheTopCategoryRelevance(productCategoryList: listProductsCategoryNetworkModel, subCategoriesList: listSubCategoriesNetworkModel,topCategoryName: topCategoryName);
  }

  static List<SubCategoryNetworkModel> getSubCategoryNetworkModel(
      String listItemProductModelSpecificCategory,
      String responseBody,
      BuildContext context) {
    String subCategories =
        responseBody.replaceAll(listItemProductModelSpecificCategory, "");

    return subCategoryNetworkModelFromJson(subCategories);
  }
}

String listProducts=''' [
    {
        "productID": "1",
        "price": "5826.50",
        "discountedPrice": "4661.20",
        "stockQty": "100",
        "mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856171/clique/Products/New%20folder%20%283%29/il_794xN.3079101188_19u4.jpg",
        "mediaType": "Image",
        "productName": "2&apos;7&quot; x 24&apos;1&quot; ft Extra Long Narrow Oushak Rug Runner, Vintage Turkish Rug Runner, Hallway Runner Rug, Stair Rug Runner, Bohemian Runner Rug !",
        "bestSellerTag": "N",
        "giftWrapTag": "N",
        "freeShippingTag": "free",
        "sellerName": "Safran Carpet"
    },
    {
        "productID": "4",
        "price": "62.37",
        "discountedPrice": "0.00",
        "stockQty": "100",
        "mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856160/clique/Products/New%20folder%20%2814%29/il_794xN.2443370719_bvkq.jpg",
        "mediaType": "Image",
        "productName": "Lobster Print, Quirky Art, Funny Quote Art, Rude Art, Pink Lobster Print, What the Hell, Lobster Gifts, Lobster Poster, Lobster Quote, Art",
        "bestSellerTag": "N",
        "giftWrapTag": "N",
        "freeShippingTag": "",
        "sellerName": "Alissa Levy"
    },
    {
        "productID": "5",
        "price": "146.74",
        "discountedPrice": "0.00",
        "stockQty": "100",
        "mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856166/clique/Products/New%20folder%20%282%29/il_794xN.3158675211_l53r.jpg",
        "mediaType": "Image",
        "productName": "Intuitively Chosen Raw Crystal Set | Natural Crystal Collection | Rough Crystal Healing Crystals and Stones Geode Bohemian Decor Amethyst",
        "bestSellerTag": "Y",
        "giftWrapTag": "N",
        "freeShippingTag": "",
        "sellerName": "Elica"
    },
    {
        "productID": "9",
        "price": "1682.44",
        "discountedPrice": "0.00",
        "stockQty": "100",
        "mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856182/clique/Products/New%20folder%20%288%29/il_794xN.3165162211_kxmp.jpg",
        "mediaType": "Image",
        "productName": "Bestseller Butterfly Sleeves Boho Ivory wedding dress with pockets #1267",
        "bestSellerTag": "N",
        "giftWrapTag": "Y",
        "freeShippingTag": "free",
        "sellerName": "Sheryll Raz Gold"
    },
    {
        "productID": "13",
        "price": "151.16",
        "discountedPrice": "0.00",
        "stockQty": "100",
        "mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856173/clique/Products/New%20folder%20%284%29/il_794xN.379040164_m5ja.jpg",
        "mediaType": "Image",
        "productName": "Triple Raw Emerald Ring, Raw Stone Ring, Emerald Birthstone Jewelry, Raw Gemstone Ring, Unique Engagement Ring, Raw Gemstone Healing Crystal",
        "bestSellerTag": "Y",
        "giftWrapTag": "Y",
        "freeShippingTag": "",
        "sellerName": "Feist Style"
    },
    {
        "productID": "10",
        "price": "9031.84",
        "discountedPrice": "0.00",
        "stockQty": "100",
        "mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856179/clique/Products/New%20folder%20%287%29/il_794xN.3086666602_syu6.jpg",
        "mediaType": "Image",
        "productName": "Black wedding dress the original from Feist Style",
        "bestSellerTag": "N",
        "giftWrapTag": "Y",
        "freeShippingTag": "free",
        "sellerName": "Irene"
    },
    {
        "productID": "14",
        "price": "1613.60",
        "discountedPrice": "0.00",
        "stockQty": "100",
        "mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856179/clique/Products/New%20folder%20%286%29/il_794xN.2579877680_tg90.jpg",
        "mediaType": "Image",
        "productName": "Lace and White Camo Wedding Prom Gown",
        "bestSellerTag": "N",
        "giftWrapTag": "N",
        "freeShippingTag": "",
        "sellerName": "Alya"
    },
    {
        "productID": "15",
        "price": "1301.95",
        "discountedPrice": "1041.54",
        "stockQty": "100",
        "mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856155/clique/Products/New%20folder%20%2812%29/il_794xN.1452830271_rlyj.jpg",
        "mediaType": "Image",
        "productName": "embroidered pillow, linen lilac cushion, embroidery cushion, ethnic print pillow, linen kids cushion, colorful line pillow",
        "bestSellerTag": "N",
        "giftWrapTag": "Y",
        "freeShippingTag": "",
        "sellerName": "Elizabeth Bailey Christenbury"
    },
    {
        "productID": "11",
        "price": "4496.56",
        "discountedPrice": "3147.59",
        "stockQty": "100",
        "mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856160/clique/Products/New%20folder%20%2814%29/il_794xN.2443370719_bvkq.jpg",
        "mediaType": "Image",
        "productName": "Nude wedding dress, bohemian wedding dress, boho wedding dress, bridal dress, tulle wedding dress, lace wedding dress, ivory wedding dress",
        "bestSellerTag": "N",
        "giftWrapTag": "N",
        "freeShippingTag": "free",
        "sellerName": "Emily Applegate"
    },
    {
        "productID": "12",
        "price": "249.57",
        "discountedPrice": "199.66",
        "stockQty": "100",
        "mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856173/clique/Products/New%20folder%20%285%29/il_794xN.1049046873_231p.jpg",
        "mediaType": "Image",
        "productName": "Sapphire Jewelry - Birthstone Jewelry - Gemstone Ring - Unique Silver Ring - Dainty Silver Ring - Sapphire Ring - Gemstone Jewelry",
        "bestSellerTag": "N",
        "giftWrapTag": "Y",
        "freeShippingTag": "",
        "sellerName": "Olga Nazarova"
    }
][
    {
        "topMenuID": "55",
        "topMenuName": "Bags &amp; Purses",
        "subMenu": [
            {
                "subMenuID": "54",
                "subMenuName": "Backpacks"
            },
            {
                "subMenuID": "164",
                "subMenuName": "Diaper Bags"
            },
            {
                "subMenuID": "234",
                "subMenuName": "Handbags"
            },
            {
                "subMenuID": "287",
                "subMenuName": "Luggage &amp; Duffel Bags"
            }
        ]
    },
    {
        "topMenuID": "267",
        "topMenuName": "Kids&apos; &amp; Baby",
        "subMenu": [
            {
                "subMenuID": "52",
                "subMenuName": "Baby Boys&apos; Clothing"
            },
            {
                "subMenuID": "53",
                "subMenuName": "Baby Girls&apos; Clothing"
            },
            {
                "subMenuID": "88",
                "subMenuName": "Boys&apos; Clothing"
            },
            {
                "subMenuID": "89",
                "subMenuName": "Boys&apos; Shoes"
            }
        ]
    },
    {
        "topMenuID": "295",
        "topMenuName": "Men&apos;s",
        "subMenu": [
            {
                "subMenuID": "296",
                "subMenuName": "Men&apos;s Clothing"
            },
            {
                "subMenuID": "297",
                "subMenuName": "Men&apos;s Shoes"
            }
        ]
    },
    {
        "topMenuID": "474",
        "topMenuName": "Women&apos;s",
        "subMenu": [
            {
                "subMenuID": "367",
                "subMenuName": "Sandals"
            },
            {
                "subMenuID": "475",
                "subMenuName": "Women&apos;s Clothing"
            },
            {
                "subMenuID": "476",
                "subMenuName": "Women&apos;s Shoes"
            }
        ]
    }
]''';