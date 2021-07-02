import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
class ReviewPaymentRoute extends StatelessWidget {
const ReviewPaymentRoute();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          CreditCardWidget(
            cardNumber: "",
            expiryDate: "",
            cardHolderName: "",
            cvvCode: "",
            showBackView: true, //true when you want to show cvv(back) view
          ),
        ],
      ),
    );
  }
}
