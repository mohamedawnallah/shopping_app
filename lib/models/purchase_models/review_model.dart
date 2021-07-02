import 'package:awesome_card/extra/card_type.dart';

class ReviewModel {
  //Shipping Address Info Model
  final ShippingAddressModel? shippingAddressModel;
  //Credit Card Info Model
  final CardInfoModel? cardInfo;
  const ReviewModel({
    required this.shippingAddressModel,
    required this.cardInfo,
  });
}

class ShippingAddressModel {
  final String countryName;
  final String fullName;
  final String streetAddress;
  final String aptSuiteAddress;
  final String zipCode;
  final String city;
  final String state;
  const ShippingAddressModel(
      {required this.streetAddress,
      required this.countryName,
      required this.fullName,
      required this.aptSuiteAddress,
      required this.zipCode,
      required this.city,
      required this.state});
}

class CardInfoModel {
  final String cardNumber;
  final String expirationDate;
  final String ccv;
  final String cardHolderName;
  final String postalCode;
  final CardType cardType;
  final String bankName;
  const CardInfoModel(
      {required this.cardNumber,
      required this.expirationDate,
      required this.ccv,
      required this.cardHolderName,
      required this.cardType,
      required this.bankName,
      required this.postalCode});
}
