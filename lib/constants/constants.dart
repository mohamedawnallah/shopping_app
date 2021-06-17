import 'package:flutter/cupertino.dart';
import 'package:shop_app/enums/categories.dart';
import 'package:shop_app/enums/enums_collection.dart';
import 'package:shop_app/models/category_parent_by_id.dart';
import 'package:shop_app/models/faq_model.dart';
import 'package:shop_app/models/item_overview.dart';
import 'package:shop_app/models/shop_item.dart';
import 'package:shop_app/models/shop_model.dart';
import 'package:shop_app/models/shop_owner.dart';

const String valentineMessageImageBg =
    "https://images.unsplash.com/photo-1550039120-5d6529f0c4de?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
const String editorPicksImageBg =
    "https://images.unsplash.com/photo-1531685250784-7569952593d2?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8d2FsbHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60";
const List<String> valentineMessagesList = [
  "https://images.unsplash.com/photo-1518414881329-0f96c8f2a924?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1532&q=80",
  "https://images.unsplash.com/photo-1515871204537-49a5fe66a31f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1274&q=80"
];
ItemOverview itemOverView = ItemOverview(
    itemShopCategory: "Handmade Item",
    materials: [
      "Cow Leather",
      "Suede",
      "Cow",
      "Cow Leather",
      "Suede",
      "Cow",
      "Cow Leather",
      "Suede",
      "Cow",
      "Suede"
    ],
    shopSourceLocation: "Tbilisi, Gerogia",
    numberOfFavorites: 200);
List<FAQ> faqs = [
  FAQ(
    question: "What is Your Name",
    answer: "My Name Is Mohamed",
  ),
  FAQ(
    question: "What is Your Age",
    answer: "My Age Is 54",
  ),
  FAQ(
    question: "What is Your Grade",
    answer: "My Grade Is Third Secondary School",
  ),
  FAQ(
    question: "What is Your Grade",
    answer: "My Grade Is Third Secondary School",
  ),
  FAQ(
    question: "What is Your Grade",
    answer: "My Grade Is Third Secondary School",
  ),
  FAQ(
    question: "What is Your Grade",
    answer: "My Grade Is Third Secondary School",
  ),
  FAQ(
    question: "What is Your Grade",
    answer: "My Grade Is Third Secondary School",
  ),
  FAQ(
    question: "What is Your Grade",
    answer: "My Grade Is Third Secondary School",
  ),
  FAQ(
    question: "What is Your Grade",
    answer: "My Grade Is Third Secondary School",
  ),
  FAQ(
    question: "What is Your Grade",
    answer: "My Grade Is Third Secondary School",
  ),
];
List<ShopItem> shopItems = [
  shopItem,
  shopItem2,
  shopItem3,
  shopItem4,
  shopItem5,
  shopItem6,
  shopItem7,
  shopItem8,
  shopItem9,
  shopItem10,
];

ShopOwner shopOwner = ShopOwner(
  id: 1,
  imageUrl:
      'https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlciUyMHByb2ZpbGV8ZW58MHx8MHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60',
  name: "Mohamed Awnallah",
  following: 90,
  followers: 54,
  overview:
      "I am Mohamed Awnallah.21 Years Old,I am Mohamed Awnallah.21 Years Old,I am Mohamed Awnallah.21 Years Old,I am Mohamed Awnallah.21 Years Old",
);
ShopModel shopModel = ShopModel(
  shopName: "QisaBags",
  shopImage:
      "https://images.unsplash.com/photo-1467043237213-65f2da53396f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80",
  shopLocation: "Tbilisi, Georgia",
  userProfileOwner: shopOwner,
  description: "A shop for acessories and handmade good in Georgia ",
);
Category category = Category(
    boldOverView: "Jewelery,handbags and accessories",
    normalOverView: "Little accents with massive style points");
ShopItem shopItem = ShopItem(
  id: 1,
  title: "Rose quartz earrings",
  subtitle: "Borcik",
  category: category,
  hasSale: true,
  price: 220.0,
  reviews: 334,
  listOfImages: inspirationalMessagesList,
  style: ShopItemStyle.Minimalist,
  isAvailable: false,
  itemOverview: itemOverView,
  salePercentage: 0.1,
  itemDetails: "These are very detailed Items",
  shippingPolicies: "This are shipping policies",
  fAQS: faqs,
  shopModel: shopModel,
);
ShopItem shopItem2 = ShopItem(
  id: 2,
  title: "Rose quartz earrings",
  subtitle: "Borcik",
  category: category,
  hasSale: true,
  price: 220.0,
  reviews: 334,
  listOfImages: inspirationalMessagesList,
  style: ShopItemStyle.Minimalist,
  isAvailable: false,
  itemOverview: itemOverView,
  salePercentage: 0.1,
  itemDetails: "These are very detailed Items",
  shippingPolicies: "This are shipping policies",
  fAQS: faqs,
  shopModel: shopModel,
);
ShopItem shopItem3 = ShopItem(
  id: 2,
  title: "Rose quartz earrings",
  subtitle: "Borcik",
  category: category,
  hasSale: true,
  price: 220.0,
  reviews: 334,
  listOfImages: inspirationalMessagesList,
  style: ShopItemStyle.Minimalist,
  isAvailable: false,
  itemOverview: itemOverView,
  salePercentage: 0.1,
  itemDetails: "These are very detailed Items",
  shippingPolicies: "This are shipping policies",
  fAQS: faqs,
  shopModel: shopModel,
);
ShopItem shopItem4 = ShopItem(
  id: 2,
  title: "Rose quartz earrings",
  subtitle: "Borcik",
  category: category,
  hasSale: true,
  price: 220.0,
  reviews: 334,
  listOfImages: inspirationalMessagesList,
  style: ShopItemStyle.Minimalist,
  isAvailable: false,
  itemOverview: itemOverView,
  salePercentage: 0.1,
  itemDetails: "These are very detailed Items",
  shippingPolicies: "This are shipping policies",
  fAQS: faqs,
  shopModel: shopModel,
);
ShopItem shopItem5 = ShopItem(
  id: 2,
  title: "Rose quartz earrings",
  subtitle: "Borcik",
  category: category,
  hasSale: true,
  price: 220.0,
  reviews: 334,
  listOfImages: inspirationalMessagesList,
  style: ShopItemStyle.Minimalist,
  isAvailable: false,
  itemOverview: itemOverView,
  salePercentage: 0.1,
  itemDetails: "These are very detailed Items",
  shippingPolicies: "This are shipping policies",
  fAQS: faqs,
  shopModel: shopModel,
);
ShopItem shopItem6 = ShopItem(
  id: 2,
  title: "Rose quartz earrings",
  subtitle: "Borcik",
  category: category,
  hasSale: true,
  price: 220.0,
  reviews: 334,
  listOfImages: inspirationalMessagesList,
  style: ShopItemStyle.Minimalist,
  isAvailable: false,
  itemOverview: itemOverView,
  salePercentage: 0.1,
  itemDetails: "These are very detailed Items",
  shippingPolicies: "This are shipping policies",
  fAQS: faqs,
  shopModel: shopModel,
);
ShopItem shopItem7 = ShopItem(
  id: 2,
  title: "Rose quartz earrings",
  subtitle: "Borcik",
  category: category,
  hasSale: true,
  price: 220.0,
  reviews: 334,
  listOfImages: inspirationalMessagesList,
  style: ShopItemStyle.Minimalist,
  isAvailable: false,
  itemOverview: itemOverView,
  salePercentage: 0.1,
  itemDetails: "These are very detailed Items",
  shippingPolicies: "This are shipping policies",
  fAQS: faqs,
  shopModel: shopModel,
);
ShopItem shopItem8 = ShopItem(
  id: 2,
  title: "Rose quartz earrings",
  subtitle: "Borcik",
  category: category,
  hasSale: true,
  price: 220.0,
  reviews: 334,
  listOfImages: inspirationalMessagesList,
  style: ShopItemStyle.Minimalist,
  isAvailable: false,
  itemOverview: itemOverView,
  salePercentage: 0.1,
  itemDetails: "These are very detailed Items",
  shippingPolicies: "This are shipping policies",
  fAQS: faqs,
  shopModel: shopModel,
);
ShopItem shopItem9 = ShopItem(
  id: 2,
  title: "Rose quartz earrings",
  subtitle: "Borcik",
  category: category,
  hasSale: true,
  price: 220.0,
  reviews: 334,
  listOfImages: inspirationalMessagesList,
  style: ShopItemStyle.Minimalist,
  isAvailable: false,
  itemOverview: itemOverView,
  salePercentage: 0.1,
  itemDetails: "These are very detailed Items",
  shippingPolicies: "This are shipping policies",
  fAQS: faqs,
  shopModel: shopModel,
);
ShopItem shopItem10 = ShopItem(
  id: 2,
  title: "Rose quartz earrings",
  subtitle: "Borcik",
  category: category,
  hasSale: true,
  price: 220.0,
  reviews: 334,
  listOfImages: inspirationalMessagesList,
  style: ShopItemStyle.Minimalist,
  isAvailable: false,
  itemOverview: itemOverView,
  salePercentage: 0.1,
  itemDetails: "These are very detailed Items",
  shippingPolicies: "This are shipping policies",
  fAQS: faqs,
  shopModel: shopModel,
);
const List<String> inspirationalMessagesList = [
  "https://images.unsplash.com/photo-1542060748-10c28b62716f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80",
  "https://images.unsplash.com/photo-1556905055-8f358a7a47b2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80",
  "https://images.unsplash.com/photo-1467043237213-65f2da53396f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80",
  "https://images.unsplash.com/photo-1556905055-8f358a7a47b2?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80",
  "https://images.unsplash.com/photo-1542060748-10c28b62716f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80",
  "https://images.unsplash.com/photo-1542060748-10c28b62716f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80",
  "https://images.unsplash.com/photo-1542060748-10c28b62716f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80",
  "https://images.unsplash.com/photo-1542060748-10c28b62716f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80",
  "https://images.unsplash.com/photo-1542060748-10c28b62716f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80",
  "https://images.unsplash.com/photo-1542060748-10c28b62716f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80",
];
const List<String> modernPetsList = [
  "https://images.unsplash.com/photo-1612760721786-a42eb89aba02?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80",
  "https://images.unsplash.com/photo-1583337130417-3346a1be7dee?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80",
  "https://i.guim.co.uk/img/media/03734ee186eba543fb3d0e35db2a90a14a5d79e3/0_173_5200_3120/master/5200.jpg?width=1200&height=900&quality=85&auto=format&fit=crop&s=9c30ed97ea8731f3e2a155467201afe3",
  "https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.wthr.com%2Farticle%2Fnews%2Flocal%2Fits-illegal-leave-your-pets-out-cold-heres-who-call-help%2F531-13dba857-e521-4f22-a47c-17f0753aa2d6&psig=AOvVaw3MzpOMqfYbkzgOHY7T9Cz8&ust=1622391208222000&source=images&cd=vfe&ved=0CAIQjRxqFwoTCJDkl7qk7_ACFQAAAAAdAAAAABAI",
];
const List<String> editorPicksList = [
  "https://images.unsplash.com/photo-1467043237213-65f2da53396f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80",
  "https://media.istockphoto.com/photos/cleaning-home-and-donation-concepts-with-young-person-putting-in-picture-id1210141860?s=612x612",
];
const List<String> cozyUpList = [
  "https://images.unsplash.com/photo-1509422007420-a57adf7b7fdf?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=2775&q=80",
  "https://images.unsplash.com/photo-1595940929854-47f1bca6f845?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80",
  "https://images.unsplash.com/photo-1595940929854-47f1bca6f845?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80",
  "https://images.unsplash.com/photo-1610275822226-d70ce1e67a27?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1504&q=80",
];
const List<String> transitionalStylesList = [
  "https://media.istockphoto.com/photos/cleaning-home-and-donation-concepts-with-young-person-putting-in-picture-id1210141860?s=612x612",
  "https://images.unsplash.com/photo-1490481651871-ab68de25d43d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80",
  "https://media.istockphoto.com/photos/cleaning-home-and-donation-concepts-with-young-person-putting-in-picture-id1210141860?s=612x612",
  "https://images.unsplash.com/photo-1490481651871-ab68de25d43d?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80",
];
const List<String> houseWarmingGifts = [
  "https://images.unsplash.com/photo-1580202313707-46a966af5c6f?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1486&q=80",
  "https://images.unsplash.com/photo-1618837193150-ee7bca1e5bd6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1756&q=80",
  "https://images.unsplash.com/photo-1620126121859-3e35a8d8f423?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1518&q=80",
  "https://images.unsplash.com/photo-1572370666120-d171df6d8473?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1780&q=80",
];

const String baseUrl = "https://api.iqstars.me/Clique/";
//Don't Need Any Body
const String topMenuApiEndPoint = "$baseUrl+RetrieveTopMenu.aspx";
//Needs Product Id and Batch Id (Or Not)
const String homePageAPIEndpoint = "$baseUrl+RetrieveHomePage.aspx";
//Don't Need Any Body Params
const String sideMenuAPIEndpoint = "$baseUrl+RetrieveSideMenu.aspx";
//Needs Category ID and Batch ID
const String listProductsAPIEndpoint = "$baseUrl+RetrieveSideMenu.aspx";
//Needs Product ID
const String listProductDetailsAPIEndpoint = "$baseUrl+ListProductDetail.aspx";

const List<CategoryByParentId> nav2ParentIds = [
  CategoryByParentId(categoryName: "Arts", parentId: "45"),
  CategoryByParentId(categoryName: "Clothing", parentId: "132"),
  CategoryByParentId(categoryName: "Craft", parentId: "148"),
  CategoryByParentId(categoryName: "Home", parentId: "243"),
  CategoryByParentId(categoryName: "Jewelry", parentId: "257"),
  CategoryByParentId(categoryName: "Toys", parentId: "439"),
  //There Are No SubCategories for Vintage
  CategoryByParentId(categoryName: "Vintage", parentId: "485"),
  //There Are No SubCategories for Wedding & Party

  CategoryByParentId(categoryName: "Wedding & Party", parentId: "460"),
];

//Third Nav
//Jewelry
const List<CategoryByParentId> nav3ParentIds = [
  CategoryByParentId(categoryName: "Accessories", parentId: "1"),
  CategoryByParentId(categoryName: "Bags &amp; Purses", parentId: "55"),
  CategoryByParentId(categoryName: "Body Jewelry", parentId: "80"),
  CategoryByParentId(categoryName: "Books", parentId: "83"),
  CategoryByParentId(categoryName: "Bracelets", parentId: "90"),
  CategoryByParentId(categoryName: "Collectibles", parentId: "138"),
  //There Are No SubCategories for Vintage
  CategoryByParentId(categoryName: "Earrings", parentId: "181"),
  //There Are No SubCategories for Wedding & Party

  CategoryByParentId(
      categoryName: "Electronics &amp; Accessories", parentId: "182"),
  CategoryByParentId(categoryName: "Home", parentId: "241"),
  CategoryByParentId(categoryName: "Home &amp; Hobby", parentId: "242"),
  CategoryByParentId(categoryName: "Invitations &amp; Paper", parentId: "254"),
  CategoryByParentId(categoryName: "Jewelry &amp; Beauty", parentId: "258"),
  CategoryByParentId(categoryName: "Kids&apos; &amp; Baby", parentId: "267"),
  CategoryByParentId(categoryName: "Men&apos;s", parentId: "295"),

  CategoryByParentId(categoryName: "Movies &amp; Music", parentId: "305"),
  CategoryByParentId(categoryName: "Painting", parentId: "325"),
  CategoryByParentId(categoryName: "Papercraft", parentId: "331"),
  CategoryByParentId(categoryName: "Party Supplies", parentId: "335"),
  CategoryByParentId(categoryName: "Pendants", parentId: "338"),
  CategoryByParentId(categoryName: "Pet Supplies", parentId: "348"),
  CategoryByParentId(categoryName: "Rings", parentId: "365"),
  CategoryByParentId(categoryName: "Sculpting &amp; Forming", parentId: "372"),
  CategoryByParentId(categoryName: "Sewing &amp; Fiber", parentId: "376"),
  CategoryByParentId(categoryName: "Toys", parentId: "438"),
  CategoryByParentId(categoryName: "Visual Arts", parentId: "452"),
  CategoryByParentId(categoryName: "Wedding Accessories", parentId: "461"),
  CategoryByParentId(categoryName: "Wedding Clothing", parentId: "463"),
  CategoryByParentId(categoryName: "Wedding Decorations", parentId: "464"),
  CategoryByParentId(categoryName: "Wedding gifts", parentId: "466"),
  CategoryByParentId(categoryName: "Wedding Jewelry", parentId: "469"),
  CategoryByParentId(categoryName: "Women&apos;s", parentId: "474"),
];
const List<CategoryByParentId> nav4ParentIds = [
  CategoryByParentId(categoryName: "Boys&apos; Clothing", parentId: "88"),
  CategoryByParentId(categoryName: "Dresses", parentId: "177"),
  CategoryByParentId(
      categoryName: "Floral &amp; Garden Crafts", parentId: "198"),
  CategoryByParentId(categoryName: "Girls&apos; Clothing", parentId: "217"),
  CategoryByParentId(categoryName: "Hair Accessories", parentId: "229"),
  CategoryByParentId(categoryName: "Handbags", parentId: "234"),
  CategoryByParentId(categoryName: "Home Décor", parentId: "244"),
  CategoryByParentId(
      categoryName: "Invitations &amp; Announcements", parentId: "253"),
  CategoryByParentId(
      categoryName: "Jewelry Making &amp; Beading", parentId: "261"),
  CategoryByParentId(categoryName: "Men&apos;s Clothing", parentId: "296"),
  CategoryByParentId(categoryName: "Rings", parentId: "365"),
  CategoryByParentId(categoryName: "Serving &amp; Dining", parentId: "374"),
  CategoryByParentId(categoryName: "Wedding &amp; Engagement", parentId: "459"),
  CategoryByParentId(categoryName: "Women&apos;s Clothing", parentId: "475"),
];
