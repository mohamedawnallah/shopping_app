class TopCategoryModel {
  String parentId;
  String parentMenuLabel;
  String childId;
  String childMenuLabel;
  String navLevel;
  TopCategoryModel(
      {required this.parentId,
      required this.parentMenuLabel,
      required this.childId,
      required this.childMenuLabel,
      required this.navLevel});
  factory TopCategoryModel.fromJson(Map<String, dynamic> category) {
    return TopCategoryModel(
      parentId: category['parentID'],
      parentMenuLabel: category['parentMenuLabel'],
      childId: category['childID'],
      childMenuLabel: category['childMenuLabel'],
      navLevel: category['navLevel'],
    );
  }

}
