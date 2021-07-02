
class CreateOrderModel {
  final double totalAmount;
  final double statusUpdate;
  final double statusPhone;
  final String custName;
  final String companyName;
  final String aptSuite;
  final String address;
  final String city;
  final String country;
  final String state;
  final String postCode;
  final String phone;
  final String paymentOption;
  final String discountCode;
  final List<ProductDetailCreateOrderModel> productDetials;
  final String email;
  final String uniqueID;
  const CreateOrderModel(
      {required this.totalAmount,
      required this.statusUpdate,
      required this.statusPhone,
      required this.custName,
      required this.companyName,
      required this.aptSuite,
      required this.address,
      required this.city,
      required this.country,
      required this.state,
      required this.postCode,
      required this.phone,
      required this.paymentOption,
      required this.discountCode,
      required this.productDetials,
      required this.email,
      required this.uniqueID});
}

class ProductDetailCreateOrderModel {
  final String lineItemId;
  final String productId;
  final List<OptionProductModel> productOptions;

  final String quantity;
  final String cardMessage;
  final String amount;
  final String groupID;
  final String deliveryDate;
  final String deliveryTime;
  final String shippingOption;
  final String giftFlag;
  const ProductDetailCreateOrderModel({
    required this.deliveryTime,
    required this.lineItemId,
    required this.productId,
    required this.productOptions,
    required this.quantity,
    required this.cardMessage,
    required this.amount,
    required this.groupID,
    required this.deliveryDate,
    required this.shippingOption,
    required this.giftFlag,
  });
}

class OptionProductModel {
  final String optionLabel;
  final String optionValue;
  const OptionProductModel({required this.optionLabel, required this.optionValue});
}
