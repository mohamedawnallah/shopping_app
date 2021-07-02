import 'package:awesome_card/credit_card.dart';
import 'package:awesome_card/extra/card_type.dart';
import 'package:awesome_card/style/card_background.dart';
import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:credit_card_validator/credit_card_validator.dart';
import 'package:intl/intl.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/all_models.dart';
import 'package:shop_app/services/all_services.dart';
import 'package:shop_app/services/create_order_network_helper.dart';
import 'package:shop_app/view_models/provider/all_providers.dart';


class UserPurchasesRoute extends StatefulWidget {
  final String? appBarTitle;
  UserPurchasesRoute({this.appBarTitle});

  @override
  _UserPurchasesRouteState createState() => _UserPurchasesRouteState();
}

class _UserPurchasesRouteState extends State<UserPurchasesRoute> {
  PageController pageController = PageController(initialPage: 0);
  CreditCardValidator creditCardValidator = CreditCardValidator();

  //TODO Payment With Master Card Controllers
  TextEditingController? masterCardNumberController;
  TextEditingController? masterExpirationDateController;
  TextEditingController? masterCvvController;
  TextEditingController? masterPostalCodeController;
  TextEditingController? masterCardHolderNameController;
  TextEditingController? masterBankNameController;
  //TODO Payment With Visa Card Controllers
  TextEditingController? visaCardNumberController;
  TextEditingController? visaExpirationDateController;
  TextEditingController? visaCvvController;
  TextEditingController? visaPostalCodeController;
  TextEditingController? visaCardHolderNameController;
  TextEditingController? visaBankNameController;
  //TODO Payment With American Express
  TextEditingController? americanCardNumberController;
  TextEditingController? americanExpirationDateController;
  TextEditingController? americanCvvController;
  TextEditingController? americanPostalCodeController;
  TextEditingController? americanCardHolderNameController;
  TextEditingController? americanBankNameController;
  //TODO Payment With Discover
  TextEditingController? discoverCardNumberController;
  TextEditingController? discoverExpirationDateController;
  TextEditingController? discoverCvvController;
  TextEditingController? discoverPostalCodeController;
  TextEditingController? discoverCardHolderNameController;
  TextEditingController? discoverBankNameController;
  int _currentStep = 0;
  //TODO Shipping Address Controllres

  TextEditingController? countryController;
  TextEditingController? fullNameController;
  TextEditingController? streetAddressController;
  TextEditingController? aptSuiteController;
  TextEditingController? zipCodeController;
  TextEditingController? cityController;
  TextEditingController? stateController;

  //TODO Payment With Flutter
  TextEditingController? paypalEmailController;
  TextEditingController? paypalPasswordController;

  final formKey = GlobalKey<FormState>();

  //TODO Master Card Form Key
  final masterCardFormKey = GlobalKey<FormState>();
  //TODO Visa Card Form Key
  final visaCardFormKey = GlobalKey<FormState>();

  //TODO American Express Card Form Key
  final americanCardFormKey = GlobalKey<FormState>();

  //TODO Discover Card Form Key
  final discoverCardFormKey = GlobalKey<FormState>();
  //TODO Paypal Card Form Key

  final paypalCardFormKey = GlobalKey<FormState>();

  bool isPayWithCreditCardTapped = false;
  @override
  void initState() {
    super.initState();
    countryController = TextEditingController();
    fullNameController = TextEditingController();
    streetAddressController = TextEditingController();
    aptSuiteController = TextEditingController();
    zipCodeController = TextEditingController();
    cityController = TextEditingController();
    stateController = TextEditingController();

    //TODO Initiallization Controllers for Master Card
    masterCardNumberController = TextEditingController();
    masterCvvController = TextEditingController();
    masterExpirationDateController = TextEditingController();
    masterPostalCodeController = TextEditingController();
    masterCardHolderNameController = TextEditingController();
    masterBankNameController = TextEditingController();

    //TODO Initiallization Controllers for Visa Card
    visaCardNumberController = TextEditingController();
    visaCvvController = TextEditingController();
    visaExpirationDateController = TextEditingController();
    visaPostalCodeController = TextEditingController();
    visaCardHolderNameController = TextEditingController();
    visaBankNameController = TextEditingController();

    //TODO Initiallization Controllers for Discover Card
    americanCardNumberController = TextEditingController();
    americanCvvController = TextEditingController();
    americanExpirationDateController = TextEditingController();
    americanPostalCodeController = TextEditingController();
    americanCardHolderNameController = TextEditingController();
    americanBankNameController = TextEditingController();

    //TODO Initiallization Controllers for Discover Card
    discoverCardNumberController = TextEditingController();
    discoverCvvController = TextEditingController();
    discoverExpirationDateController = TextEditingController();
    discoverPostalCodeController = TextEditingController();
    discoverCardHolderNameController = TextEditingController();
    discoverBankNameController = TextEditingController();

    //TODO Initiallization Controllers for Paypal Card
    paypalEmailController = TextEditingController();
    paypalPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    countryController!.dispose();
    fullNameController!.dispose();
    streetAddressController!.dispose();
    aptSuiteController!.dispose();
    zipCodeController!.dispose();
    cityController!.dispose();
    stateController!.dispose();

    //TODO Disposing Controllers for Master Card
    masterCardNumberController!.dispose();
    masterCvvController!.dispose();
    masterExpirationDateController!.dispose();
    masterPostalCodeController!.dispose();
    masterCardHolderNameController!.dispose();
    masterBankNameController!.dispose();

    //TODO Disposing Controllers for Visa Card
    visaCardNumberController!.dispose();
    visaCvvController!.dispose();
    visaExpirationDateController!.dispose();
    visaPostalCodeController!.dispose();
    visaCardHolderNameController!.dispose();
    visaBankNameController!.dispose();
    //TODO Disposing Controllers for American Express
    americanCardNumberController!.dispose();
    americanCvvController!.dispose();
    americanExpirationDateController!.dispose();
    americanPostalCodeController!.dispose();
    americanCardHolderNameController!.dispose();
    americanBankNameController!.dispose();
    //TODO Disposing Controllers for Discover
    discoverCardNumberController!.dispose();
    discoverCvvController!.dispose();
    discoverExpirationDateController!.dispose();
    discoverPostalCodeController!.dispose();
    discoverCardHolderNameController!.dispose();
    discoverBankNameController!.dispose();
    //TODO Disposing Controllers for Paypal
    paypalEmailController!.dispose();
    paypalPasswordController!.dispose();
  }

  double totalPrice = 0;
  bool isPayWithPaypalClicked = false;
  @override
  Widget build(BuildContext context) {
    return Consumer<IndexBottomNavigationSaver>(
        builder: (_, indexBottomNavigationSaverProvider, __) {
      return Consumer<CartProductItemsProductModelProvider>(
          builder: (_, topperCartProductItemsChecked, __) {
        return Consumer<ReviewPaymentProvider>(
          builder: (_, paymentProvider, __) {
            return Scaffold(
              appBar: AppBar(
                title: Text(widget.appBarTitle!),
                centerTitle: false,
                leading: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.black,
                    size: 25,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              body: Consumer<CartProductItemsProductModelProvider>(
                  builder: (_, cartProductsChecked, __) {
                return 
                  //This is first Option

               Form(
                    key: formKey,
                    child: Container(
                      child: ListView(
                        children: [
                          Container(
                            color: Colors.grey[100],
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  top: 20, left: 40, bottom: 20),
                              child: Row(
                                children: <Widget>[
                                  _currentStep == 0
                                      ? Column(
                                          children: [
                                            Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  border: Border.all(
                                                      color: Colors.black,
                                                      width: 2)),
                                            ),
                                            Text(
                                              "Shipping",
                                              style: const TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ],
                                        )
                                      : Column(
                                          children: [
                                            Container(
                                              height: 40,
                                              width: 40,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: Color(0xff00C172),
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                border: Border.all(
                                                    color: Colors.black,
                                                    width: 2),
                                              ),
                                              child: Icon(
                                                Icons.check,
                                                color: Colors.white,
                                                size: 30,
                                              ),
                                            ),
                                            Text(
                                              "Shipping",
                                              style: const TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                  Text(
                                    "-------------------",
                                    style: TextStyle(
                                        color: _currentStep == 1
                                            ? Colors.black
                                            : Colors.grey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  _currentStep == 0
                                      ? Column(
                                          children: [
                                            Container(
                                              height: 20,
                                              width: 20,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  border: Border.all(
                                                      color: Colors.black,
                                                      width: 2)),
                                            ),
                                            SizedBox(height: 10),
                                            Text(
                                              "Payment",
                                              style: const TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ],
                                        )
                                      : _currentStep == 1
                                          ? Column(
                                              children: [
                                                Container(
                                                  height: 40,
                                                  width: 40,
                                                  decoration: BoxDecoration(
                                                      color: Colors.black,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      border: Border.all(
                                                          color: Colors.black,
                                                          width: 2)),
                                                ),
                                                SizedBox(height: 10),
                                                Text(
                                                  "Payment",
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ],
                                            )
                                          : Column(
                                              children: [
                                                Container(
                                                  height: 40,
                                                  width: 40,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      color: Color(0xff00C172),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      border: Border.all(
                                                          color: Colors.black,
                                                          width: 2)),
                                                  child: Icon(
                                                    Icons.check,
                                                    color: Colors.white,
                                                    size: 30,
                                                  ),
                                                ),
                                                SizedBox(height: 10),
                                                Text(
                                                  "Payment",
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                  Text(
                                    "-------------------",
                                    style: TextStyle(
                                        color: _currentStep == 2
                                            ? Colors.black
                                            : Colors.grey,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  _currentStep == 0 || _currentStep == 1
                                      ? Column(
                                          children: [
                                            Container(
                                              height: 20,
                                              width: 20,
                                              decoration: BoxDecoration(
                                                  color: Colors.grey,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  border: Border.all(
                                                      color: Colors.black,
                                                      width: 2)),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "Review",
                                              style: const TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ],
                                        )
                                      : _currentStep == 2
                                          ? Container(
                                              height: 40,
                                              width: 40,
                                              decoration: BoxDecoration(
                                                  color: Colors.black,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  border: Border.all(
                                                      color: Colors.black,
                                                      width: 2)),
                                            )
                                          : Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: 40,
                                                  width: 40,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                      color: Color(0xff00C172),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      border: Border.all(
                                                          color: Colors.black,
                                                          width: 2)),
                                                  child: Icon(
                                                    Icons.check,
                                                    color: Colors.white,
                                                    size: 30,
                                                  ),
                                                ),
                                                Text(
                                                  "Review",
                                                  style: const TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                ],
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.grey,
                            thickness: 5,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height -
                                MediaQuery.of(context).padding.top -
                                240,
                            child: PageView.builder(
                              controller: pageController,
                              physics: NeverScrollableScrollPhysics(),
                              onPageChanged: (value) {
                                setState(() {
                                  _currentStep = value;
                                });
                              },
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                if (_currentStep == 0) {
                                  return SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            "Enter Your Shipping Address",
                                            style: const TextStyle(
                                                color: Color(0xff212121),
                                                fontSize: 22,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 30,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                "Country",
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              TextFormField(
                                                controller: countryController,
                                                validator: (countryName) {
                                                  if (countryName!.isEmpty) {
                                                    return "Country Name Is Empty";
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                        color: Colors.red),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                        color: Colors.red),
                                                  ),
                                                  errorStyle: TextStyle(
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  hintText:
                                                      "Enter your country name",
                                                  labelStyle: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 25),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 19,
                                              ),
                                              Text(
                                                "Full name",
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              TextFormField(
                                                controller: fullNameController,
                                                validator: (fullName) {
                                                  if (fullName!.isEmpty) {
                                                    return "Name is empty";
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                        color: Colors.red),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                        color: Colors.red),
                                                  ),
                                                  errorStyle: TextStyle(
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  hintText:
                                                      "Enter your full name",
                                                  labelStyle: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 25),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 19,
                                              ),
                                              Text(
                                                "Street Address",
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              TextFormField(
                                                controller:
                                                    streetAddressController,
                                                validator: (streetAddress) {
                                                  if (streetAddress!.isEmpty) {
                                                    return "Street address is empty";
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                        color: Colors.red),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                        color: Colors.red),
                                                  ),
                                                  errorStyle: TextStyle(
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  hintText:
                                                      "Enter your street address",
                                                  labelStyle: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 25),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 19,
                                              ),
                                              Text(
                                                "Apt / Suite / Other",
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              TextFormField(
                                                controller: aptSuiteController,
                                                validator:
                                                    (aptSuiteController) {
                                                  if (aptSuiteController!
                                                      .isEmpty) {
                                                    return "Apt/Suit/Other is empty";
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                        color: Colors.red),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                        color: Colors.red),
                                                  ),
                                                  errorStyle: TextStyle(
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  hintText:
                                                      "Enter your apt / suite / other ",
                                                  labelStyle: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 25),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 19,
                                              ),
                                              Text(
                                                "Zip code",
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              TextFormField(
                                                controller: zipCodeController,
                                                validator: (zipCode) {
                                                  if (zipCode!.isEmpty) {
                                                    return "Zip Code is empty";
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                        color: Colors.red),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                        color: Colors.red),
                                                  ),
                                                  errorStyle: TextStyle(
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  hintText:
                                                      "Enter your zip code",
                                                  labelStyle: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 25),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 19,
                                              ),
                                              Text(
                                                "City",
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              TextFormField(
                                                controller: cityController,
                                                validator: (city) {
                                                  if (city!.isEmpty) {
                                                    return "City is empty";
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                        color: Colors.red),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                        color: Colors.red),
                                                  ),
                                                  errorStyle: TextStyle(
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  hintText:
                                                      "Enter your city name",
                                                  labelStyle: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 25),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 19,
                                              ),
                                              Text(
                                                "State",
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 18),
                                              ),
                                              TextFormField(
                                                controller: stateController,
                                                validator: (state) {
                                                  if (state!.isEmpty) {
                                                    return "State is empty";
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  focusedErrorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                        color: Colors.red),
                                                  ),
                                                  errorBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    borderSide: BorderSide(
                                                        color: Colors.red),
                                                  ),
                                                  errorStyle: TextStyle(
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  hintText:
                                                      "Enter your state name",
                                                  labelStyle: const TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 25),
                                                ),
                                              ),
                                              SizedBox(height: 166),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                } else if (_currentStep == 1) {
                                  return SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Text(
                                            "Choose a payment Method",
                                            style: const TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 24),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: Text(
                                              "You will not be charged until you review the order on the next page",
                                              style: const TextStyle(
                                                  fontSize: 18,
                                                  color: Colors.black)),
                                        ),
                                        Divider(
                                          color: Colors.red[900],
                                          thickness: 1.4,
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 6),
                                          child: Column(
                                            children: <Widget>[
                                              Divider(
                                                color: Colors.grey,
                                                thickness: 1,
                                              ),
                                              ExpansionTile(
                                                trailing: SizedBox.shrink(),
                                                title: SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: <Widget>[
                                                      Row(
                                                        children: <Widget>[
                                                          GestureDetector(
                                                            onTap: () {
                                                              if (isPayWithCreditCardTapped) {
                                                                isPayWithCreditCardTapped =
                                                                    false;
                                                              } else {
                                                                isPayWithCreditCardTapped =
                                                                    true;
                                                              }
                                                              setState(() {});
                                                            },
                                                            child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              width: 15,
                                                              height: 15,
                                                              decoration: BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: Colors
                                                                      .white,
                                                                  border: Border.all(
                                                                      color: Colors
                                                                          .grey,
                                                                      width:
                                                                          2)),
                                                              child:
                                                                  isPayWithCreditCardTapped
                                                                      ? Icon(
                                                                          Icons
                                                                              .check,
                                                                          color:
                                                                              Colors.green[900],
                                                                          size:
                                                                              10,
                                                                        )
                                                                      : Icon(
                                                                          Icons
                                                                              .ac_unit,
                                                                          color: Colors
                                                                              .white,
                                                                          size:
                                                                              10),
                                                            ),
                                                          ),
                                                          SizedBox(width: 10),
                                                          Text(
                                                            "Credit Card",
                                                            style: const TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 20),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(width: 6),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: <Widget>[
                                                          Container(
                                                            height: 40,
                                                            width: 50,
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(3),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .grey,
                                                                    width: 1.3),
                                                                color: Colors
                                                                    .white),
                                                            child: Image.asset(
                                                                "assets/images/payment/mastercard.png",
                                                                fit: BoxFit
                                                                    .cover,
                                                                width: 30,
                                                                height: 30),
                                                          ),
                                                          SizedBox(width: 3),
                                                          Container(
                                                            height: 40,
                                                            width: 50,
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(3),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .grey,
                                                                    width: 1.3),
                                                                color: Colors
                                                                    .white),
                                                            child: Image.asset(
                                                                "assets/images/payment/visa.png",
                                                                fit: BoxFit
                                                                    .cover,
                                                                width: 30,
                                                                height: 30),
                                                          ),
                                                          SizedBox(width: 3),
                                                          Container(
                                                            height: 40,
                                                            width: 50,
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(3),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .grey,
                                                                    width: 1.3),
                                                                color: Colors
                                                                    .white),
                                                            child: Image.asset(
                                                                "assets/images/payment/american_express.png",
                                                                fit: BoxFit
                                                                    .cover,
                                                                width: 30,
                                                                height: 30),
                                                          ),
                                                          SizedBox(width: 3),
                                                          Container(
                                                            height: 40,
                                                            width: 50,
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(3),
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10),
                                                                border: Border.all(
                                                                    color: Colors
                                                                        .grey,
                                                                    width: 1.3),
                                                                color: Colors
                                                                    .white),
                                                            child: Image.asset(
                                                                "assets/images/payment/discover.png",
                                                                fit: BoxFit
                                                                    .cover,
                                                                width: 30,
                                                                height: 30),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                children: [
                                                  ExpansionTile(
                                                    title: Text(
                                                        "Pay with Master Card"),
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Form(
                                                          key:
                                                              masterCardFormKey,
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child: Text(
                                                                  "Card Holder Name",
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          18),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height: 4),
                                                              TextFormField(
                                                                controller:
                                                                    masterCardHolderNameController,
                                                                validator:
                                                                    (cardNumber) {
                                                                  if (masterCardHolderNameController!
                                                                      .text
                                                                      .isEmpty) {
                                                                    return "Card Holder Name is empty";
                                                                  } else {
                                                                    return null;
                                                                  }
                                                                },
                                                                decoration:
                                                                    InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.red),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.red),
                                                                  ),
                                                                  errorStyle: TextStyle(
                                                                      color: Colors
                                                                          .red,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                  hintText:
                                                                      "Enter your card holder name",
                                                                  labelStyle: const TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          25),
                                                                ),
                                                              ),
                                                              Container(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child: Text(
                                                                  "Card Number",
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          18),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height: 4),
                                                              TextFormField(
                                                                controller:
                                                                    masterCardNumberController,
                                                                validator:
                                                                    (cardNumber) {
                                                                  if (!creditCardValidator
                                                                      .validateCCNum(
                                                                          cardNumber)
                                                                      .isValid) {
                                                                    print(
                                                                        "***********");
                                                                    print(
                                                                        "Card Number is Valid");
                                                                    return "This card number is not valid";
                                                                  } else {
                                                                    return null;
                                                                  }
                                                                },
                                                                decoration:
                                                                    InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.red),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.red),
                                                                  ),
                                                                  errorStyle: TextStyle(
                                                                      color: Colors
                                                                          .red,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                  hintText:
                                                                      "Enter your card number",
                                                                  labelStyle: const TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          25),
                                                                ),
                                                              ),
                                                              Container(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child: Text(
                                                                  "Bank Name",
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          18),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height: 4),
                                                              TextFormField(
                                                                controller:
                                                                    masterBankNameController,
                                                                validator:
                                                                    (cardNumber) {
                                                                  if (masterBankNameController!
                                                                      .text
                                                                      .isEmpty) {
                                                                    return "Bank Name is empty";
                                                                  } else {
                                                                    return null;
                                                                  }
                                                                },
                                                                decoration:
                                                                    InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.red),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.red),
                                                                  ),
                                                                  errorStyle: TextStyle(
                                                                      color: Colors
                                                                          .red,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                  hintText:
                                                                      "Enter your bank name",
                                                                  labelStyle: const TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          25),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height: 15),
                                                              Row(
                                                                children: <
                                                                    Widget>[
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      children: <
                                                                          Widget>[
                                                                        Container(
                                                                          alignment:
                                                                              Alignment.centerLeft,
                                                                          child:
                                                                              Text(
                                                                            "Expiration Date",
                                                                            style: const TextStyle(
                                                                                color: Colors.black,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 18),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                            height:
                                                                                4),
                                                                        TextFormField(
                                                                          controller:
                                                                              masterExpirationDateController,
                                                                          validator:
                                                                              (expirationDate) {
                                                                            if (expirationDate!.isEmpty &&
                                                                                !creditCardValidator.validateExpDate(expirationDate).isValid) {
                                                                              return "This expiration date is not valid";
                                                                            } else {
                                                                              return null;
                                                                            }
                                                                          },
                                                                          decoration:
                                                                              InputDecoration(
                                                                            border:
                                                                                InputBorder.none,
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                              borderSide: BorderSide(color: Colors.red),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                              borderSide: BorderSide(color: Colors.red),
                                                                            ),
                                                                            errorStyle:
                                                                                TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                                                            hintText:
                                                                                "MM/YY",
                                                                            labelStyle: const TextStyle(
                                                                                color: Colors.black,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 25),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                      width: 6),
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      children: <
                                                                          Widget>[
                                                                        Container(
                                                                          alignment:
                                                                              Alignment.centerLeft,
                                                                          child:
                                                                              Text(
                                                                            "CVV (4 digits)",
                                                                            style: const TextStyle(
                                                                                color: Colors.black,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 18),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                            height:
                                                                                4),
                                                                        TextFormField(
                                                                          controller:
                                                                              masterCvvController,
                                                                          validator:
                                                                              (cvv) {
                                                                            if (cvv!.isEmpty &&
                                                                                !creditCardValidator.validateCVV(cvv, CreditCardType.mastercard).isValid) {
                                                                              return "This card number is not valid";
                                                                            } else {
                                                                              return null;
                                                                            }
                                                                          },
                                                                          decoration:
                                                                              InputDecoration(
                                                                            border:
                                                                                InputBorder.none,
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                              borderSide: BorderSide(color: Colors.red),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                              borderSide: BorderSide(color: Colors.red),
                                                                            ),
                                                                            errorStyle:
                                                                                TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                                                            hintText:
                                                                                "CVV",
                                                                            labelStyle: const TextStyle(
                                                                                color: Colors.black,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 25),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                      width: 6),
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      children: <
                                                                          Widget>[
                                                                        Container(
                                                                          alignment:
                                                                              Alignment.centerLeft,
                                                                          child:
                                                                              Text(
                                                                            "Postal Code",
                                                                            style: const TextStyle(
                                                                                color: Colors.black,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 18),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                            height:
                                                                                4),
                                                                        TextFormField(
                                                                          controller:
                                                                              masterPostalCodeController,
                                                                          validator:
                                                                              (postalCode) {
                                                                            if (postalCode!.isEmpty) {
                                                                              return 'Postal code is empty';
                                                                            } else {
                                                                              return null;
                                                                            }
                                                                          },
                                                                          decoration:
                                                                              InputDecoration(
                                                                            border:
                                                                                InputBorder.none,
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                              borderSide: BorderSide(color: Colors.red),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                              borderSide: BorderSide(color: Colors.red),
                                                                            ),
                                                                            errorStyle:
                                                                                TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                                                            hintText:
                                                                                "postal code",
                                                                            labelStyle: const TextStyle(
                                                                                color: Colors.black,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 25),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                  height: 15),
                                                              GestureDetector(
                                                                onTap: () {
                                                                  //TODO Payment With Master Card
                                                                  if (masterCardFormKey
                                                                      .currentState!
                                                                      .validate()) {
                                                                    print(
                                                                        "Process Of Buying Through Master Card");
                                                                    //TODO Card Holder Name With Each Field Supported With Text Form Field

                                                                    //TODO Adding Card Info To Provider
                                                                    paymentProvider.addCardInfoModel(CardInfoModel(
                                                                        cardNumber:
                                                                            masterCardNumberController!
                                                                                .text,
                                                                        expirationDate:
                                                                            masterExpirationDateController!
                                                                                .text,
                                                                        ccv: masterCvvController!
                                                                            .text,
                                                                        cardHolderName:
                                                                            masterCardHolderNameController!
                                                                                .text,
                                                                        postalCode:
                                                                            masterPostalCodeController!
                                                                                .text,
                                                                        cardType:
                                                                            CardType
                                                                                .masterCard,
                                                                        bankName:
                                                                            masterBankNameController!.text));
                                                                    //TODO Adding Review Model (Card Info Mode + Shipping Address Model) To Provider
                                                                    paymentProvider.addReviewModel(ReviewModel(
                                                                        shippingAddressModel:
                                                                            paymentProvider
                                                                                .shippingAddressModel,
                                                                        cardInfo:
                                                                            paymentProvider.cardInfoModel));
                                                                    _currentStep =
                                                                        2;
                                                                    setState(
                                                                        () {});
                                                                    pageController.animateToPage(
                                                                        _currentStep,
                                                                        duration: Duration(
                                                                            milliseconds:
                                                                                500),
                                                                        curve: Curves
                                                                            .linear);
                                                                  }
                                                                },
                                                                child:
                                                                    Container(
                                                                        height:
                                                                            38,
                                                                        alignment:
                                                                            Alignment
                                                                                .center,
                                                                        width: MediaQuery.of(context)
                                                                            .size
                                                                            .width,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
                                                                          color:
                                                                              Colors.red,
                                                                          gradient: LinearGradient(
                                                                              begin: Alignment.centerLeft,
                                                                              end: Alignment.centerRight,
                                                                              colors: <Color>[
                                                                                Color(0xffFF0000),
                                                                                Color(0xffFF4F00),
                                                                                Color(0xffFF9900)
                                                                              ]),
                                                                        ),
                                                                        child: Text(
                                                                            "Proceed Now",
                                                                            style:
                                                                                const TextStyle(color: Colors.white, fontSize: 25))),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  ExpansionTile(
                                                    title: Text(
                                                        "Pay with Visa Card"),
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Form(
                                                          key: visaCardFormKey,
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child: Text(
                                                                  "Card Holder Name",
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          18),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height: 4),
                                                              TextFormField(
                                                                controller:
                                                                    visaCardHolderNameController,
                                                                validator:
                                                                    (cardNumber) {
                                                                  if (visaCardHolderNameController!
                                                                      .text
                                                                      .isEmpty) {
                                                                    return "Card Holder Name is empty";
                                                                  } else {
                                                                    return null;
                                                                  }
                                                                },
                                                                decoration:
                                                                    InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.red),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.red),
                                                                  ),
                                                                  errorStyle: TextStyle(
                                                                      color: Colors
                                                                          .red,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                  hintText:
                                                                      "Enter your card holder",
                                                                  labelStyle: const TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          25),
                                                                ),
                                                              ),
                                                              Container(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child: Text(
                                                                  "Card Number",
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          18),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height: 4),
                                                              TextFormField(
                                                                controller:
                                                                    visaCardNumberController,
                                                                validator:
                                                                    (cardNumber) {
                                                                  if (!creditCardValidator
                                                                      .validateCCNum(
                                                                          cardNumber)
                                                                      .isValid) {
                                                                    return "This card number is not valid";
                                                                  } else {
                                                                    return null;
                                                                  }
                                                                },
                                                                decoration:
                                                                    InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.red),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.red),
                                                                  ),
                                                                  errorStyle: TextStyle(
                                                                      color: Colors
                                                                          .red,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                  hintText:
                                                                      "Enter your card number",
                                                                  labelStyle: const TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          25),
                                                                ),
                                                              ),
                                                              Container(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child: Text(
                                                                  "Bank Name",
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          18),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height: 4),
                                                              TextFormField(
                                                                controller:
                                                                    visaBankNameController,
                                                                validator:
                                                                    (cardNumber) {
                                                                  if (visaBankNameController!
                                                                      .text
                                                                      .isEmpty) {
                                                                    return "Card Bank Name is empty";
                                                                  } else {
                                                                    return null;
                                                                  }
                                                                },
                                                                decoration:
                                                                    InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.red),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.red),
                                                                  ),
                                                                  errorStyle: TextStyle(
                                                                      color: Colors
                                                                          .red,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                  hintText:
                                                                      "Enter your bank name",
                                                                  labelStyle: const TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          25),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height: 15),
                                                              Row(
                                                                children: <
                                                                    Widget>[
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      children: <
                                                                          Widget>[
                                                                        Container(
                                                                          alignment:
                                                                              Alignment.centerLeft,
                                                                          child:
                                                                              Text(
                                                                            "Expiration Date",
                                                                            style: const TextStyle(
                                                                                color: Colors.black,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 18),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                            height:
                                                                                4),
                                                                        TextFormField(
                                                                          controller:
                                                                              visaExpirationDateController,
                                                                          validator:
                                                                              (expirationDate) {
                                                                            if (!creditCardValidator.validateExpDate(expirationDate).isValid) {
                                                                              return "This expiration date is not valid";
                                                                            } else {
                                                                              return null;
                                                                            }
                                                                          },
                                                                          decoration:
                                                                              InputDecoration(
                                                                            border:
                                                                                InputBorder.none,
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                              borderSide: BorderSide(color: Colors.red),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                              borderSide: BorderSide(color: Colors.red),
                                                                            ),
                                                                            errorStyle:
                                                                                TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                                                            hintText:
                                                                                "MM/YY",
                                                                            labelStyle: const TextStyle(
                                                                                color: Colors.black,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 25),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                      width: 6),
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      children: <
                                                                          Widget>[
                                                                        Container(
                                                                          alignment:
                                                                              Alignment.centerLeft,
                                                                          child:
                                                                              Text(
                                                                            "CVV (4 digits)",
                                                                            style: const TextStyle(
                                                                                color: Colors.black,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 18),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                            height:
                                                                                4),
                                                                        TextFormField(
                                                                          controller:
                                                                              visaCvvController,
                                                                          validator:
                                                                              (cvv) {
                                                                            if (!creditCardValidator.validateCVV(cvv, CreditCardType.visa).isValid) {
                                                                              return "This card number is not valid";
                                                                            } else {
                                                                              return null;
                                                                            }
                                                                          },
                                                                          decoration:
                                                                              InputDecoration(
                                                                            border:
                                                                                InputBorder.none,
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                              borderSide: BorderSide(color: Colors.red),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                              borderSide: BorderSide(color: Colors.red),
                                                                            ),
                                                                            errorStyle:
                                                                                TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                                                            hintText:
                                                                                "CVV",
                                                                            labelStyle: const TextStyle(
                                                                                color: Colors.black,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 25),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                      width: 6),
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      children: <
                                                                          Widget>[
                                                                        Container(
                                                                          alignment:
                                                                              Alignment.centerLeft,
                                                                          child:
                                                                              Text(
                                                                            "Postal Code",
                                                                            style: const TextStyle(
                                                                                color: Colors.black,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 18),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                            height:
                                                                                4),
                                                                        TextFormField(
                                                                          controller:
                                                                              visaPostalCodeController,
                                                                          validator:
                                                                              (postalCode) {
                                                                            if (postalCode!.isEmpty) {
                                                                              return 'Postal code is empty';
                                                                            } else {
                                                                              return null;
                                                                            }
                                                                          },
                                                                          decoration:
                                                                              InputDecoration(
                                                                            border:
                                                                                InputBorder.none,
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                              borderSide: BorderSide(color: Colors.red),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                              borderSide: BorderSide(color: Colors.red),
                                                                            ),
                                                                            errorStyle:
                                                                                TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                                                            hintText:
                                                                                "postal code",
                                                                            labelStyle: const TextStyle(
                                                                                color: Colors.black,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 25),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                  height: 15),
                                                              GestureDetector(
                                                                onTap: () {
                                                                  //TODO Payment With Visa Card
                                                                  if (visaCardFormKey
                                                                      .currentState!
                                                                      .validate()) {
                                                                    print(
                                                                        "Process Of Buying Through Visa Card");
                                                                    // Navigator.of(context).pushNamed(MaterialPageRoute(builder: (_)=>PaymentCreditCardUI(cardNumber: cardNumber, expirationDate: expirationDate, CVV: CVV, cardHolderName: cardHolderName)))
                                                                    //TODO Adding Card Info To Provider
                                                                    paymentProvider
                                                                        .addCardInfoModel(
                                                                      CardInfoModel(
                                                                        cardNumber:
                                                                            visaCardNumberController!.text,
                                                                        expirationDate:
                                                                            visaExpirationDateController!.text,
                                                                        ccv: visaCvvController!
                                                                            .text,
                                                                        cardHolderName:
                                                                            visaCardHolderNameController!.text,
                                                                        postalCode:
                                                                            visaPostalCodeController!.text,
                                                                        bankName:
                                                                            visaBankNameController!.text,
                                                                        cardType:
                                                                            CardType.visa,
                                                                      ),
                                                                    );
                                                                    //TODO Adding Review Model (Card Info Mode + Shipping Address Model) To Provider
                                                                    paymentProvider.addReviewModel(ReviewModel(
                                                                        shippingAddressModel:
                                                                            paymentProvider
                                                                                .shippingAddressModel,
                                                                        cardInfo:
                                                                            paymentProvider.cardInfoModel));
                                                                    _currentStep =
                                                                        2;
                                                                    pageController.animateToPage(
                                                                        _currentStep,
                                                                        duration: Duration(
                                                                            milliseconds:
                                                                                500),
                                                                        curve: Curves
                                                                            .linear);
                                                                  }
                                                                },
                                                                child: Container(
                                                                    height: 38,
                                                                    alignment: Alignment.center,
                                                                    width: MediaQuery.of(context).size.width,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(10),
                                                                        color: Colors.red,
                                                                        gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: <Color>[
                                                                          Color(
                                                                              0xffFFA800),
                                                                          Color(
                                                                              0xff005DB2),
                                                                        ])),
                                                                    child: Text("Proceed Now", style: const TextStyle(color: Colors.white, fontSize: 25))),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  ExpansionTile(
                                                    title: Text(
                                                        "Pay with American Express"),
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Form(
                                                          key:
                                                              americanCardFormKey,
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child: Text(
                                                                  "Card Holder Name",
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          18),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height: 4),
                                                              TextFormField(
                                                                controller:
                                                                    americanCardHolderNameController,
                                                                validator:
                                                                    (cardNumber) {
                                                                  if (americanCardHolderNameController!
                                                                      .text
                                                                      .isEmpty) {
                                                                    return "Card Holder Name is empty";
                                                                  } else {
                                                                    return null;
                                                                  }
                                                                },
                                                                decoration:
                                                                    InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.red),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.red),
                                                                  ),
                                                                  errorStyle: TextStyle(
                                                                      color: Colors
                                                                          .red,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                  hintText:
                                                                      "Enter your card holder name",
                                                                  labelStyle: const TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          25),
                                                                ),
                                                              ),
                                                              Container(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child: Text(
                                                                  "Card Number",
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          18),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height: 4),
                                                              TextFormField(
                                                                controller:
                                                                    americanCardNumberController,
                                                                validator:
                                                                    (cardNumber) {
                                                                  if (!creditCardValidator
                                                                      .validateCCNum(
                                                                          cardNumber)
                                                                      .isValid) {
                                                                    return "This card number is not valid";
                                                                  } else {
                                                                    return null;
                                                                  }
                                                                },
                                                                decoration:
                                                                    InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.red),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.red),
                                                                  ),
                                                                  errorStyle: TextStyle(
                                                                      color: Colors
                                                                          .red,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                  hintText:
                                                                      "Enter your card number",
                                                                  labelStyle: const TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          25),
                                                                ),
                                                              ),
                                                              Container(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child: Text(
                                                                  "Bank Name",
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          18),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height: 4),
                                                              TextFormField(
                                                                controller:
                                                                    americanBankNameController,
                                                                validator:
                                                                    (cardNumber) {
                                                                  if (americanBankNameController!
                                                                      .text
                                                                      .isEmpty) {
                                                                    return "Card Bank Name is empty";
                                                                  } else {
                                                                    return null;
                                                                  }
                                                                },
                                                                decoration:
                                                                    InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.red),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.red),
                                                                  ),
                                                                  errorStyle: TextStyle(
                                                                      color: Colors
                                                                          .red,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                  hintText:
                                                                      "Enter your bank name",
                                                                  labelStyle: const TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          25),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height: 15),
                                                              Row(
                                                                children: <
                                                                    Widget>[
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      children: <
                                                                          Widget>[
                                                                        Container(
                                                                          alignment:
                                                                              Alignment.centerLeft,
                                                                          child:
                                                                              Text(
                                                                            "Expiration Date",
                                                                            style: const TextStyle(
                                                                                color: Colors.black,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 18),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                            height:
                                                                                4),
                                                                        TextFormField(
                                                                          controller:
                                                                              americanExpirationDateController,
                                                                          validator:
                                                                              (expirationDate) {
                                                                            if (!creditCardValidator.validateExpDate(expirationDate).isValid) {
                                                                              return "This expiration date is not valid";
                                                                            } else {
                                                                              return null;
                                                                            }
                                                                          },
                                                                          decoration:
                                                                              InputDecoration(
                                                                            border:
                                                                                InputBorder.none,
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                              borderSide: BorderSide(color: Colors.red),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                              borderSide: BorderSide(color: Colors.red),
                                                                            ),
                                                                            errorStyle:
                                                                                TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                                                            hintText:
                                                                                "MM/YY",
                                                                            labelStyle: const TextStyle(
                                                                                color: Colors.black,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 25),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                      width: 6),
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      children: <
                                                                          Widget>[
                                                                        Container(
                                                                          alignment:
                                                                              Alignment.centerLeft,
                                                                          child:
                                                                              Text(
                                                                            "CVV (4 digits)",
                                                                            style: const TextStyle(
                                                                                color: Colors.black,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 18),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                            height:
                                                                                4),
                                                                        TextFormField(
                                                                          controller:
                                                                              americanCvvController,
                                                                          validator:
                                                                              (cvv) {
                                                                            if (!creditCardValidator.validateCVV(cvv, CreditCardType.amex).isValid) {
                                                                              return "This card number is not valid";
                                                                            } else {
                                                                              return null;
                                                                            }
                                                                          },
                                                                          decoration:
                                                                              InputDecoration(
                                                                            border:
                                                                                InputBorder.none,
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                              borderSide: BorderSide(color: Colors.red),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                              borderSide: BorderSide(color: Colors.red),
                                                                            ),
                                                                            errorStyle:
                                                                                TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                                                            hintText:
                                                                                "CVV",
                                                                            labelStyle: const TextStyle(
                                                                                color: Colors.black,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 25),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                      width: 6),
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      children: <
                                                                          Widget>[
                                                                        Container(
                                                                          alignment:
                                                                              Alignment.centerLeft,
                                                                          child:
                                                                              Text(
                                                                            "Postal Code",
                                                                            style: const TextStyle(
                                                                                color: Colors.black,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 18),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                            height:
                                                                                4),
                                                                        TextFormField(
                                                                          controller:
                                                                              americanPostalCodeController,
                                                                          validator:
                                                                              (postalCode) {
                                                                            if (postalCode!.isEmpty) {
                                                                              return 'Postal code is empty';
                                                                            } else {
                                                                              return null;
                                                                            }
                                                                          },
                                                                          decoration:
                                                                              InputDecoration(
                                                                            border:
                                                                                InputBorder.none,
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                              borderSide: BorderSide(color: Colors.red),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                              borderSide: BorderSide(color: Colors.red),
                                                                            ),
                                                                            errorStyle:
                                                                                TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                                                            hintText:
                                                                                "postal code",
                                                                            labelStyle: const TextStyle(
                                                                                color: Colors.black,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 25),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                  height: 15),
                                                              GestureDetector(
                                                                onTap: () {
                                                                  if (americanCardFormKey
                                                                      .currentState!
                                                                      .validate()) {
                                                                    print(
                                                                        "Process Of Buying Through American Express Card");
                                                                    //TODO Adding Card Info To Provider
                                                                    paymentProvider
                                                                        .addCardInfoModel(
                                                                      CardInfoModel(
                                                                        cardNumber:
                                                                            americanCardNumberController!.text,
                                                                        expirationDate:
                                                                            americanExpirationDateController!.text,
                                                                        ccv: americanCvvController!
                                                                            .text,
                                                                        cardHolderName:
                                                                            americanCardHolderNameController!.text,
                                                                        postalCode:
                                                                            americanPostalCodeController!.text,
                                                                        bankName:
                                                                            americanBankNameController!.text,
                                                                        cardType:
                                                                            CardType.americanExpress,
                                                                      ),
                                                                    );
                                                                    //TODO Adding Review Model (Card Info Mode + Shipping Address Model) To Provider
                                                                    paymentProvider.addReviewModel(ReviewModel(
                                                                        shippingAddressModel:
                                                                            paymentProvider
                                                                                .shippingAddressModel,
                                                                        cardInfo:
                                                                            paymentProvider.cardInfoModel));
                                                                    _currentStep =
                                                                        2;
                                                                    pageController.animateToPage(
                                                                        _currentStep,
                                                                        duration: Duration(
                                                                            milliseconds:
                                                                                500),
                                                                        curve: Curves
                                                                            .linear);
                                                                  }
                                                                },
                                                                child: Container(
                                                                    height: 38,
                                                                    alignment: Alignment.center,
                                                                    width: MediaQuery.of(context).size.width,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(10),
                                                                        color: Colors.red,
                                                                        gradient: LinearGradient(begin: Alignment.centerLeft, end: Alignment.centerRight, colors: <Color>[
                                                                          Color(
                                                                              0xff0070AE),
                                                                          Color(
                                                                              0xff8DB0CF),
                                                                        ])),
                                                                    child: Text("Proceed Now", style: const TextStyle(color: Colors.white, fontSize: 25))),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  ExpansionTile(
                                                    title: Text(
                                                        "Pay with Discover"),
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Form(
                                                          key:
                                                              discoverCardFormKey,
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child: Text(
                                                                  "Card Holder Name",
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          18),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height: 4),
                                                              TextFormField(
                                                                controller:
                                                                    discoverCardHolderNameController,
                                                                validator:
                                                                    (cardNumber) {
                                                                  if (discoverCardHolderNameController!
                                                                      .text
                                                                      .isEmpty) {
                                                                    return "Card Holder Name is empty";
                                                                  } else {
                                                                    return null;
                                                                  }
                                                                },
                                                                decoration:
                                                                    InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.red),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.red),
                                                                  ),
                                                                  errorStyle: TextStyle(
                                                                      color: Colors
                                                                          .red,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                  hintText:
                                                                      "Enter your card holder name",
                                                                  labelStyle: const TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          25),
                                                                ),
                                                              ),
                                                              Container(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child: Text(
                                                                  "Card Number",
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          18),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height: 4),
                                                              TextFormField(
                                                                controller:
                                                                    discoverCardNumberController,
                                                                validator:
                                                                    (cardNumber) {
                                                                  if (!creditCardValidator
                                                                      .validateCCNum(
                                                                          cardNumber)
                                                                      .isValid) {
                                                                    return "This card number is not valid";
                                                                  } else {
                                                                    return null;
                                                                  }
                                                                },
                                                                decoration:
                                                                    InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.red),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.red),
                                                                  ),
                                                                  errorStyle: TextStyle(
                                                                      color: Colors
                                                                          .red,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                  hintText:
                                                                      "Enter your card number",
                                                                  labelStyle: const TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          25),
                                                                ),
                                                              ),
                                                              Container(
                                                                alignment: Alignment
                                                                    .centerLeft,
                                                                child: Text(
                                                                  "Bank Name",
                                                                  style: const TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          18),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height: 4),
                                                              TextFormField(
                                                                controller:
                                                                    discoverBankNameController,
                                                                validator:
                                                                    (cardNumber) {
                                                                  if (discoverBankNameController!
                                                                      .text
                                                                      .isEmpty) {
                                                                    return "Card Bank Name is empty";
                                                                  } else {
                                                                    return null;
                                                                  }
                                                                },
                                                                decoration:
                                                                    InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  enabledBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  focusedBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                  ),
                                                                  focusedErrorBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.red),
                                                                  ),
                                                                  errorBorder:
                                                                      OutlineInputBorder(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(8),
                                                                    borderSide:
                                                                        BorderSide(
                                                                            color:
                                                                                Colors.red),
                                                                  ),
                                                                  errorStyle: TextStyle(
                                                                      color: Colors
                                                                          .red,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                  hintText:
                                                                      "Enter your bank name",
                                                                  labelStyle: const TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontSize:
                                                                          25),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                  height: 15),
                                                              Row(
                                                                children: <
                                                                    Widget>[
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      children: <
                                                                          Widget>[
                                                                        Container(
                                                                          alignment:
                                                                              Alignment.centerLeft,
                                                                          child:
                                                                              Text(
                                                                            "Expiration Date",
                                                                            style: const TextStyle(
                                                                                color: Colors.black,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 18),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                            height:
                                                                                4),
                                                                        TextFormField(
                                                                          controller:
                                                                              discoverExpirationDateController,
                                                                          validator:
                                                                              (expirationDate) {
                                                                            if (!creditCardValidator.validateExpDate(expirationDate).isValid) {
                                                                              return "This expiration date is not valid";
                                                                            } else {
                                                                              return null;
                                                                            }
                                                                          },
                                                                          decoration:
                                                                              InputDecoration(
                                                                            border:
                                                                                InputBorder.none,
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                              borderSide: BorderSide(color: Colors.red),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                              borderSide: BorderSide(color: Colors.red),
                                                                            ),
                                                                            errorStyle:
                                                                                TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                                                            hintText:
                                                                                "MM/YY",
                                                                            labelStyle: const TextStyle(
                                                                                color: Colors.black,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 25),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                      width: 6),
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      children: <
                                                                          Widget>[
                                                                        Container(
                                                                          alignment:
                                                                              Alignment.centerLeft,
                                                                          child:
                                                                              Text(
                                                                            "CVV (4 digits)",
                                                                            style: const TextStyle(
                                                                                color: Colors.black,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 18),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                            height:
                                                                                4),
                                                                        TextFormField(
                                                                          controller:
                                                                              discoverCvvController,
                                                                          validator:
                                                                              (cvv) {
                                                                            if (!creditCardValidator.validateCVV(cvv, CreditCardType.discover).isValid) {
                                                                              return "This card number is not valid";
                                                                            } else {
                                                                              return null;
                                                                            }
                                                                          },
                                                                          decoration:
                                                                              InputDecoration(
                                                                            border:
                                                                                InputBorder.none,
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                              borderSide: BorderSide(color: Colors.red),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                              borderSide: BorderSide(color: Colors.red),
                                                                            ),
                                                                            errorStyle:
                                                                                TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                                                            hintText:
                                                                                "CVV",
                                                                            labelStyle: const TextStyle(
                                                                                color: Colors.black,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 25),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                      width: 6),
                                                                  Expanded(
                                                                    child:
                                                                        Column(
                                                                      children: <
                                                                          Widget>[
                                                                        Container(
                                                                          alignment:
                                                                              Alignment.centerLeft,
                                                                          child:
                                                                              Text(
                                                                            "Postal Code",
                                                                            style: const TextStyle(
                                                                                color: Colors.black,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 18),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                            height:
                                                                                4),
                                                                        TextFormField(
                                                                          controller:
                                                                              discoverPostalCodeController,
                                                                          validator:
                                                                              (postalCode) {
                                                                            if (postalCode!.isEmpty) {
                                                                              return 'Postal code is empty';
                                                                            } else {
                                                                              return null;
                                                                            }
                                                                          },
                                                                          decoration:
                                                                              InputDecoration(
                                                                            border:
                                                                                InputBorder.none,
                                                                            enabledBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                            focusedBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                            ),
                                                                            focusedErrorBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                              borderSide: BorderSide(color: Colors.red),
                                                                            ),
                                                                            errorBorder:
                                                                                OutlineInputBorder(
                                                                              borderRadius: BorderRadius.circular(8),
                                                                              borderSide: BorderSide(color: Colors.red),
                                                                            ),
                                                                            errorStyle:
                                                                                TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                                                                            hintText:
                                                                                "postal code",
                                                                            labelStyle: const TextStyle(
                                                                                color: Colors.black,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 25),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                  height: 15),
                                                              GestureDetector(
                                                                onTap: () {
                                                                  if (discoverCardFormKey
                                                                      .currentState!
                                                                      .validate()) {
                                                                    print(
                                                                        "Process Of Buying Through Discover Card");
                                                                    //TODO Adding Card Info To Provider
                                                                    paymentProvider.addCardInfoModel(CardInfoModel(
                                                                        cardNumber:
                                                                            discoverCardNumberController!
                                                                                .text,
                                                                        expirationDate:
                                                                            discoverExpirationDateController!
                                                                                .text,
                                                                        ccv: discoverCvvController!
                                                                            .text,
                                                                        cardHolderName:
                                                                            discoverCardHolderNameController!
                                                                                .text,
                                                                        postalCode:
                                                                            discoverPostalCodeController!
                                                                                .text,
                                                                        bankName:
                                                                            discoverBankNameController!
                                                                                .text,
                                                                        cardType:
                                                                            CardType.discover));
                                                                    //TODO Adding Review Model (Card Info Mode + Shipping Address Model) To Provider
                                                                    paymentProvider.addReviewModel(ReviewModel(
                                                                        shippingAddressModel:
                                                                            paymentProvider
                                                                                .shippingAddressModel,
                                                                        cardInfo:
                                                                            paymentProvider.cardInfoModel));
                                                                    _currentStep =
                                                                        2;
                                                                    pageController.animateToPage(
                                                                        _currentStep,
                                                                        duration: Duration(
                                                                            milliseconds:
                                                                                500),
                                                                        curve: Curves
                                                                            .linear);
                                                                  }
                                                                },
                                                                child: Container(
                                                                    height: 38,
                                                                    alignment: Alignment.center,
                                                                    width: MediaQuery.of(context).size.width,
                                                                    decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(10),
                                                                        color: Colors.red,
                                                                        gradient: LinearGradient(begin: Alignment.topLeft, end: Alignment.bottomRight, colors: <Color>[
                                                                          Color(
                                                                              0xffB1B1B1),
                                                                          Color(
                                                                              0xffFF6300),
                                                                        ])),
                                                                    child: Text("Proceed Now", style: const TextStyle(color: Colors.white, fontSize: 25))),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                              Divider(
                                                color: Colors.grey,
                                                thickness: 1,
                                              ),
                                              ExpansionTile(
                                                  trailing: SizedBox.shrink(),
                                                  title: SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: <Widget>[
                                                        Row(
                                                          children: <Widget>[
                                                            GestureDetector(
                                                              onTap: () {
                                                                if (isPayWithPaypalClicked) {
                                                                  isPayWithPaypalClicked =
                                                                      false;
                                                                } else {
                                                                  isPayWithPaypalClicked =
                                                                      true;
                                                                }
                                                                setState(() {});
                                                              },
                                                              child: Container(
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                width: 15,
                                                                height: 15,
                                                                decoration: BoxDecoration(
                                                                    shape: BoxShape
                                                                        .circle,
                                                                    color: Colors
                                                                        .white,
                                                                    border: Border.all(
                                                                        color: Colors
                                                                            .grey,
                                                                        width:
                                                                            2)),
                                                                child:
                                                                    isPayWithCreditCardTapped
                                                                        ? Icon(
                                                                            Icons.check,
                                                                            color:
                                                                                Colors.green[900],
                                                                            size:
                                                                                10,
                                                                          )
                                                                        : Icon(
                                                                            Icons
                                                                                .ac_unit,
                                                                            color:
                                                                                Colors.white,
                                                                            size: 10),
                                                              ),
                                                            ),
                                                            SizedBox(width: 10),
                                                            Text(
                                                              "Pay With Paypal",
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: 20),
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(width: 60),
                                                        Container(
                                                          height: 40,
                                                          width: 100,
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(3),
                                                          child: Image.asset(
                                                              "assets/images/payment/paypal.png",
                                                              fit: BoxFit.cover,
                                                              width: 100,
                                                              height: 100),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  children: <Widget>[
                                                    ExpansionTile(
                                                        trailing:
                                                            SizedBox.shrink(),
                                                        title: Text(
                                                            "Pay With Paypal"),
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(8.0),
                                                            child: Form(
                                                              key:
                                                                  paypalCardFormKey,
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Container(
                                                                    alignment:
                                                                        Alignment
                                                                            .centerLeft,
                                                                    child: Text(
                                                                      "Email",
                                                                      style: const TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              18),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                      height:
                                                                          4),
                                                                  TextFormField(
                                                                    controller:
                                                                        paypalEmailController,
                                                                    validator:
                                                                        (cardNumber) {
                                                                      if (paypalEmailController!
                                                                          .text
                                                                          .isEmpty) {
                                                                        return "Email is empty";
                                                                      } else {
                                                                        return null;
                                                                      }
                                                                    },
                                                                    decoration:
                                                                        InputDecoration(
                                                                      border: InputBorder
                                                                          .none,
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8),
                                                                        borderSide:
                                                                            BorderSide(color: Colors.red),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8),
                                                                        borderSide:
                                                                            BorderSide(color: Colors.red),
                                                                      ),
                                                                      errorStyle: TextStyle(
                                                                          color: Colors
                                                                              .red,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                      hintText:
                                                                          "Enter your card paypal email ",
                                                                      labelStyle: const TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              25),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    alignment:
                                                                        Alignment
                                                                            .centerLeft,
                                                                    child: Text(
                                                                      "Email Number",
                                                                      style: const TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              18),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                      height:
                                                                          4),
                                                                  TextFormField(
                                                                    controller:
                                                                        paypalPasswordController,
                                                                    validator:
                                                                        (cardNumber) {
                                                                      if (paypalPasswordController!
                                                                          .text
                                                                          .isEmpty) {
                                                                        return "password is empty";
                                                                      } else {
                                                                        return null;
                                                                      }
                                                                    },
                                                                    decoration:
                                                                        InputDecoration(
                                                                      border: InputBorder
                                                                          .none,
                                                                      enabledBorder:
                                                                          OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8),
                                                                      ),
                                                                      focusedBorder:
                                                                          OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8),
                                                                      ),
                                                                      focusedErrorBorder:
                                                                          OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8),
                                                                        borderSide:
                                                                            BorderSide(color: Colors.red),
                                                                      ),
                                                                      errorBorder:
                                                                          OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.circular(8),
                                                                        borderSide:
                                                                            BorderSide(color: Colors.red),
                                                                      ),
                                                                      errorStyle: TextStyle(
                                                                          color: Colors
                                                                              .red,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                      hintText:
                                                                          "Enter your paypal password account",
                                                                      labelStyle: const TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontWeight: FontWeight
                                                                              .bold,
                                                                          fontSize:
                                                                              25),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                      height:
                                                                          4),
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      //TODO Payment With Master Card
                                                                      if (paypalCardFormKey
                                                                          .currentState!
                                                                          .validate()) {
                                                                        print(
                                                                            "Process Of Buying Through Paypal Card");
                                                                        //TODO Card Holder Name With Each Field Supported With Text Form Field

                                                                        //TODO Adding Card Info To Provider
                                                                        // paymentProvider
                                                                        //     .addCardInfoModel(
                                                                        //     CardInfoModel(
                                                                        //         cardNumber:
                                                                        //         masterCardNumberController!
                                                                        //             .text,
                                                                        //         expirationDate:
                                                                        //         masterExpirationDateController!
                                                                        //             .text,
                                                                        //         ccv:
                                                                        //         masterCvvController!
                                                                        //             .text,
                                                                        //         cardHolderName:
                                                                        //         masterCardHolderNameController!
                                                                        //             .text,
                                                                        //         postalCode:
                                                                        //         masterPostalCodeController!
                                                                        //             .text,
                                                                        //         cardType: CardType
                                                                        //             .masterCard,
                                                                        //         bankName:
                                                                        //         masterBankNameController!
                                                                        //             .text));
                                                                        //TODO Adding Review Model (Card Info Mode + Shipping Address Model) To Provider
                                                                        // paymentProvider
                                                                        //     .addReviewModel(
                                                                        //     ReviewModel(
                                                                        //         shippingAddressModel:
                                                                        //         paymentProvider
                                                                        //             .shippingAddressModel,
                                                                        //         cardInfo:
                                                                        //         paymentProvider
                                                                        //             .cardInfoModel));
                                                                        // _currentStep =
                                                                        // 2;
                                                                        // setState(() {});
                                                                        // pageController
                                                                        //     .animateToPage(
                                                                        //     _currentStep,
                                                                        //     duration: Duration(
                                                                        //         milliseconds:
                                                                        //         500),
                                                                        //     curve: Curves
                                                                        //         .linear);
                                                                      }
                                                                    },
                                                                    child: Container(
                                                                        height: 38,
                                                                        alignment: Alignment.center,
                                                                        width: MediaQuery.of(context).size.width,
                                                                        decoration: BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(10),
                                                                          color:
                                                                              Colors.red,
                                                                          gradient: LinearGradient(
                                                                              begin: Alignment.centerLeft,
                                                                              end: Alignment.centerRight,
                                                                              colors: <Color>[
                                                                                Color(0xff273B80),
                                                                                Color(0xff232C65),
                                                                                Color(0xff139AD6)
                                                                              ]),
                                                                        ),
                                                                        child: Text("Proceed Now", style: const TextStyle(color: Colors.white, fontSize: 25))),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ]),
                                                  ]),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  );
                                } else if (_currentStep == 2) {
                                  return ListView(
                                    children: <Widget>[
                                      CreditCard(
                                        cardNumber: paymentProvider
                                            .cardInfoModel!.cardNumber,
                                        cardExpiry: paymentProvider
                                            .cardInfoModel!.expirationDate,
                                        cardHolderName: paymentProvider
                                            .cardInfoModel!.cardHolderName,
                                        bankName: paymentProvider
                                            .cardInfoModel!.bankName,
                                        cvv: paymentProvider.cardInfoModel!.ccv,
                                        // showBackSide: true,
                                        frontBackground: CardBackgrounds.black,
                                        backBackground: CardBackgrounds.white,
                                        cardType: paymentProvider
                                            .cardInfoModel!.cardType,
                                        showShadow: true,
                                      ),
                                      SizedBox(height: 30),
                                      Card(
                                        color: Color(0xffFF9900),
                                        shadowColor: Colors.black,
                                        elevation: 50,
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: SizedBox(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Card(
                                                  shadowColor: Colors.red,
                                                  elevation: 5,
                                                  color: Color(0xff0B0B0F),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      SizedBox(width: 10),

                                                      Expanded(
                                                          child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                  "Country : ",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          25,
                                                                      color: Colors
                                                                          .white)))),
                                                      // SizedBox(width:20),
                                                      Expanded(
                                                          child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                  paymentProvider
                                                                      .shippingAddressModel!
                                                                      .countryName,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          30,
                                                                      color: Colors
                                                                          .white)))),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: SizedBox(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Card(
                                                  shadowColor: Colors.red,
                                                  color: Color(0xff0B0B0F),
                                                  elevation: 5,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      SizedBox(width: 10),
                                                      Expanded(
                                                          child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                  "Full Name : ",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          25,
                                                                      color: Colors
                                                                          .white)))),
                                                      // SizedBox(width:20),
                                                      Expanded(
                                                          child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                paymentProvider
                                                                    .shippingAddressModel!
                                                                    .fullName,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        30,
                                                                    color: Colors
                                                                        .white),
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                              ))),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: SizedBox(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Card(
                                                  shadowColor: Colors.red,
                                                  color: Color(0xff0B0B0F),
                                                  elevation: 5,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      SizedBox(width: 10),
                                                      Expanded(
                                                          child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                  "Street Address : ",
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          25,
                                                                      color: Colors
                                                                          .white)))),
                                                      Expanded(
                                                        child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            child: Text(
                                                              paymentProvider
                                                                  .shippingAddressModel!
                                                                  .streetAddress,
                                                              style: TextStyle(
                                                                  fontSize: 30,
                                                                  color: Colors
                                                                      .white),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            )),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: SizedBox(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Card(
                                                  shadowColor: Colors.red,
                                                  color: Color(0xff0B0B0F),
                                                  elevation: 5,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      SizedBox(width: 10),
                                                      Expanded(
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                              "Apt/Suite/Other : ",
                                                              style: TextStyle(
                                                                  fontSize: 25,
                                                                  color: Colors
                                                                      .white),
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis),
                                                        ),
                                                      ),
                                                      Expanded(
                                                          child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                  paymentProvider
                                                                      .shippingAddressModel!
                                                                      .aptSuiteAddress,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          30,
                                                                      color: Colors
                                                                          .white),
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis))),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: SizedBox(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Card(
                                                  shadowColor: Colors.red,
                                                  elevation: 5,
                                                  color: Color(0xff0B0B0F),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      SizedBox(width: 10),
                                                      Expanded(
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                              "Zip Code : ",
                                                              style: TextStyle(
                                                                  fontSize: 25,
                                                                  color: Colors
                                                                      .white)),
                                                        ),
                                                      ),
                                                      Expanded(
                                                          child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                  paymentProvider
                                                                      .shippingAddressModel!
                                                                      .zipCode,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          30,
                                                                      color: Colors
                                                                          .white),
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis))),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: SizedBox(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Card(
                                                  shadowColor: Colors.red,
                                                  color: Color(0xff0B0B0F),
                                                  elevation: 5,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      SizedBox(width: 10),
                                                      Expanded(
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text("City : ",
                                                              style: TextStyle(
                                                                  fontSize: 25,
                                                                  color: Colors
                                                                      .white)),
                                                        ),
                                                      ),
                                                      Expanded(
                                                          child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                  paymentProvider
                                                                      .shippingAddressModel!
                                                                      .city,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          30,
                                                                      color: Colors
                                                                          .white)))),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: SizedBox(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                child: Card(
                                                  shadowColor: Colors.red,
                                                  color: Color(0xff0B0B0F),
                                                  elevation: 5,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      SizedBox(width: 10),
                                                      Expanded(
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          child: Text(
                                                              "State : ",
                                                              style: TextStyle(
                                                                  fontSize: 25,
                                                                  color: Colors
                                                                      .white)),
                                                        ),
                                                      ),
                                                      Expanded(
                                                          child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                  paymentProvider
                                                                      .shippingAddressModel!
                                                                      .state,
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          30,
                                                                      color: Colors
                                                                          .white),
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis))),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                } else {
                                  return Center(
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            margin:
                                                const EdgeInsets.only(top: 50),
                                            width: 130,
                                            height: 130,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: Color(0xff22BE79),
                                              borderRadius:
                                                  BorderRadius.circular(100),
                                            ),
                                            child: Icon(Icons.check,
                                                color: Colors.white, size: 70),
                                          ),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(top: 30),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Payment Successful",
                                                  style: const TextStyle(
                                                    fontSize: 40,
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(
                                                      0xff00C172,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 45,
                                                            right: 10),
                                                    alignment: Alignment.center,
                                                    child: Text(
                                                      "Your payment has been processed!Details of transaction are included below",
                                                      style: const TextStyle(
                                                          color: Color(
                                                            0xffBCBCBD,
                                                          ),
                                                          fontSize: 17),
                                                    )),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 40),
                                          Container(
                                              margin: const EdgeInsets.only(
                                                  left: 10, right: 10),
                                              child: Divider(
                                                color: Color(0xffEAEBEB),
                                                thickness: 3,
                                              )),
                                          SizedBox(height: 10),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                left: 10, right: 10),
                                            child: Column(
                                              children: <Widget>[
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Text(
                                                      "Total Amount Paid"
                                                          .toUpperCase(),
                                                      style: const TextStyle(
                                                          color:
                                                              Color(0xffA8A9AA),
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                        "\$${topperCartProductItemsChecked.totalPrice.toStringAsFixed(2)}",
                                                        style: const TextStyle(
                                                            fontSize: 24,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ],
                                                ),
                                                SizedBox(height: 10),
                                                Divider(
                                                  color: Color(0xffEAEBEB),
                                                  thickness: 3,
                                                ),
                                                SizedBox(height: 10),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Text(
                                                      "Payed By".toUpperCase(),
                                                      style: const TextStyle(
                                                          color:
                                                              Color(0xffA8A9AA),
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                        generatePaidBy(
                                                            paymentProvider
                                                                .cardInfoModel!
                                                                .cardType),
                                                        style: const TextStyle(
                                                            fontSize: 24,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ],
                                                ),
                                                SizedBox(height: 10),
                                                Divider(
                                                  color: Color(0xffEAEBEB),
                                                  thickness: 3,
                                                ),
                                                SizedBox(height: 10),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: <Widget>[
                                                    Text(
                                                      "Transaction Date"
                                                          .toUpperCase(),
                                                      style: const TextStyle(
                                                          color:
                                                              Color(0xffA8A9AA),
                                                          fontSize: 20,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                        DateFormat(
                                                                'yyyy-MM-dd – kk:mm')
                                                            .format(
                                                                DateTime.now()),
                                                        style: const TextStyle(
                                                            fontSize: 24,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ],
                                                ),
                                                SizedBox(height: 10),
                                                Divider(
                                                  color: Color(0xffEAEBEB),
                                                  thickness: 3,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
             
              }),
              floatingActionButton: Visibility(
                visible: _currentStep != 0 ? false : true,
                child: FloatingActionButton(
                  elevation: 10,
                  onPressed: () {
                    //Go To Next Page View Builder
                    if (_currentStep == 0 && formKey.currentState!.validate()) {
                      Provider.of<ReviewPaymentProvider>(context, listen: false)
                          .addShippingAddressModel(
                        ShippingAddressModel(
                            streetAddress: streetAddressController!.text,
                            countryName: countryController!.text,
                            fullName: fullNameController!.text,
                            aptSuiteAddress: aptSuiteController!.text,
                            zipCode: zipCodeController!.text,
                            city: cityController!.text,
                            state: stateController!.text),
                      );
                      _currentStep++;
                    } else if (_currentStep == 1 &&
                        (masterCardFormKey.currentState!.validate() ||
                            visaCardFormKey.currentState!.validate() ||
                            americanCardFormKey.currentState!.validate() ||
                            discoverCardFormKey.currentState!.validate())) {
                      //Successfully Shipped
                      _currentStep++;
                    }
                    Provider.of<CartProductItemsProductModelProvider>(context)
                        .cartItemsProductModel
                        .clear();
                    pageController.animateToPage(_currentStep,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.linear);
                  },
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.red,
                  ),
                ),
              ),
              bottomSheet: Visibility(
                visible: _currentStep == 2 ? true : false,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 60,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.all(0.5),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.center,
                              end: Alignment.centerRight,
                              colors: <Color>[
                                Color(0xff5F939A),
                                Color(0xffA0937D),
                              ]),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 1),
                          child: Column(
                            children: [
                              Container(
                                  alignment: Alignment.center,
                                  child: Text("Total Price:",
                                      style: const TextStyle(
                                          color: Color(0xffF2EDD7),
                                          fontStyle: FontStyle.italic,
                                          fontSize: 20))),
                              Text(
                                  "\$${topperCartProductItemsChecked.totalPrice.toStringAsFixed(2)}",
                                  style: const TextStyle(
                                      color: Color(0xffF2EDD7),
                                      fontStyle: FontStyle.italic,
                                      fontSize: 25)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: GestureDetector(
                        onTap: () async {
                         
                          //TODO Create Order API Endpoint

                          final data =
                              await CreateOrderNetworkHelper.createOrder(paymentProvider.reviewModel!,topperCartProductItemsChecked);
                          print("Wait Man Here is The Message");
                       
                          print("Wait Man Here is The Message");
                          _currentStep = 3;
                          List<ItemProductModel> remainedItems = [];
                          for (int index = 0;
                              index <
                                  topperCartProductItemsChecked
                                      .itemsToBuy.length;
                              index++) {
                            remainedItems.addAll(topperCartProductItemsChecked
                                .cartItemsProductModel
                                .where((cartItemProductModel) =>
                                    cartItemProductModel.productName !=
                                    topperCartProductItemsChecked
                                        .itemsToBuy[index]
                                        .itemProductModel
                                        .productName)
                                .toList());
                          }
                          topperCartProductItemsChecked.cartItemsProductModel
                              .clear();
                          topperCartProductItemsChecked
                              .addItemsProductsToCart(remainedItems);
                          indexBottomNavigationSaverProvider.setIndex(0);
                          pageController.animateToPage(_currentStep,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.linear);
                        },
                        child: Container(
                          height: 60,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: <Color>[
                                Color(0xffD83A56),
                                Color(0xff66DE93),
                              ],
                            ),
                          ),
                          width: MediaQuery.of(context).size.width,
                          child: Text("Buy Now",
                              style: const TextStyle(
                                  color: Color(0xffFFEAC9),
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      });
    });
  }
}

String generatePaidBy(CardType cardType) {
  switch (cardType) {
    case CardType.masterCard:
      return "Master Card";
    case CardType.visa:
      return "Visa";
    case CardType.discover:
      return "Discover";
    case CardType.americanExpress:
      return "American Express";
    default:
      return "Online Payment";
  }
}
