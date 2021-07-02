import 'package:awesome_card/awesome_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/config/constants.dart';
import 'package:shop_app/models/purchase_models/review_model.dart';
import 'package:shop_app/view_models/provider/all_providers.dart';
import 'package:shop_app/widgets/user_profile_reusable_widgets/defaultAppBar.dart';
import 'package:shop_app/widgets/user_profile_reusable_widgets/defaultBackButton.dart';
import 'package:shop_app/widgets/user_profile_reusable_widgets/stickyLabel.dart';

class PaymentDetails extends StatefulWidget {
const PaymentDetails();
  @override
  _PaymentDetailsState createState() => _PaymentDetailsState();
}

class _PaymentDetailsState extends State<PaymentDetails> {

  @override
  Widget build(BuildContext context) {
    return Consumer<ReviewPaymentProvider>(
      builder:(_,reviewPaymentProvider,__){
        return  Scaffold(
          backgroundColor: Colors.white,
          appBar: DefaultAppBar(
            title: "Payment Details",
            child: DefaultBackButton(),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                CreditCard(
                  cardNumber: reviewPaymentProvider.cardInfoModel!.cardNumber,
                  cardExpiry:  reviewPaymentProvider.cardInfoModel!.expirationDate,
                  cardHolderName: reviewPaymentProvider.cardInfoModel!.cardHolderName,
                  bankName: reviewPaymentProvider.cardInfoModel!.bankName,
                  cvv: reviewPaymentProvider.cardInfoModel!.ccv,
                  // showBackSide: true,
                  frontBackground: CardBackgrounds.black,
                  backBackground: CardBackgrounds.white,
                  cardType: CardType.masterCard,
                  showShadow: true,
                ),
                StickyLabel(text: "Card Information", textColor: Colors.black,),
                SizedBox(height: 8.0),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 24.0),
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    border: Border.all(
                      width: 0.5,
                      color: kLightColor,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24.0,
                          vertical: 8.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("My Perosnal Card",
                                style: TextStyle(fontSize: 18.0)),
                            Container(
                                width: 60.0,
                                child: Icon(Icons.payment,
                                    color: kPrimaryColor, size: 40.0)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Card Number",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: kLightColor,
                                  ),
                                ),
                                Text(
                                  reviewPaymentProvider.cardInfoModel!.cardNumber,
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ],
                            ),
                            Container(
                              width: 45.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Exp.",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: kLightColor,
                                    ),
                                  ),
                                  Text(
                                    reviewPaymentProvider.cardInfoModel!.expirationDate,
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24.0,
                          vertical: 8.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Card Name",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: kLightColor,
                                  ),
                                ),
                                Text(
                                  reviewPaymentProvider.cardInfoModel!.cardHolderName,
                                  style: TextStyle(fontSize: 16.0),
                                ),
                              ],
                            ),
                            Container(
                              width: 45.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "CVV",
                                    style: TextStyle(
                                      fontSize: 16.0,
                                      color: kLightColor,
                                    ),
                                  ),
                                  Text(
                                    reviewPaymentProvider.cardInfoModel!.ccv,
                                    style: TextStyle(fontSize: 16.0),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 48.0,
                        width: MediaQuery.of(context).size.width,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10.0),
                              bottomRight: Radius.circular(10.0),
                            ),
                          ),
                          color: kDarkColor.withOpacity(0.2),
                          child: Text(
                            "Edit Detail",
                            style: TextStyle(fontSize: 16.0),
                          ),
                          onPressed: () => print("Edit Detail"),
                        ),
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
        );
      }

    );
  }
}
