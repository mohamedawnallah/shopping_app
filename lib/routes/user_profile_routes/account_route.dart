import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/config/constants.dart';
import 'package:shop_app/routes/user_profile_routes/paymentDetails.dart';
import 'package:shop_app/routes/user_profile_routes/trackOrder.dart';

import 'about.dart';

class Account extends StatefulWidget {
  const Account();
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  late final themeBloc;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            overflow: Overflow.visible,
            alignment: Alignment.center,
            children: [
              Container(
                height: 250.0,
                child: Image(
                  image: NetworkImage(
                      "https://images.unsplash.com/photo-1606787366850-de6330128bfc?ixid=MnwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80"),
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: -60.0,
                child: Container(
                  height: 125.0,
                  width: 125.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100.0),
                    border: Border.all(
                      color: Colors.white,
                      width: 4.0,
                    ),
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=668&q=80"),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
              Positioned(
                bottom: -88.0,
                child: Text(
                  'Mohamed Awnallah',
                  style: kDarkTextStyle,
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(top: 88.0),
              itemCount: labels.length,
              itemBuilder: (context, index) {
                return ListTile(
                    // dense: true,
                    leading: Icon(
                      icons[index],
                      color: kPrimaryColor,
                    ),
                    title: Text(labels[index]),
                    onTap: () => Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          switch (labels[index]) {
                            case 'Payments':
                              return PaymentDetails();

                            case 'Order History':
                              return TrackOrder();

                            case 'About Application':
                              return About();

                            default:
                              return Text("Nothing Found");
                          }
                        })));
              },
            ),
          ),
        ],
      ),
    );
  }
}

List<IconData> icons = [
  Icons.payment,
  Icons.list_alt,
  Icons.info,
];

List<String> labels = [
  "Payments",
  "Order History",
  "About Application",
];
