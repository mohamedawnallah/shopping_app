import 'package:flutter/material.dart';
import 'package:shop_app/services/top_menu_categories_network_helper/dart/network_helper_models/home_page_network_helper_model.dart';

class HomePageProvider extends ChangeNotifier {
  List<HomePageModel> homePageItems = [];
//Items hand-picked by our editors"
  HomePageModel? itemsHandPickedByOurEditors;
  HomePageModel?vanDayGiftsHomePageModel;
  HomePageModel?inspirationMessagesHomePageModel;
  HomePageModel?modernPetsHomePageModel;
  HomePageModel?cozyUpHomePageModel;
  HomePageModel?transitionStyleHomePageModel;
  HomePageModel? houseWarmingGiftsHomePageModel;
  void addTransitionStyleSub(HomePageModel transitionStyleHomePageModel) {
    this.transitionStyleHomePageModel = transitionStyleHomePageModel;
    notifyListeners();
  }


  void addItemsHandPickedByOurEditors(
      HomePageModel itemsHandPickedByOurEditors) {
    this.itemsHandPickedByOurEditors = itemsHandPickedByOurEditors;
    notifyListeners();
  }
  void addHouseWarmingGifts(HomePageModel houseWarmingGiftsHomePageModel) {
    this.houseWarmingGiftsHomePageModel = houseWarmingGiftsHomePageModel;
    notifyListeners();
  }
  void addVanDayGifts(HomePageModel vanDayGiftsHomePageModel) {
    this.vanDayGiftsHomePageModel = vanDayGiftsHomePageModel;
    notifyListeners();
  }
  void addInspirationSubMessages(HomePageModel inspirationMessagesHomePageModel) {
    this.inspirationMessagesHomePageModel = inspirationMessagesHomePageModel;
    notifyListeners();
  }
  void addModernPetsSub(HomePageModel modernPetsHomePageModel) {
    this.modernPetsHomePageModel = modernPetsHomePageModel;
    notifyListeners();
  }
  void addCozyUpSub(HomePageModel cozyUpHomePageModel) {
    this.cozyUpHomePageModel = cozyUpHomePageModel;
    notifyListeners();
  }
//   Sub? anniversaryGifts;
//   Sub? giftsForHer;
//   Sub? giftsForHim;
//   Sub? personalizedGiftIdeas;
//   Sub? weddingGifts;
// //Discover unique hand-picked items"
//   HomePageModel? discoverUniqueHandPickedItems;
//   Sub? artFinds ;
//   Sub? bathBeautyGifts ;
//   Sub? diyUpdates ;
//   Sub? outdoorEntertaining ;
//   Sub? sustainability;
//   Sub? weddingPlanningIdeas ;
// //Valentine&apos;s Day Gifts"
//   HomePageModel? valentineDayGifts;
// //Inspirational Messages
//   HomePageModel? inspirationMessages;
// //Modern Pets
//   HomePageModel? modernPets;
// //Cozy Up
//   HomePageModel? cozyUp;
// //TransitionStyle
//   HomePageModel? transitionStyle;
// //Housewarming Gifts
//   HomePageModel? houseWarmingGifts2;
//   Sub?houseWarmingGifts2Sub;





  // void addAnniversaryGifts(Sub anniversaryGifts) {
  //   this.anniversaryGifts = anniversaryGifts;
  //   notifyListeners();
  // }
  //
  // void addGiftsForHer(Sub giftsForHer) {
  //   this.giftsForHer = giftsForHer;
  //   notifyListeners();
  // }

  // void addGiftsForHim(Sub giftsForHim) {
  //   this.giftsForHim = giftsForHim;
  //   notifyListeners();
  // }



  // void addPersonalizedGiftIdeas(Sub personalizedGiftIdeas) {
  //   this.personalizedGiftIdeas = personalizedGiftIdeas;
  //   notifyListeners();
  // }
  //
  // void addWeddingGifts(Sub weddingGifts) {
  //   this.weddingGifts = weddingGifts;
  //   notifyListeners();
  // }

//Discover unique hand-picked items
//   void addDiscoverUniqueHandPickedItems(
//       HomePageModel discoverUniqueHandPickedItems) {
//     this.discoverUniqueHandPickedItems = discoverUniqueHandPickedItems;
//     notifyListeners();
//   }
//
//   void addArtFinds(Sub artFinds) {
//     this.artFinds=artFinds;
//     notifyListeners();
//   }
//
//   void addBathBeautyGifts(Sub bathBeautyGifts) {
//     this.bathBeautyGifts=bathBeautyGifts;
//     notifyListeners();
//   }
//
//   void addDiyUpdates(Sub diyUpdates) {
//     this.diyUpdates=diyUpdates;
//     notifyListeners();
//   }

  // void addOutDoorEntertaining(Sub outDoorEntertaining) {
  //   this.outdoorEntertaining=outDoorEntertaining;
  //   notifyListeners();
  // }
  //
  // void addSustainability(Sub sustainability) {
  //   this.sustainability=sustainability;
  //   notifyListeners();
  // }

  // void addWeddingPlanningIdeas(Sub weddingPlanningIdeas) {
  //   this.weddingPlanningIdeas=weddingPlanningIdeas;
  //   notifyListeners();
  // }

  //Valentine&apos;s Day Gifts"
  // void addValentineDayGifts(HomePageModel valentineDayGifts) {
  //   this.valentineDayGifts = valentineDayGifts;
  //   notifyListeners();
  // }



// //Inspiration Messages
//   void addInspirationMessages(HomePageModel inspirationMessages) {
//     this.inspirationMessages = inspirationMessages;
//     notifyListeners();
//   }


// //HouseWarming Gifts
//   void addHouseWarmingGifts2(HomePageModel houseWarmingGifts) {
//     this.houseWarmingGifts2 = houseWarmingGifts;
//     notifyListeners();
//   }

  // void addHouseWarmingGifts2Sub(Sub houseWarmingGifts) {
  //   this.houseWarmingGifts2Sub = houseWarmingGifts;
  //   notifyListeners();
  // }
  //Modern Pets
  // void addModernPets(HomePageModel modernPets) {
  //   this.modernPets = modernPets;
  //   notifyListeners();
  // }

//Cozy Up
//   void addCozyUp(HomePageModel cozyUp) {
//     this.cozyUp = cozyUp;
//     notifyListeners();
//   }


  //Transition Style
  // void addTransitionStyle(HomePageModel transitionStyle) {
  //   this.transitionStyle = transitionStyle;
  //   notifyListeners();
  // }

}
