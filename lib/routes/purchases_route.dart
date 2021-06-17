import 'package:flutter/material.dart';

class UserPurchasesRoute extends StatefulWidget {
  final String? appBarTitle;
  UserPurchasesRoute({this.appBarTitle});

  @override
  _UserPurchasesRouteState createState() => _UserPurchasesRouteState();
}

class _UserPurchasesRouteState extends State<UserPurchasesRoute> {
  int _currentStep = 0;
  TextEditingController? countryController;
  TextEditingController? fullNameController;
  TextEditingController? streetAddressController;
  TextEditingController? aptSuiteController;
  TextEditingController? zipCodeontroller;
  TextEditingController? citycontroller;
  TextEditingController? statecontroller;
  final formKey=GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    countryController = TextEditingController();
    fullNameController = TextEditingController();
    streetAddressController = TextEditingController();
    aptSuiteController = TextEditingController();
    zipCodeontroller = TextEditingController();
    citycontroller = TextEditingController();
    statecontroller = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    countryController!.dispose();
    fullNameController!.dispose();
    streetAddressController!.dispose();
    aptSuiteController!.dispose();
    zipCodeontroller!.dispose();
    citycontroller!.dispose();
    statecontroller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      body: Form(
        key: formKey,
        child: new Stepper(
          type: StepperType.horizontal,
          currentStep: _currentStep,
          onStepTapped: (int step) => setState(() => _currentStep = step),
          onStepContinue:
              _currentStep < 2 ? () => setState(() {
if(formKey.currentState!.validate()){
  _currentStep += 1;
}

              }) : null,
          onStepCancel:
              _currentStep > 0 ? () => setState(() => _currentStep -= 1) : null,
          steps: <Step>[
            new Step(
              title: new Text('Shipping'),
              content: Container(
                height: 500,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: <BoxShadow>[
                      BoxShadow(color: Colors.white, blurRadius: 3),
                    ]),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Enter Your Shipping Address",
                        style: const TextStyle(
                            color: Color(0xff212121),
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Country",
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          TextFormField(
                            validator: (countryName){
                              if(countryName!.isEmpty){
                                return "Country Name Is Empty";
                              }else{
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.red),

                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.red),

                              ),
                              errorStyle: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),
                              hintText: "Enter your country name",
                              labelStyle: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
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
                            validator: (fullName){
                              if(fullName!.isEmpty){
                                return "Name is empty";
                              }else{
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.red),

                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.red),
                              ),
                              errorStyle: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),
                              hintText: "Enter your full name",
                              labelStyle: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
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
                            validator: (streetAddress){
                              if(streetAddress!.isEmpty){
                                return "Street address is empty";
                              }else{
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.red),

                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.red),

                              ),
                              errorStyle: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),
                              hintText: "Enter your street address",
                              labelStyle: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
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
                            validator: (aptSuiteController){
                              if(aptSuiteController!.isEmpty){
                                return "Apt/Suit/Other is empty";
                              }else{
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.red),

                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.red),

                              ),
                              errorStyle: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              hintText: "Enter your apt / suite / other ",
                              labelStyle: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
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
                            validator: (zipCode){
                              if(zipCode!.isEmpty){
                                return "Zip Code is empty";
                              }else{
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),

                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.red),

                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.red),

                              ),
                              errorStyle: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),
                              hintText: "Enter your zip code",
                              labelStyle: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
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
                            validator:(city){
                              if(city!.isEmpty){
                                return "City is empty";
                              }else{
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.red),

                            ),
                            errorBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(color: Colors.red),

                            ),
                            errorStyle: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),
                              hintText: "Enter your city name",
                              labelStyle: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
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
                            validator: (state){
                              if(state!.isEmpty){
                                return "State is empty";
                              }else{
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.red),

                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                borderSide: BorderSide(color: Colors.red),

                              ),
                              errorStyle: TextStyle(color: Colors.red,fontWeight: FontWeight.bold),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              hintText: "Enter your state name",
                              labelStyle: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              isActive: _currentStep >= 0,
              state: _currentStep >= 0 ? StepState.complete : StepState.disabled,
            ),
            new Step(
              title: new Text('Payment'),
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Choose Payment Method",
                    style: const TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                      "You will not be charged until you review this on the next page"),
                  SizedBox(height: 30),
                  Divider(
                    color: Colors.grey,
                    thickness: 1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                    Row(
                      children: <Widget>[],
                    ),
                    Row(
                      children: <Widget>[],
                    ),
                  ]),
                ],
              ),
              isActive: _currentStep >= 0,
              state: _currentStep >= 1 ? StepState.complete : StepState.disabled,
            ),
            new Step(
              title: new Text('Order'),
              content: new Text('This is the third step.'),
              isActive: _currentStep >= 0,
              state: _currentStep >= 2 ? StepState.complete : StepState.disabled,
            ),
          ],
        ),
      ),
    );
  }
}
