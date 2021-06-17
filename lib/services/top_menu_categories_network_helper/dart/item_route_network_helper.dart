import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'network_helper_models/item_route_network_helper_model.dart';
import 'dart:convert';

class ItemRouteNetworkHelper {
  static Future<ItemProductModel> getItemProductModel(
       String productId) async {
    // var response = await http.post(
    //     Uri.parse("https://api.iqstars.me/Clique/ListProductDetail.aspx"),
    //     body: {
    //       "productID": productId,
    //     });

   return  ItemProductModel.fromJson(
      json.decode(itemProduct)[0],
    );
  }
}
String itemProduct=''' [
    {
        "productName": "Sapphire Jewelry - Birthstone Jewelry - Gemstone Ring - Unique Silver Ring - Dainty Silver Ring - Sapphire Ring - Gemstone Jewelry",
        "productDesc": "A SIGNATURE &quot;insanely comfy&quot; Yellow Leaf Hammock- 100% handwoven and technically engineered for extreme comfort, durability &amp; strength.&lt;br&gt;&lt;br&gt;This hammock is handwoven using a soft-spun acrylic yarn that is UV RESISTANT + WEATHERPROOF, so it is not susceptible to mold or mildew and fairs well in the elements (surprisingly rare among hammocks!). They&apos;re also extremely soft on your skin (THE SOFTEST HAMMOCK YOU WILL FIND-- we promise!) and don&apos;t leave that &quot;waffle-weave&quot; imprint that you get in other rope hammocks.&lt;br&gt;&lt;br&gt;AVAILABLE IN 2 SIZES: DOUBLE OR KING&lt;br&gt;&lt;br&gt;DOUBLE (perfect for 1-2 people):&lt;br&gt;* Capacity: 400 lbs.&lt;br&gt;* Bed dimensions: 6 ft. L x 7.5 ft. W&lt;br&gt;* Product weight: 1.7 lbs.&lt;br&gt;* 100% Handwoven using 3.2 miles of ultra-soft yarn&lt;br&gt;* Production Time: 6-7 days&lt;br&gt;* Optimal Hanging Distance: 9-10 ft.&lt;br&gt;* Optimal Hanging Height: About 5-6 ft.&lt;br&gt;&lt;br&gt;KING-SIZE (perfect for 2+ people):&lt;br&gt;* Capacity: 550 lbs.&lt;br&gt;* Bed dimensions: 7 ft. L x 9 ft. W&lt;br&gt;* Product weight: 2.8 lbs.&lt;br&gt;* 100% Handwoven using 4.3 miles of ultra-soft yarn&lt;br&gt;* Production Time: 9-10 days&lt;br&gt;* Optimal Hanging Length: 10-12 ft.&lt;br&gt;* Optimal Hanging Height: 5-6 ft.&lt;br&gt;&lt;br&gt;Color(s): Cobalt Blue + Peacock Blue + Blaze Orange&lt;br&gt;&lt;br&gt;(Compatible with hammock stands-- inquire for recommendations)&lt;br&gt;&lt;br&gt;Each hammock packs down into a portable canvas tote that is the size of a small football; yet they also expand far &amp; wide to support up to 550 lbs… so a lot of people purchase them for their home as a semi-permanent installation + use them for camping + travel.",
        "productType": "Physical",
        "bestSellerTag": "N",
        "giftWrapTag": "Y",
        "localTax": "Local taxes included",
        "processingTimeframe": "Estimate",
        "estimationFrom": "Jun 2",
        "estimationTo": "Jun 9-16",
        "timeIndicator": "Jun 11-23",
        "shippingCost": "62.39",
        "returnExchangeNote": "Accepted",
        "shipFrom": "United States",
        "shopPolicy": "I gladly accept returns, exchanges, and cancellations&lt;br&gt;Contact me within: 3 days of delivery&lt;br&gt;Ship items back within: 7 days of delivery&lt;br&gt;Request a cancellation within: 24 hours of purchase&lt;br&gt;The following items can&apos;t be returned or exchanged&lt;br&gt;Because of the nature of these items, unless they arrive damaged or defective, I can&apos;t accept returns for:&lt;br&gt;Custom or personalized orders&lt;br&gt;Perishable products (like food or flowers)&lt;br&gt;Digital downloads&lt;br&gt;Intimate items (for health/hygiene reasons)&lt;br&gt;Items on sale&lt;br&gt;Conditions of return&lt;br&gt;Buyers are responsible for return shipping costs. If the item is not returned in its original condition, the buyer is responsible for any loss in value.&lt;br&gt;Questions about your order?&lt;br&gt;Please contact me if you have any problems with your order.",
        "salesTerms": " ",
        "productionPartner": " ",
        "schedule": "Jun 11-23",
        "deliveryPolicy": " ",
        "productionPolicy": " ",
        "currency": "RM",
        "creatorType": "",
        "productionDate": "",
        "productUse": "",
        "primaryColor": "",
        "secondaryColor": "",
        "sellerName": "Olga Nazarova",
        "sellerPhoto": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856185/clique/Seller/15.jpg",
        "sellerLocation": "Malaysia",
        "materials": [],
        "options": [
            {
                "optionLabel": "Product",
                "optionValue": "Base",
                "optionTag": "P",
                "price": "249.57",
                "discountedPrice": "199.66",
                "discountIndicator": "Yes",
                "discountEOD": "",
                "stockQty": "100",
                "personalizationNote": ""
            },
            {
                "optionLabel": "Finish",
                "optionValue": "925K Sterling Silver",
                "optionTag": "O",
                "price": "0.00",
                "discountedPrice": "0.00",
                "discountIndicator": "No",
                "discountEOD": "",
                "stockQty": "100",
                "personalizationNote": ""
            },
            {
                "optionLabel": "Finish",
                "optionValue": "Rose Gold Filled",
                "optionTag": "O",
                "price": "0.00",
                "discountedPrice": "0.00",
                "discountIndicator": "No",
                "discountEOD": "",
                "stockQty": "100",
                "personalizationNote": ""
            },
            {
                "optionLabel": "Finish",
                "optionValue": "Yellow Gold Filled",
                "optionTag": "O",
                "price": "0.00",
                "discountedPrice": "0.00",
                "discountIndicator": "No",
                "discountEOD": "",
                "stockQty": "100",
                "personalizationNote": ""
            },
            {
                "optionLabel": "Ring Size",
                "optionValue": "3 US",
                "optionTag": "O",
                "price": "0.00",
                "discountedPrice": "0.00",
                "discountIndicator": "No",
                "discountEOD": "",
                "stockQty": "100",
                "personalizationNote": ""
            },
            {
                "optionLabel": "Ring Size",
                "optionValue": "3 1/4 US",
                "optionTag": "O",
                "price": "0.00",
                "discountedPrice": "0.00",
                "discountIndicator": "No",
                "discountEOD": "",
                "stockQty": "100",
                "personalizationNote": ""
            },
            {
                "optionLabel": "Ring Size",
                "optionValue": "3 1/2 US",
                "optionTag": "O",
                "price": "0.00",
                "discountedPrice": "0.00",
                "discountIndicator": "No",
                "discountEOD": "",
                "stockQty": "100",
                "personalizationNote": ""
            },
            {
                "optionLabel": "Ring Size",
                "optionValue": "3 3/4 US",
                "optionTag": "O",
                "price": "0.00",
                "discountedPrice": "0.00",
                "discountIndicator": "No",
                "discountEOD": "",
                "stockQty": "100",
                "personalizationNote": ""
            },
            {
                "optionLabel": "Ring Size",
                "optionValue": "4 US",
                "optionTag": "O",
                "price": "0.00",
                "discountedPrice": "0.00",
                "discountIndicator": "No",
                "discountEOD": "",
                "stockQty": "100",
                "personalizationNote": ""
            },
            {
                "optionLabel": "Ring Size",
                "optionValue": "4 1/4 US",
                "optionTag": "O",
                "price": "0.00",
                "discountedPrice": "0.00",
                "discountIndicator": "No",
                "discountEOD": "",
                "stockQty": "100",
                "personalizationNote": ""
            },
            {
                "optionLabel": "Ring Size",
                "optionValue": "4 1/2 US",
                "optionTag": "O",
                "price": "0.00",
                "discountedPrice": "0.00",
                "discountIndicator": "No",
                "discountEOD": "",
                "stockQty": "100",
                "personalizationNote": ""
            },
            {
                "optionLabel": "Ring Size",
                "optionValue": "4 3/4 US",
                "optionTag": "O",
                "price": "0.00",
                "discountedPrice": "0.00",
                "discountIndicator": "No",
                "discountEOD": "",
                "stockQty": "100",
                "personalizationNote": ""
            },
            {
                "optionLabel": "Ring Size",
                "optionValue": "5 US",
                "optionTag": "O",
                "price": "0.00",
                "discountedPrice": "0.00",
                "discountIndicator": "No",
                "discountEOD": "",
                "stockQty": "100",
                "personalizationNote": ""
            },
            {
                "optionLabel": "Ring Size",
                "optionValue": "5 1/4 US",
                "optionTag": "O",
                "price": "0.00",
                "discountedPrice": "0.00",
                "discountIndicator": "No",
                "discountEOD": "",
                "stockQty": "100",
                "personalizationNote": ""
            },
            {
                "optionLabel": "Ring Size",
                "optionValue": "5 1/2 US",
                "optionTag": "O",
                "price": "0.00",
                "discountedPrice": "0.00",
                "discountIndicator": "No",
                "discountEOD": "",
                "stockQty": "100",
                "personalizationNote": ""
            },
            {
                "optionLabel": "Ring Size",
                "optionValue": "5 3/4 US",
                "optionTag": "O",
                "price": "0.00",
                "discountedPrice": "0.00",
                "discountIndicator": "No",
                "discountEOD": "",
                "stockQty": "100",
                "personalizationNote": ""
            },
            {
                "optionLabel": "Ring Size",
                "optionValue": "6 US",
                "optionTag": "O",
                "price": "0.00",
                "discountedPrice": "0.00",
                "discountIndicator": "No",
                "discountEOD": "",
                "stockQty": "100",
                "personalizationNote": ""
            },
            {
                "optionLabel": "Ring Size",
                "optionValue": "6 1/4 US",
                "optionTag": "O",
                "price": "0.00",
                "discountedPrice": "0.00",
                "discountIndicator": "No",
                "discountEOD": "",
                "stockQty": "100",
                "personalizationNote": ""
            },
            {
                "optionLabel": "Ring Size",
                "optionValue": "6 1/2 US",
                "optionTag": "O",
                "price": "0.00",
                "discountedPrice": "0.00",
                "discountIndicator": "No",
                "discountEOD": "",
                "stockQty": "100",
                "personalizationNote": ""
            },
            {
                "optionLabel": "Ring Size",
                "optionValue": "6 3/4 US",
                "optionTag": "O",
                "price": "0.00",
                "discountedPrice": "0.00",
                "discountIndicator": "No",
                "discountEOD": "",
                "stockQty": "100",
                "personalizationNote": ""
            },
            {
                "optionLabel": "Ring Size",
                "optionValue": "7 US",
                "optionTag": "O",
                "price": "0.00",
                "discountedPrice": "0.00",
                "discountIndicator": "No",
                "discountEOD": "",
                "stockQty": "100",
                "personalizationNote": ""
            },
            {
                "optionLabel": "Ring Size",
                "optionValue": "7 1/4 US",
                "optionTag": "O",
                "price": "0.00",
                "discountedPrice": "0.00",
                "discountIndicator": "No",
                "discountEOD": "",
                "stockQty": "100",
                "personalizationNote": ""
            },
            {
                "optionLabel": "Ring Size",
                "optionValue": "7 1/2 US",
                "optionTag": "O",
                "price": "0.00",
                "discountedPrice": "0.00",
                "discountIndicator": "No",
                "discountEOD": "",
                "stockQty": "100",
                "personalizationNote": ""
            },
            {
                "optionLabel": "Ring Size",
                "optionValue": "7 3/4 US",
                "optionTag": "O",
                "price": "0.00",
                "discountedPrice": "0.00",
                "discountIndicator": "No",
                "discountEOD": "",
                "stockQty": "100",
                "personalizationNote": ""
            },
            {
                "optionLabel": "Ring Size",
                "optionValue": "8 US",
                "optionTag": "O",
                "price": "0.00",
                "discountedPrice": "0.00",
                "discountIndicator": "No",
                "discountEOD": "",
                "stockQty": "100",
                "personalizationNote": ""
            },
            {
                "optionLabel": "Ring Size",
                "optionValue": "8 1/4 US",
                "optionTag": "O",
                "price": "0.00",
                "discountedPrice": "0.00",
                "discountIndicator": "No",
                "discountEOD": "",
                "stockQty": "100",
                "personalizationNote": ""
            },
            {
                "optionLabel": "Ring Size",
                "optionValue": "8 1/2 US",
                "optionTag": "O",
                "price": "0.00",
                "discountedPrice": "0.00",
                "discountIndicator": "No",
                "discountEOD": "",
                "stockQty": "100",
                "personalizationNote": ""
            },
            {
                "optionLabel": "Ring Size",
                "optionValue": "8 3/4 US",
                "optionTag": "O",
                "price": "0.00",
                "discountedPrice": "0.00",
                "discountIndicator": "No",
                "discountEOD": "",
                "stockQty": "100",
                "personalizationNote": ""
            },
            {
                "optionLabel": "Ring Size",
                "optionValue": "9 US",
                "optionTag": "O",
                "price": "0.00",
                "discountedPrice": "0.00",
                "discountIndicator": "No",
                "discountEOD": "",
                "stockQty": "100",
                "personalizationNote": ""
            },
            {
                "optionLabel": "Ring Size",
                "optionValue": "9 1/4 US",
                "optionTag": "O",
                "price": "0.00",
                "discountedPrice": "0.00",
                "discountIndicator": "No",
                "discountEOD": "",
                "stockQty": "100",
                "personalizationNote": ""
            },
            {
                "optionLabel": "Ring Size",
                "optionValue": "9 1/2 US",
                "optionTag": "O",
                "price": "0.00",
                "discountedPrice": "0.00",
                "discountIndicator": "No",
                "discountEOD": "",
                "stockQty": "100",
                "personalizationNote": ""
            },
            {
                "optionLabel": "Ring Size",
                "optionValue": "9 3/4 US",
                "optionTag": "O",
                "price": "0.00",
                "discountedPrice": "0.00",
                "discountIndicator": "No",
                "discountEOD": "",
                "stockQty": "100",
                "personalizationNote": ""
            },
            {
                "optionLabel": "Ring Size",
                "optionValue": "10 US",
                "optionTag": "O",
                "price": "0.00",
                "discountedPrice": "0.00",
                "discountIndicator": "No",
                "discountEOD": "",
                "stockQty": "100",
                "personalizationNote": ""
            },
            {
                "optionLabel": "Ring Size",
                "optionValue": "10 1/4 US",
                "optionTag": "O",
                "price": "0.00",
                "discountedPrice": "0.00",
                "discountIndicator": "No",
                "discountEOD": "",
                "stockQty": "100",
                "personalizationNote": ""
            },
            {
                "optionLabel": "Ring Size",
                "optionValue": "10 1/2 US",
                "optionTag": "O",
                "price": "0.00",
                "discountedPrice": "0.00",
                "discountIndicator": "No",
                "discountEOD": "",
                "stockQty": "100",
                "personalizationNote": ""
            },
            {
                "optionLabel": "Ring Size",
                "optionValue": "10 3/4 US",
                "optionTag": "O",
                "price": "0.00",
                "discountedPrice": "0.00",
                "discountIndicator": "No",
                "discountEOD": "",
                "stockQty": "100",
                "personalizationNote": ""
            },
            {
                "optionLabel": "Ring Size",
                "optionValue": "11 US",
                "optionTag": "O",
                "price": "0.00",
                "discountedPrice": "0.00",
                "discountIndicator": "No",
                "discountEOD": "",
                "stockQty": "100",
                "personalizationNote": ""
            }
        ],
        "medias": [
            {
                "mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856173/clique/Products/New%20folder%20%285%29/il_794xN.1049046873_231p.jpg",
                "mediaType": "Image"
            },
            {
                "mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856173/clique/Products/New%20folder%20%285%29/il_794xN.1049046911_9wbx.jpg",
                "mediaType": "Image"
            },
            {
                "mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856172/clique/Products/New%20folder%20%285%29/il_794xN.2998296390_s1jk.jpg",
                "mediaType": "Image"
            },
            {
                "mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856172/clique/Products/New%20folder%20%285%29/il_794xN.1002521042_g6jo.jpg",
                "mediaType": "Image"
            },
            {
                "mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856171/clique/Products/New%20folder%20%285%29/il_794xN.1002521072_ljqe.jpg",
                "mediaType": "Image"
            },
            {
                "mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856171/clique/Products/New%20folder%20%285%29/il_794xN.1002521076_1z8h.jpg",
                "mediaType": "Image"
            }
        ],
        "highlights": [
            {
                "labelName": "Handmade",
                "labelValue": "Handmade item"
            },
            {
                "labelName": "Materials",
                "labelValue": "Materials: 925K Sterling Silver, Rose Gold Filled Over Silver, Yellow Gold Filled Over Silver"
            },
            {
                "labelName": "Made to Order",
                "labelValue": "Made to Order"
            }
        ],
        "FAQ": [
            {
                "question": "How To Customize My Jewelry?",
                "answer": "♡ Please write all personalization details of your order in &apos;&apos; Note for Seller &apos;&apos; section at check out."
            },
            {
                "question": "How Do I Know My Size?",
                "answer": "&quot;♡ You can find all sizing informations in the listing descriptions.&lt;br /&gt;"
            },
            {
                "question": "Can You Rush My Order ?",
                "answer": "&quot;♡ We handmade every single pieces and our processing time is 3-5 business days. If you need your order faster, please request by sending us a message, we will confirm if it&apos;s possible. &lt;br /&gt;"
            },
            {
                "question": "Care instructions",
                "answer": "For our 14k gold filled designs, we strongly advise keeping your  jewelry away from water, perfumes or  chemicals, which can prevent your items from staying in perfect condition."
            }
        ],
        "shipping": [],
        "destination": []
    }
]''';