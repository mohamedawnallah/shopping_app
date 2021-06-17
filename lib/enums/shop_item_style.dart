enum ShopItemStyle{
 Minimalist,
 Maximalist,
}
String getShopItemStyle(ShopItemStyle shopItemStyle){
  switch (shopItemStyle){
    case ShopItemStyle.Minimalist:
      return "Minimalist";
    case ShopItemStyle.Maximalist:
      return "Maximalist";
    default:
      return "Style Not Found";
  }
}
