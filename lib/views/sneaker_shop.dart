// import 'package:NikeMart/views/util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nike_ecommerce/views/util.dart';

import 'homepage.dart';
import 'model.dart';

class Sneakershop extends StatefulWidget {
  Map<String, dynamic>? map;

  Sneakershop({Key? key, required this.map}) : super(key: key);

  @override
  State<Sneakershop> createState() => _SneakershopState();
}

Map<String, dynamic>? cart;

class _SneakershopState extends State<Sneakershop> {
  bool isadd = false;
  String? bgimage;
  String? name;
  String? prize;
  RangeValues rangeValues = RangeValues(0.0, 0.0);
  bool isshow = false;
  double min = 1195;
  double max = 10000;
  double zoomin = 2;
  double zoomout = 1;
  bool iszoom = false;
  int index = 0;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Map<String, dynamic>? arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    widget.map?["image"] = arguments?["image"];
    widget.map?["name"] = arguments?["name"];
    widget.map?["prize"] = arguments?["prize"];
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: CircleAvatar(
          backgroundColor: Colors.white.withOpacity(0.3),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        title: Text(
          "SneakerShop",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, "Favpage");
              },
              icon: Stack(
                children: [
                  Icon(
                    Icons.favorite_border,
                    color: Colors.black,
                    size: 30,
                  ),
                  Positioned(
                    left: 15,
                    top: 2,
                    child: CircleAvatar(
                      backgroundColor:
                          favlist.length == 0 ? Colors.transparent : Colors.red,
                      radius: 8,
                      child: Text(
                        "${favlist.length}",
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    ),
                  ),
                ],
              )),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, "Cartpage");
            },
            icon: Stack(
              children: [
                Icon(
                  Icons.shopping_bag_outlined,
                  color: Colors.black,
                  size: 30,
                ),
                Positioned(
                  left: 15,
                  top: 2,
                  child: CircleAvatar(
                    backgroundColor:
                        cartlist.length == 0 ? Colors.transparent : Colors.red,
                    radius: 8,
                    child: Text(
                      "${cartlist.length}",
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Transform.scale(
                  scale: iszoom ? zoomin : zoomout,
                  child: Container(
                      height: MediaQuery.sizeOf(context).height * 0.3,
                      width: MediaQuery.sizeOf(context).width,
                      child: Image.asset(isshow
                          ? "${bgimage ?? ""}"
                          : "${widget.map?["image" ?? ""]}")),
                ),
                Positioned(
                  right: 0,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        onPressed: () {
                          iszoom = !iszoom;
                          setState(() {});
                        },
                        icon: iszoom
                            ? Icon(
                                (Icons.zoom_out),
                                color: Colors.black,
                                size: 30,
                              )
                            : Icon(Icons.zoom_in),
                        color: Colors.black,
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text(
                                  "Prize Filter",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700),
                                ),
                                content: Row(
                                  children: [
                                    // Text("${rangeValues.start}"),
                                    // RangeSlider(
                                    //   values: rangeValues,
                                    //   min: min,
                                    //   max: max,
                                    //   onChanged: (value) {
                                    //     rangeValues=value;
                                    //   },
                                    // ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        icon: Icon(
                          Icons.filter_alt,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 20,
                  child: Text(
                    isshow ? "${name ?? ""}" : "${widget.map?["name" ?? ""]}",
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 24),
                  ),
                ),
                Positioned(
                  top: 30,
                  left: 20,
                  child: Text(
                    isshow ? "${prize ?? ""}" : "${widget.map?["prize" ?? ""]}",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.sizeOf(context).height * 0.1,
              width: MediaQuery.sizeOf(context).width,
              margin: EdgeInsets.all(20),
              child: ListView.builder(
                itemCount: isshoes
                    ? prolist.length
                    : isout
                        ? outlist.length
                        : istennis
                            ? tennieslist.length
                            : null,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  Map<String, dynamic> map = isshoes
                      ? prolist[index]
                      : isout
                          ? outlist[index]
                          : tennieslist[index];
                  Promodel pm = Promodel.frommap(map);
                  return InkWell(
                    onTap: () {
                      setState(() {
                        cart = map;
                        isshow = true;
                        bgimage = isshow
                            ? pm.image
                            : isout
                                ? pm.image
                                : istennis
                                    ? pm.image
                                    : null;
                        name = isshow
                            ? pm.name
                            : isout
                                ? pm.name
                                : istennis
                                    ? pm.name
                                    : null;

                        prize = isshow
                            ? pm.prize
                            : isout
                                ? pm.prize
                                : istennis
                                    ? pm.prize
                                    : null;
                      });
                    },
                    child: Container(
                        height: MediaQuery.sizeOf(context).height * 0.1,
                        width: MediaQuery.sizeOf(context).width * 0.2,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Colors.white,
                              offset: Offset(0.9, 0.9),
                              blurRadius: 10)
                        ], borderRadius: BorderRadius.circular(10)),
                        clipBehavior: Clip.antiAlias,
                        margin: EdgeInsets.all(10),
                        child: Image.asset(isshoes
                            ? pm.image ?? ""
                            : isout
                                ? pm.image ?? ""
                                : istennis
                                    ? pm.image ?? ""
                                    : "")),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RatingBarIndicator(
                    itemCount: 5,
                    itemSize: 50.0,
                    direction: Axis.horizontal,
                    rating: double.parse("${cart?["rating"] ?? 0}"),
                    itemBuilder: (context, index) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        )),
                IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text(
                              "Rate Product:",
                              style: TextStyle(color: Colors.black),
                            ),
                            content: TextField(
                              decoration: InputDecoration(
                                hintText: "Write here",
                                focusColor: Colors.blueAccent,
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blueAccent),
                                ),
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          backgroundColor: Colors.white,
                                          content: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              Text(
                                                "Rated successfull",
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              Icon(
                                                Icons.done,
                                                color: Colors.red,
                                                size: 30,
                                              )
                                            ],
                                          )));
                                },
                                child: Text(
                                  "Send",
                                  style: TextStyle(color: Colors.blueAccent),
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: Icon(
                      Icons.rate_review_outlined,
                      color: Colors.black,
                    ))
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text("Available Offers",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 20)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: "Bank Offer",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.w700,
                          fontSize: 15),
                    ),
                    TextSpan(
                        text:
                            " 10% off on Axis Bank Credit Card EMI Transactions, up to ₹1,500 on orders of ₹5,000 and aboveT&C",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w700)),
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text("Read More"),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black12,
                  child: IconButton(
                      onPressed: () {
                        isshoes
                            ? favlist.add(cart ?? {})
                            : isout
                                ? favlist.add(cart ?? {})
                                : istennis
                                    ? favlist.add(cart ?? {})
                                    : favlist.add(cart ?? {});
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Center(
                              child: Text("Added Successfully",
                                  style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700,
                                      backgroundColor: Colors.green)),
                            ),
                            backgroundColor: Colors.white70,
                            elevation: 3,
                          ),
                        );
                        setState(() {});
                      },
                      icon: Icon(Icons.favorite_border)),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.blueAccent)),
                  onPressed: () {
                    isshoes
                        ? cartlist.add(cart ?? {})
                        : isout
                            ? cartlist.add(cart ?? {})
                            : istennis
                                ? cartlist.add(cart ?? {})
                                : cartlist.add(cart ?? {});
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Center(
                          child: Text("Added Successfully",
                              style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                  backgroundColor: Colors.green)),
                        ),
                        duration: Duration(seconds: 1),
                        backgroundColor: Colors.white70,
                        elevation: 3,
                      ),
                    );
                    setState(() {});
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.white,
                      ),
                      Text(
                        "     Add To Cart",
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
