import 'package:flutter/material.dart';
import 'package:nike_ecommerce/views/profile.dart';
import 'package:nike_ecommerce/views/util.dart';

import 'model.dart';

class Cartpage extends StatefulWidget {
  Map<String, dynamic>? map = {};

  Cartpage({Key? key, required this.map}) : super(key: key);

  @override
  State<Cartpage> createState() => _CartpageState();
}

class _CartpageState extends State<Cartpage> {
  int product = 0;
  num subtotal = 0;
  num totalcost = 0;
  num delivery = 0;

  @override
  void didChangeDependencies() {
    cartlist.forEach((element) {
      print(element["delivery"] ?? 0);
      var d = (element["delivery"] ?? 0);
      num del = num.parse("$d");
      num dp = del * (element["product"] ?? 1);
      delivery = delivery + dp;
    });

    subtotal = 0;
    cartlist.forEach((element) {
      var p = (element["prize"] ?? 0);
      num ep = num.parse("$p");
      num sbt = ep * (element["product"] ?? 1);

      subtotal = subtotal + sbt;
    });

    cartlist.forEach((element) {
      totalcost = 0;
      cartlist.forEach((element) {
        setState(() {
          totalcost = delivery + subtotal;
        });
      });
    });
    super.didChangeDependencies();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        title: Text(
          "My Cart",
          style: TextStyle(fontWeight: FontWeight.w500, color: Colors.black),
        ),
        centerTitle: true,
        actions: [
          Text(
            "$uname$usurname",
            style: TextStyle(
                color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            cartlist.length == 0
                ? Container(
                    height: MediaQuery.sizeOf(context).height * 0.7,
                    width: MediaQuery.sizeOf(context).width,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset(
                            "assets/cart.jpeg",
                            // height: 300,
                            // width: 300,
                          ),
                          Text(
                            "your Cart is Empty !",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 20),
                          ),
                          Text(
                            "Add Items to  It Now",
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                                fixedSize:
                                    MaterialStatePropertyAll(Size(250, 50)),
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                backgroundColor: MaterialStatePropertyAll(
                                    Colors.blueAccent)),
                            onPressed: () {
                              Navigator.pushNamed(context, "Allproduct");
                            },
                            child: Text(
                              "Shop Now",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                : Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.sizeOf(context).height * 0.8,
                        child: ListView.builder(
                          itemCount: cartlist.length,
                          itemBuilder: (context, index) {
                            Map<String, dynamic> map = cartlist[index];
                            print("product==> ${map["product"]}");
                            Promodel pm = Promodel.frommap(map);
                            return Dismissible(
                              key: Key(cartlist[index]["name"] ?? ""),
                              direction: DismissDirection.endToStart,
                              child: Container(
                                height:
                                    MediaQuery.sizeOf(context).height * 0.12,
                                width: MediaQuery.sizeOf(context).width * 0.95,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(color: Colors.red)),
                                margin: EdgeInsets.all(10),
                                child: Row(
                                  children: [
                                    Container(
                                      height: MediaQuery.sizeOf(context).height,
                                      width: MediaQuery.sizeOf(context).width *
                                          0.16,
                                      clipBehavior: Clip.antiAlias,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      margin: EdgeInsets.all(10),
                                      child: Image.asset("${pm.image ?? ""}"),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.09,
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Text("${pm.name ?? ""}"),
                                        Text(
                                          " ${pm.prize ?? 0}",
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.blue,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.05,
                                          width:
                                              MediaQuery.sizeOf(context).width *
                                                  0.36,
                                          child: Row(
                                            mainAxisSize: MainAxisSize.min,
                                            children: [
                                              TextButton(
                                                onPressed: () {
                                                  var product = this.product;

                                                  setState(() {
                                                    map["product"]++;
                                                  });
                                                },
                                                child: Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                ),
                                              ),
                                              Text(
                                                "${pm.product.toString()}",
                                                style: TextStyle(
                                                    fontSize: 11,
                                                    color: Colors.white),
                                              ),
                                              TextButton(
                                                  onPressed: () {
                                                    var product = this.product;

                                                    // map["product"]--;
                                                    setState(() {
                                                      map["product"] == 0
                                                          ? cartlist.remove(map)
                                                          : map["product"]--;
                                                    });
                                                    // print(map[index]);
                                                    // count--;
                                                    // setState(() {
                                                    //   count--;
                                                    //   product == 0
                                                    //       ? cartlist.remove(map)
                                                    //       : product--;
                                                    //   map["product"] = product - 1;
                                                    // });
                                                  },
                                                  child: Icon(
                                                    Icons.remove,
                                                    color: Colors.white,
                                                  ))
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              onDismissed: (direction) {
                                setState(() {
                                  cartlist.removeAt(index);
                                });
                              },
                              background: Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFFE6E6),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  children: [
                                    const Spacer(),
                                    Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                      size: 20,
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                            fixedSize: MaterialStatePropertyAll(Size(250, 50)),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))),
                            backgroundColor:
                                MaterialStatePropertyAll(Colors.blueAccent)),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.white,
                              // margin: EdgeInsets.all(10),

                              content: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: MediaQuery.sizeOf(context).height *
                                        0.29,
                                    width: MediaQuery.sizeOf(context).width,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "Subtotal:",
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                            Text(
                                              "\u20B9${subtotal}",
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Delivery:",
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                                Text(
                                                  "\u20B9${delivery}",
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "-------------------------------------------------",
                                          style: TextStyle(
                                              color: Colors.grey, fontSize: 20),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  "Totalcost:",
                                                  style: TextStyle(
                                                      color: Colors.black),
                                                ),
                                                Text(
                                                  "\u20B9${totalcost}",
                                                  style: TextStyle(
                                                      color: Colors.blueAccent),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.01,
                                        ),
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            fixedSize: MaterialStatePropertyAll(
                                                Size(
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.8,
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.05)),
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    Colors.blue),
                                            shape: MaterialStatePropertyAll(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.horizontal(
                                                  right: Radius.circular(10),
                                                  left: Radius.circular(10),
                                                ),
                                              ),
                                            ),
                                          ),
                                          onPressed: () {},
                                          child: Text(
                                            "Choose Payment Method",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.01,
                                        ),
                                        ElevatedButton(
                                          style: ButtonStyle(
                                            fixedSize: MaterialStatePropertyAll(
                                                Size(
                                                    MediaQuery.sizeOf(context)
                                                            .width *
                                                        0.8,
                                                    MediaQuery.sizeOf(context)
                                                            .height *
                                                        0.05)),
                                            backgroundColor:
                                                MaterialStatePropertyAll(
                                                    Colors.blue),
                                            shape: MaterialStatePropertyAll(
                                              RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.horizontal(
                                                  right: Radius.circular(10),
                                                  left: Radius.circular(10),
                                                ),
                                              ),
                                            ),
                                          ),
                                          onPressed: () {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  content: Container(
                                                    height: MediaQuery.sizeOf(
                                                                context)
                                                            .height *
                                                        0.55,
                                                    width: MediaQuery.sizeOf(
                                                                context)
                                                            .width *
                                                        0.8,
                                                    child: Column(
                                                      children: [
                                                        Image.asset(
                                                          "assets/s2.png",
                                                        ),
                                                        Text(
                                                          "Your Payment is \n         Success",
                                                          style: TextStyle(
                                                              fontSize: 20),
                                                        ),
                                                        SizedBox(
                                                          height:
                                                              MediaQuery.sizeOf(
                                                                          context)
                                                                      .height *
                                                                  0.05,
                                                        ),
                                                        ElevatedButton(
                                                            style: ButtonStyle(
                                                                backgroundColor:
                                                                    MaterialStatePropertyAll(
                                                                        Colors
                                                                            .blueAccent)),
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                            },
                                                            child: Text(
                                                              "Back To Shopping",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            )),
                                                        SizedBox(
                                                          height: 2,
                                                        ),
                                                        ElevatedButton(
                                                            style: ButtonStyle(
                                                                backgroundColor:
                                                                    MaterialStatePropertyAll(
                                                                        Colors
                                                                            .blueAccent)),
                                                            onPressed: () {
                                                              Navigator.pop(
                                                                  context);
                                                              Navigator
                                                                  .pushNamed(
                                                                      context,
                                                                      "Invoice");
                                                            },
                                                            child: Text(
                                                              "Download Invoice",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white),
                                                            ))
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                          child: Text(
                                            "Checkout",
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "Buy Now",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  void findtotal() {
    num prize = 0;
    cartlist.forEach((element) {
      var p = element["prize"];
      num ep = num.parse("$p");
      prize = prize + ep;
    });
  }
}
