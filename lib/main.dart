import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nike_ecommerce/views/allbanner.dart';
import 'package:nike_ecommerce/views/allproduct.dart';
import 'package:nike_ecommerce/views/cartpage.dart';
import 'package:nike_ecommerce/views/favpage.dart';
import 'package:nike_ecommerce/views/forgetpassword.dart';
import 'package:nike_ecommerce/views/homepage.dart';
import 'package:nike_ecommerce/views/invoice.dart';
import 'package:nike_ecommerce/views/nike1.dart';
import 'package:nike_ecommerce/views/nike2.dart';
import 'package:nike_ecommerce/views/nike3.dart';
import 'package:nike_ecommerce/views/notification.dart';
import 'package:nike_ecommerce/views/orders.dart';
import 'package:nike_ecommerce/views/profile.dart';
import 'package:nike_ecommerce/views/register_account.dart';
import 'package:nike_ecommerce/views/search.dart';
import 'package:nike_ecommerce/views/settings.dart';
import 'package:nike_ecommerce/views/signin.dart';
import 'package:nike_ecommerce/views/sneaker_shop.dart';
import 'package:nike_ecommerce/views/splashscreen.dart';

void main() {
  runApp(Myapp());
}

class Myapp extends StatefulWidget {
  const Myapp({super.key});

  @override
  State<Myapp> createState() => _MyappState();
}

class _MyappState extends State<Myapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      theme: ThemeData.light(useMaterial3: true),
      routes: {
        "/": (context) => Splashscreen(),
        "Nike1": (context) => Nike1(),
        "Nike2": (context) => Nike2(),
        "Nike3": (context) => Nike3(),
        "Signin": (context) => Signin(),
        "Ragister_Account": (context) => Registeraccount(),
        "Forget_password": (context) => Forgetpassword(),
        "Homepage": (context) => Homepage(map: {}),
        "Search":(context) => Search(),
        "Cartpage": (context) => Cartpage(
          map: {},
        ),
        "Profiles": (context) => Profile(),
        "Sneakershop": (context) => Sneakershop(map: {}),
        "Favpage": (context) => Favpage(),
        "Notifications": (context) => Notifications(),
        "Settings": (context) => Settings(),
        "Allproduct": (context) => Allproduct(),
        "Allbanner":(context) => Allbanner(),
        "Orders":(context) => Orders(),
        "Invoice":(context) => Invoice(),
      },
    );
  }
}
