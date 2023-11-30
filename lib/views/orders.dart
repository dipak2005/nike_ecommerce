import 'package:flutter/material.dart';
import 'package:nike_ecommerce/views/profile.dart';
import 'package:nike_ecommerce/views/util.dart';

import 'model.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
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
              height: MediaQuery.sizeOf(context).height * 0.5,
              width: MediaQuery.sizeOf(context).width,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "No Orders please Go and Buy now",
                      style:
                      TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "your Orderlist is Empty !",
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
                                    "\u20B9 ${pm.prize ?? 0}",
                                  ),
                                  Text("\u20B9 ${pm.delivery??0}"),
                                  Text("Best Seller",style: TextStyle(color: Colors.blue),),
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
                    Navigator.pushNamed(context, "Cartpage");
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
}
