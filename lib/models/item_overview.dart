class ItemOverview {
  final String itemShopCategory;
  final List<String> materials;
  final String shopSourceLocation;
  final int numberOfFavorites;

  ItemOverview(
      {required this.itemShopCategory,
      required this.materials,
      required this.shopSourceLocation,
      required this.numberOfFavorites});
}
