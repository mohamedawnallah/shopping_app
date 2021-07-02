import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:provider/provider.dart';
import 'package:shop_app/config/constants.dart';
import 'package:shop_app/services/network_helper_models/home_page_network_helper_model.dart';
import 'package:shop_app/view_models/provider/all_providers.dart';

class HomeRouteNetworkHelper {
  static Future<List<HomePageModel>> getHomePage(context) async {
    var response = await http
        .post(Uri.parse("https://api.iqstars.me/Clique/RetrieveHomePage.aspx"));

    List<HomePageModel> homePageModelItems =
        homePageModelFromJson(response.body);

    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      //Items Hand Picked By Our Editors

      Provider.of<HomePageProvider>(context, listen: false)
          .addItemsHandPickedByOurEditors(homePageModelItems[0]);

      Provider.of<HomePageProvider>(context, listen: false)
          .addInspirationSubMessages(homePageModelItems[1]);
      Provider.of<HomePageProvider>(context, listen: false)
          .addModernPetsSub(homePageModelItems[2]);
      Provider.of<HomePageProvider>(context, listen: false)
          .addCozyUpSub(homePageModelItems[3]);
      Provider.of<HomePageProvider>(context, listen: false)
          .addTransitionStyleSub(homePageModelItems[4]);
      Provider.of<HomePageProvider>(context, listen: false)
          .addHouseWarmingGifts(homePageModelItems[5]);
    });
    return homePageModelItems;
  }
}

String homePageString='''[
{
"topID": "486",
"toplabel": "Valentine&apos;s Day Gifts",
"labelDesc": "Oodles of sweet picks for your sweetest someone.",
"topTag": "Editor's Pick",
"subs": [
{
"ID": "486",
"label": "",
"products": [
{
"productID": "4",
"mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856160/clique/Products/New%20folder%20%2814%29/il_794xN.2443370719_bvkq.jpg",
"mediaType": "Image",
"oriprice": "62.37",
"discountprice": "0.00",
"discountindicator": "No"
},
{
"productID": "13",
"mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856173/clique/Products/New%20folder%20%284%29/il_794xN.379040164_m5ja.jpg",
"mediaType": "Image",
"oriprice": "151.16",
"discountprice": "0.00",
"discountindicator": "No"
},
{
"productID": "1",
"mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856171/clique/Products/New%20folder%20%283%29/il_794xN.3079101188_19u4.jpg",
"mediaType": "Image",
"oriprice": "5826.50",
"discountprice": "4661.20",
"discountindicator": "Yes"
},
{
"productID": "15",
"mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856155/clique/Products/New%20folder%20%2812%29/il_794xN.1452830271_rlyj.jpg",
"mediaType": "Image",
"oriprice": "1301.95",
"discountprice": "1041.54",
"discountindicator": "Yes"
},
{
"productID": "17",
"mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856152/clique/Products/New%20folder%20%2810%29/il_794xN.2765179859_bmhc.jpg",
"mediaType": "Image",
"oriprice": "1286.57",
"discountprice": "0.00",
"discountindicator": "No"
},
{
"productID": "12",
"mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856173/clique/Products/New%20folder%20%285%29/il_794xN.1049046873_231p.jpg",
"mediaType": "Image",
"oriprice": "249.57",
"discountprice": "199.66",
"discountindicator": "Yes"
}
]
}
]
},
{
"topID": "487",
"toplabel": "Inspirational Messages",
"labelDesc": "For that extra dose of motivation",
"topTag": "",
"subs": [
{
"ID": "487",
"label": "",
"products": [
{
"productID": "6",
"mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856184/clique/Products/New%20folder%20%289%29/il_794xN.1970079955_e81z.jpg",
"mediaType": "Image",
"oriprice": "58.96",
"discountprice": "0.00",
"discountindicator": "No"
},
{
"productID": "4",
"mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856160/clique/Products/New%20folder%20%2814%29/il_794xN.2443370719_bvkq.jpg",
"mediaType": "Image",
"oriprice": "62.37",
"discountprice": "0.00",
"discountindicator": "No"
},
{
"productID": "10",
"mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856179/clique/Products/New%20folder%20%287%29/il_794xN.3086666602_syu6.jpg",
"mediaType": "Image",
"oriprice": "9031.84",
"discountprice": "0.00",
"discountindicator": "No"
},
{
"productID": "14",
"mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856179/clique/Products/New%20folder%20%286%29/il_794xN.2579877680_tg90.jpg",
"mediaType": "Image",
"oriprice": "1613.60",
"discountprice": "0.00",
"discountindicator": "No"
},
{
"productID": "12",
"mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856173/clique/Products/New%20folder%20%285%29/il_794xN.1049046873_231p.jpg",
"mediaType": "Image",
"oriprice": "249.57",
"discountprice": "199.66",
"discountindicator": "Yes"
},
{
"productID": "9",
"mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856182/clique/Products/New%20folder%20%288%29/il_794xN.3165162211_kxmp.jpg",
"mediaType": "Image",
"oriprice": "1682.44",
"discountprice": "0.00",
"discountindicator": "No"
}
]
}
]
},
{
"topID": "488",
"toplabel": "Modern Pets",
"labelDesc": "",
"topTag": "",
"subs": [
{
"ID": "488",
"label": "",
"products": [
{
"productID": "6",
"mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856184/clique/Products/New%20folder%20%289%29/il_794xN.1970079955_e81z.jpg",
"mediaType": "Image",
"oriprice": "58.96",
"discountprice": "0.00",
"discountindicator": "No"
},
{
"productID": "13",
"mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856173/clique/Products/New%20folder%20%284%29/il_794xN.379040164_m5ja.jpg",
"mediaType": "Image",
"oriprice": "151.16",
"discountprice": "0.00",
"discountindicator": "No"
},
{
"productID": "4",
"mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856160/clique/Products/New%20folder%20%2814%29/il_794xN.2443370719_bvkq.jpg",
"mediaType": "Image",
"oriprice": "62.37",
"discountprice": "0.00",
"discountindicator": "No"
},
{
"productID": "1",
"mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856171/clique/Products/New%20folder%20%283%29/il_794xN.3079101188_19u4.jpg",
"mediaType": "Image",
"oriprice": "5826.50",
"discountprice": "4661.20",
"discountindicator": "Yes"
},
{
"productID": "8",
"mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856154/clique/Products/New%20folder%20%2811%29/il_794xN.1309400734_5w95.jpg",
"mediaType": "Image",
"oriprice": "888.55",
"discountprice": "0.00",
"discountindicator": "No"
},
{
"productID": "14",
"mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856179/clique/Products/New%20folder%20%286%29/il_794xN.2579877680_tg90.jpg",
"mediaType": "Image",
"oriprice": "1613.60",
"discountprice": "0.00",
"discountindicator": "No"
}
]
}
]
},
{
"topID": "490",
"toplabel": "Cozy Up",
"labelDesc": "The more layers, the better",
"topTag": "",
"subs": [
{
"ID": "490",
"label": "",
"products": [
{
"productID": "4",
"mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856160/clique/Products/New%20folder%20%2814%29/il_794xN.2443370719_bvkq.jpg",
"mediaType": "Image",
"oriprice": "62.37",
"discountprice": "0.00",
"discountindicator": "No"
},
{
"productID": "6",
"mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856184/clique/Products/New%20folder%20%289%29/il_794xN.1970079955_e81z.jpg",
"mediaType": "Image",
"oriprice": "58.96",
"discountprice": "0.00",
"discountindicator": "No"
},
{
"productID": "13",
"mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856173/clique/Products/New%20folder%20%284%29/il_794xN.379040164_m5ja.jpg",
"mediaType": "Image",
"oriprice": "151.16",
"discountprice": "0.00",
"discountindicator": "No"
},
{
"productID": "11",
"mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856160/clique/Products/New%20folder%20%2814%29/il_794xN.2443370719_bvkq.jpg",
"mediaType": "Image",
"oriprice": "4496.56",
"discountprice": "3147.59",
"discountindicator": "Yes"
},
{
"productID": "3",
"mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856166/clique/Products/New%20folder%20%2816%29/il_794xN.3100813434_5nbj.jpg",
"mediaType": "Image",
"oriprice": "21.58",
"discountprice": "0.00",
"discountindicator": "No"
},
{
"productID": "2",
"mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856151/clique/Products/New%20folder/il_794xN.2409060414_5fnm.jpg",
"mediaType": "Image",
"oriprice": "31.29",
"discountprice": "0.00",
"discountindicator": "No"
}
]
}
]
},
{
"topID": "491",
"toplabel": "Transitional Style",
"labelDesc": "The top trends to layer on for spring",
"topTag": "",
"subs": [
{
"ID": "491",
"label": "",
"products": [
{
"productID": "17",
"mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856152/clique/Products/New%20folder%20%2810%29/il_794xN.2765179859_bmhc.jpg",
"mediaType": "Image",
"oriprice": "1286.57",
"discountprice": "0.00",
"discountindicator": "No"
},
{
"productID": "11",
"mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856160/clique/Products/New%20folder%20%2814%29/il_794xN.2443370719_bvkq.jpg",
"mediaType": "Image",
"oriprice": "4496.56",
"discountprice": "3147.59",
"discountindicator": "Yes"
},
{
"productID": "16",
"mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856163/clique/Products/New%20folder%20%2815%29/il_794xN.3012059284_tbxx.jpg",
"mediaType": "Image",
"oriprice": "738.01",
"discountprice": "664.21",
"discountindicator": "Yes"
},
{
"productID": "8",
"mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856154/clique/Products/New%20folder%20%2811%29/il_794xN.1309400734_5w95.jpg",
"mediaType": "Image",
"oriprice": "888.55",
"discountprice": "0.00",
"discountindicator": "No"
},
{
"productID": "5",
"mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856166/clique/Products/New%20folder%20%282%29/il_794xN.3158675211_l53r.jpg",
"mediaType": "Image",
"oriprice": "146.74",
"discountprice": "0.00",
"discountindicator": "No"
},
{
"productID": "13",
"mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856173/clique/Products/New%20folder%20%284%29/il_794xN.379040164_m5ja.jpg",
"mediaType": "Image",
"oriprice": "151.16",
"discountprice": "0.00",
"discountindicator": "No"
}
]
}
]
},
{
"topID": "492",
"toplabel": "Housewarming Gifts",
"labelDesc": "Gifts that will get you invited back",
"topTag": "",
"subs": [
{
"ID": "492",
"label": "",
"products": [
{
"productID": "13",
"mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856173/clique/Products/New%20folder%20%284%29/il_794xN.379040164_m5ja.jpg",
"mediaType": "Image",
"oriprice": "151.16",
"discountprice": "0.00",
"discountindicator": "No"
},
{
"productID": "16",
"mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856163/clique/Products/New%20folder%20%2815%29/il_794xN.3012059284_tbxx.jpg",
"mediaType": "Image",
"oriprice": "738.01",
"discountprice": "664.21",
"discountindicator": "Yes"
},
{
"productID": "5",
"mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856166/clique/Products/New%20folder%20%282%29/il_794xN.3158675211_l53r.jpg",
"mediaType": "Image",
"oriprice": "146.74",
"discountprice": "0.00",
"discountindicator": "No"
},
{
"productID": "11",
"mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856160/clique/Products/New%20folder%20%2814%29/il_794xN.2443370719_bvkq.jpg",
"mediaType": "Image",
"oriprice": "4496.56",
"discountprice": "3147.59",
"discountindicator": "Yes"
},
{
"productID": "12",
"mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856173/clique/Products/New%20folder%20%285%29/il_794xN.1049046873_231p.jpg",
"mediaType": "Image",
"oriprice": "249.57",
"discountprice": "199.66",
"discountindicator": "Yes"
},
{
"productID": "1",
"mediaName": "https://res.cloudinary.com/alexlimclarify/image/upload/v1623856171/clique/Products/New%20folder%20%283%29/il_794xN.3079101188_19u4.jpg",
"mediaType": "Image",
"oriprice": "5826.50",
"discountprice": "4661.20",
"discountindicator": "Yes"
}
]
}
]
}
]''';
