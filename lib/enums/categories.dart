import 'package:shop_app/route_generator.dart';

enum Categories {
  ValentineDayGifts,
  InspirationalMessages,
  ModernPets,
  EditorPicks,
  CozyUp,
  TransitionStyle,
  HouseWarningGifts,
  Null
}
class Category{
  final String boldOverView;
  final String normalOverView;

  const Category({required this.boldOverView,required this.normalOverView});
 static String getCategoryName(Categories category) {
    switch (category) {
      case Categories.ValentineDayGifts:
        return "Valentine's Day Gift";
      case Categories.InspirationalMessages:
        return "Inspirational messages";
      case Categories.ModernPets:
        return "Modern pets";
      case Categories.EditorPicks:
        return "Editor's Picks";
      case Categories.CozyUp:
        return "Cozy Up";
      case Categories.TransitionStyle:
        return "Transition style";
      case Categories.HouseWarningGifts:
        return "Housewarming Gifts";
      default:
        return "No Category Found";
    }
  }

  static String getCategorySubTitle(Categories category){
   switch (category){
     case Categories.ValentineDayGifts:
       return "Oodles of sweet picks for your sweetest someone";
     case Categories.InspirationalMessages:
       return "for that extra dose of motivation";
     case Categories.ModernPets:
       return "null";
     case Categories.EditorPicks:
       return "null";
     case Categories.CozyUp:
       return "the more layers, the more better";
     case Categories.TransitionStyle:
       return "The top trends to layer on for spring";
     case Categories.HouseWarningGifts:
       return "Gifts that will get you invited back";
     default:
       return "Error Accidentally Happend";
   }
  }
}

