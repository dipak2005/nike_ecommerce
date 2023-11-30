import 'dart:io';



// import 'package:NikeMart/views/profile.dart';
// import 'package:NikeMart/views/util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nike_ecommerce/views/profile.dart';
import 'package:nike_ecommerce/views/util.dart';

import 'model.dart';

class Homepage extends StatefulWidget {
  Map<String, dynamic>? map = {};

  Homepage({Key? key, required this.map}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

Map<String, dynamic>? map;
bool ishome = false;
bool isfav = false;
bool isnoti = false;
bool isper = false;

int fcount = 0;
bool isshoes = true;
bool isout = false;
bool istennis = false;

class _HomepageState extends State<Homepage> {
  bool isclick = false;
  int page = 0;
  bool isshow = false;

  bool isgfav = false;
  bool islfav = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffDEE5F9),
      appBar: AppBar(
        title: Text(
          "Explore",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),
        ),
        actions: [
          InkWell(
            onTap: () {
              Navigator.pushNamed(context, "Cartpage");
            },
            child: Stack(
              children: [
                Image.asset(
                  "assets/s1.png",
                  height: 50,
                  width: 40,
                ),
                Positioned(
                  left: 0,
                  top: 9,
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
          IconButton(
            onPressed: () {
              isshow = !isshow;
              setState(() {});
            },
            icon: isshow
                ? Icon(
              Icons.grid_view,
              color: Colors.black,
            )
                : Icon(
              Icons.list_alt_outlined,
              color: Colors.black,
            ),
          ),
        ],
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Expanded(
                    child: ElevatedButton(
                        style: ButtonStyle(
                            elevation: MaterialStatePropertyAll(3),
                            fixedSize: MaterialStatePropertyAll(Size(
                                MediaQuery.sizeOf(context).width * 0.07,
                                MediaQuery.sizeOf(context).height * 0.06)),
                            shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(2)))),
                        onPressed: () {
                          Navigator.pushNamed(context, "Search");
                        },
                        child: Row(
                          children: [
                            Icon(
                              Icons.search,
                              color: Colors.black38,
                            ),
                            Text(
                              "Search....",
                              style: TextStyle(
                                  color: Colors.black38, fontSize: 18),
                            )
                          ],
                        ))),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () => Navigator.pushNamed(context, "Search"),
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(
                      "assets/sm1.png",
                    ),
                    backgroundColor: Colors.blueAccent,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
              ],
            ),
            Align(
              alignment: Alignment(-0.85, 0),
              child: Text(
                "Select Category",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                    fontSize: 20),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        isshoes = true;
                        isout = false;
                        istennis = false;
                        page = 0;
                      });
                    },
                    child: Container(
                      height: MediaQuery.sizeOf(context).height * 0.05,
                      width: MediaQuery.sizeOf(context).width * 0.3,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: isshoes ? Colors.blueAccent : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.white.withOpacity(0.2),
                              offset: Offset(0.9, 0.9),
                              blurRadius: 10),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          "All Shoes",
                          style: TextStyle(
                              color:
                              !isshoes ? Colors.blueAccent : Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        isout = true;
                        isshoes = false;
                        istennis = false;
                        page = 1;
                      });
                    },
                    child: Container(
                      height: MediaQuery.sizeOf(context).height * 0.05,
                      width: MediaQuery.sizeOf(context).width * 0.3,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: isout ? Colors.blueAccent : Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.white.withOpacity(0.2),
                              offset: Offset(0.9, 0.9),
                              blurRadius: 10),
                        ],
                      ),
                      child: Center(
                          child: Text(
                            "Outdoor",
                            style: TextStyle(
                                color: !isout ? Colors.blueAccent : Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          )),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        istennis = true;
                        isshoes = false;
                        isout = false;

                        page = 2;
                      });
                    },
                    child: Container(
                        height: MediaQuery.sizeOf(context).height * 0.05,
                        width: MediaQuery.sizeOf(context).width * 0.3,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: istennis ? Colors.blueAccent : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.white.withOpacity(0.2),
                                offset: Offset(0.9, 0.9),
                                blurRadius: 10),
                          ],
                        ),
                        child: Center(
                            child: Text(
                              "Tennis",
                              style: TextStyle(
                                  color:
                                  !istennis ? Colors.blueAccent : Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.w500),
                            ))),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Popular Shoes",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.4,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "Allproduct");
                  },
                  child: Text(
                    "See All",
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                ),
              ],
            ),
            IndexedStack(
              index: page,
              children: [
                isshow
                    ? SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.29,
                  child: ListView.builder(
                    itemCount: prolist.length,
                    itemBuilder: (BuildContext context, int index) {
                      Map<String, dynamic> pl = prolist[index];
                      Promodel pm = Promodel.frommap(pl);
                      return Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, "Sneakershop",
                                  arguments: pl);
                            },
                            child: Container(
                              height: MediaQuery.sizeOf(context).height *
                                  0.28,
                              width: MediaQuery.sizeOf(context).width,
                              clipBehavior: Clip.antiAlias,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.white,
                                      Colors.blueAccent
                                    ],
                                    begin: Alignment.centerLeft,
                                    end: Alignment.bottomCenter),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(0.9, 0.9),
                                      blurRadius: 10),
                                ],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: Image.asset(
                                      pm.image ?? "",
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Best Seller",
                                        style: TextStyle(
                                            color: Colors.white),
                                      ),
                                      Align(
                                        alignment: Alignment(-0.6, 0),
                                        child: Text(
                                          pm.name ?? "",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight:
                                              FontWeight.w300),
                                        ),
                                      ),
                                      Align(
                                          alignment: Alignment(-0.6, 0),
                                          child: Text(
                                            "\u20B9${pm.prize ?? 0}",
                                            style: TextStyle(
                                                color: Colors.white),
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: IconButton(
                                onPressed: () {
                                  cartlist.add(pl!);
                                  print(pl);
                                  setState(() {});
                                },
                                icon: Icon(
                                  Icons.add_box,
                                  color: Colors.white,
                                )),
                          ),
                          Positioned(
                            right: 0,
                            child: IconButton(
                              onPressed: () {
                                // islfav = !islfav;

                                setState(() {
                                  favlist.add(pl!);
                                });
                              },
                              icon: islfav
                                  ? Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                                  : Icon(Icons.favorite_border),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                )
                    : SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.24,
                  child: GridView.builder(
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    scrollDirection: Axis.vertical,
                    itemCount: prolist.length,
                    itemBuilder: (BuildContext context, int index) {
                      Map<String, dynamic> pl = prolist[index];
                      // print(pl.length);
                      // map = prolist[index];
                      Promodel pm = Promodel.frommap(pl);
                      return Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, "Sneakershop",
                                  arguments: pl);
                            },
                            child: Container(
                              height:
                              MediaQuery.sizeOf(context).height * 0.3,
                              width:
                              MediaQuery.sizeOf(context).width * 0.5,
                              clipBehavior: Clip.antiAlias,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.white,
                                      Colors.blueAccent
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(0.9, 0.9),
                                      blurRadius: 10),
                                ],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.sizeOf(context)
                                        .height *
                                        0.1,
                                    child: Image.asset(
                                      pm.image ?? "",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(
                                    "Best Seller",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Align(
                                    alignment: Alignment(-0.6, 0),
                                    child: Text(
                                      pm.name ?? "",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                  Align(
                                      alignment: Alignment(-0.6, 0),
                                      child: Text(
                                        "\u20B9 ${pm.prize ?? 0}",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300),
                                      )),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: Positioned(
                              bottom: 0,
                              right: 0,
                              child: IconButton(
                                onPressed: () {
                                  cartlist.add(pl??{});

                                  setState(() {});
                                },
                                icon: Icon(
                                  Icons.add_box,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              isgfav = true;
                              favlist.add(pl);
                              setState(() {});
                            },
                            icon: isgfav
                                ? Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                                : Icon(
                              Icons.favorite_border,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                isshow
                    ? SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.29,
                  child: ListView.builder(
                    itemCount: outlist.length,
                    itemBuilder: (BuildContext context, int index) {
                      Map<String, dynamic> ol = outlist[index];
                      Promodel pm = Promodel.frommap(ol);
                      return Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, "Sneakershop",
                                  arguments: ol);
                            },
                            child: Container(
                              height: MediaQuery.sizeOf(context).height *
                                  0.28,
                              width: MediaQuery.sizeOf(context).width,
                              clipBehavior: Clip.antiAlias,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(colors: [
                                  Colors.white,
                                  Colors.blueAccent
                                ], begin: Alignment.centerLeft),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(0.9, 0.9),
                                      blurRadius: 10),
                                ],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: Image.asset(pm.image ?? ""),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Best Seller",
                                        style: TextStyle(
                                            color: Colors.white),
                                      ),
                                      Align(
                                        alignment: Alignment(-0.6, 0),
                                        child: Text(
                                          pm.name ?? "",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight:
                                              FontWeight.w300),
                                        ),
                                      ),
                                      Align(
                                          alignment: Alignment(-0.6, 0),
                                          child: Text(
                                            "\u20B9 ${pm.prize ?? 0}",
                                            style: TextStyle(
                                                color: Colors.white),
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: IconButton(
                                onPressed: () {
                                  cartlist.add(ol!);

                                  setState(() {});
                                },
                                icon: Icon(
                                  Icons.add_box,
                                  color: Colors.white,
                                )),
                          ),
                          Positioned(
                            right: 0,
                            child: IconButton(
                              onPressed: () {
                                islfav = !islfav;
                                favlist.add(ol!);

                                setState(() {

                                });
                              },
                              icon: islfav
                                  ? Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                                  : Icon(Icons.favorite_border),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                )
                    : SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.24,
                  child: GridView.builder(
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    scrollDirection: Axis.vertical,
                    itemCount: outlist.length,
                    itemBuilder: (BuildContext context, int index) {
                      Map<String, dynamic> ol = outlist[index];
                      // print(ol.length);
                      // map = outlist[index];
                      Promodel pm = Promodel.frommap(ol);
                      return Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, "Sneakershop",
                                  arguments: ol);
                            },
                            child: Container(
                              height:
                              MediaQuery.sizeOf(context).height * 0.3,
                              width:
                              MediaQuery.sizeOf(context).width * 0.5,
                              clipBehavior: Clip.antiAlias,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.white,
                                      Colors.blueAccent
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(0.9, 0.9),
                                      blurRadius: 10),
                                ],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.sizeOf(context)
                                        .height *
                                        0.1,
                                    child: Image.asset(
                                      pm.image ?? "",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(
                                    "Best Seller",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Align(
                                    alignment: Alignment(-0.6, 0),
                                    child: Text(
                                      pm.name ?? "",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                  Align(
                                      alignment: Alignment(-0.6, 0),
                                      child: Text(
                                        "\u20B9 ${pm.prize ?? 0}",
                                        style: TextStyle(
                                            color: Colors.white),
                                      )),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: Positioned(
                              bottom: 0,
                              right: 0,
                              child: IconButton(
                                onPressed: () {
                                  cartlist.add(ol);

                                  setState(() {});
                                },
                                icon: Icon(
                                  Icons.add_box,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              isgfav = !isgfav;
                              favlist.add(ol);
                              setState(() {});
                            },
                            icon: isgfav
                                ? Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                                : Icon(
                              Icons.favorite_border,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                isshow
                    ? SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.29,
                  child: ListView.builder(
                    itemCount: tennieslist.length,
                    itemBuilder: (BuildContext context, int index) {
                      Map<String, dynamic> tl = tennieslist[index];

                      Promodel pm = Promodel.frommap(tl);
                      return Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, "Sneakershop",
                                  arguments: tl);
                            },
                            child: Container(
                              height: MediaQuery.sizeOf(context).height *
                                  0.28,
                              width: MediaQuery.sizeOf(context).width,
                              clipBehavior: Clip.antiAlias,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.white,
                                      Colors.blueAccent
                                    ],
                                    end: Alignment.centerRight,
                                    begin: Alignment.centerLeft),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(0.9, 0.9),
                                      blurRadius: 10),
                                ],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 5,
                                    child: Image.asset(pm.image ?? ""),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Best Seller",
                                        style: TextStyle(
                                            color: Colors.white),
                                      ),
                                      Align(
                                        alignment: Alignment(-0.6, 0),
                                        child: Text(
                                          pm.name ?? "",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight:
                                              FontWeight.w300),
                                        ),
                                      ),
                                      Align(
                                          alignment: Alignment(-0.6, 0),
                                          child: Text(
                                            "\u20B9 ${pm.prize ?? 0}",
                                            style: TextStyle(
                                                color: Colors.white),
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: IconButton(
                                onPressed: () {
                                  cartlist.add(tl!);

                                  setState(() {});
                                },
                                icon: Icon(
                                  Icons.add_box,
                                  color: Colors.white,
                                )),
                          ),
                          Positioned(
                            right: 0,
                            child: IconButton(
                              onPressed: () {
                                islfav = !islfav;
                                favlist.add(tl);

                                setState(() {});
                              },
                              icon: islfav
                                  ? Icon(
                                Icons.favorite,
                                color: Colors.red,
                              )
                                  : Icon(Icons.favorite_border),
                            ),
                          )
                        ],
                      );
                    },
                  ),
                )
                    : SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.24,
                  child: GridView.builder(
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                    scrollDirection: Axis.vertical,
                    itemCount: tennieslist.length,
                    itemBuilder: (BuildContext context, int index) {
                      Map<String, dynamic> tl = tennieslist[index];
                      Promodel pm = Promodel.frommap(tl);
                      return Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, "Sneakershop",
                                  arguments: tl);
                            },
                            child: Container(
                              height:
                              MediaQuery.sizeOf(context).height * 0.3,
                              width:
                              MediaQuery.sizeOf(context).width * 0.5,
                              clipBehavior: Clip.antiAlias,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [
                                      Colors.white,
                                      Colors.blueAccent
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.white,
                                      offset: Offset(0.9, 0.9),
                                      blurRadius: 10),
                                ],
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: MediaQuery.sizeOf(context)
                                        .height *
                                        0.1,
                                    child: Image.asset(
                                      pm.image ?? "",
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Text(
                                    "Best Seller",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Align(
                                    alignment: Alignment(-0.6, 0),
                                    child: Text(
                                      pm.name ?? "",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300),
                                    ),
                                  ),
                                  Align(
                                      alignment: Alignment(-0.6, 0),
                                      child: Text(
                                        "\u20B9 ${pm.prize ?? 0}",
                                        style: TextStyle(
                                            color: Colors.white),
                                      )),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: Positioned(
                              bottom: 0,
                              right: 0,
                              child: IconButton(
                                onPressed: () {
                                  cartlist.add(tl!);

                                  setState(() {});
                                },
                                icon: Icon(
                                  Icons.add_box,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              isgfav = !isgfav;
                              favlist.add(tl);
                              setState(() {});
                            },
                            icon: isgfav
                                ? Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                                : Icon(
                              Icons.favorite_border,
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "New Arrivals",
                    style: TextStyle(color: Colors.blueAccent),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "Allbanner");
                    },
                    child: Text(
                      "See All",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, "Allproduct");
              },
              child: Container(
                height: MediaQuery.sizeOf(context).height * 0.1,
                width: MediaQuery.sizeOf(context).width * 0.9,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  "assets/nb.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.11,
            ),
            BottomAppBar(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      ishome = !ishome;
                      setState(() {});
                    },
                    icon: ishome
                        ? Icon(
                      Icons.home_outlined,
                      color: Colors.blueAccent,
                    )
                        : Icon(Icons.home_outlined),
                  ),
                  Stack(
                    children: [
                      IconButton(
                        onPressed: () {
                          isfav = !isfav;
                          Navigator.pushNamed(context, "Favpage");

                          setState(() {});
                        },
                        icon: isfav
                            ? Icon(
                          Icons.favorite_border,
                          color: Colors.blueAccent,
                        )
                            : Icon(
                          Icons.favorite_border,
                        ),
                      ),
                      Positioned(
                        right: 4,
                        top: 5,
                        child: CircleAvatar(
                          backgroundColor: favlist.length == 0
                              ? Colors.transparent
                              : Colors.red,
                          radius: 8,
                          child: Text(
                            "${favlist.length}",
                            style: TextStyle(color: Colors.white, fontSize: 13),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.blueAccent,
                        child: IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "Cartpage");
                            },
                            icon: Icon(
                              Icons.shopping_bag_outlined,
                              color: Colors.white,
                            )),
                      )),
                  IconButton(
                    onPressed: () {
                      isnoti = isnoti;
                      setState(() {});
                      Navigator.pushNamed(context, "Notifications");
                    },
                    icon: isnoti
                        ? Icon(
                      Icons.notifications_none,
                      color: Colors.blueAccent,
                    )
                        : Icon(
                      Icons.notifications_none,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "Profiles");
                      isper = !isper;
                      setState(() {});
                    },
                    icon: isper
                        ? Icon(
                      Icons.perm_identity_rounded,
                      color: Colors.blueAccent,
                    )
                        : Icon(
                      Icons.perm_identity_rounded,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      drawer: NavigationDrawer(
        backgroundColor: Color(0xff1483C2),
        indicatorColor: Colors.white,
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.2,
            child: Align(
              alignment: Alignment(-0.8, 0),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage:
                filepath != null ? FileImage(File(filepath ?? "")) : null,
                radius: 70,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.8,
            child: Text(
              "      $uname$usurname",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.01,
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "Profiles");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).height * 0.03,
                  ),
                  Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.06,
                  ),
                  Text(
                    "Profile",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              )),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "Cartpage");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).height * 0.03,
                      ),
                      Icon(
                        Icons.shopping_cart,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.06,
                      ),
                      Text(
                        "My Cart",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  )),
              CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Text(
                    "${cartlist.length}",
                    style: TextStyle(color: Colors.blueAccent, fontSize: 20),
                  )),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.003,
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.01,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "Favpage");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).height * 0.03,
                      ),
                      Icon(
                        Icons.favorite_border,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.06,
                      ),
                      Text(
                        "Favorite",
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      )
                    ],
                  )),
              CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  "${favlist.length}",
                  style: TextStyle(color: Colors.blueAccent, fontSize: 20),
                ),
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.003,
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.01,
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "Orders");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).height * 0.03,
                  ),
                  Icon(
                    Icons.fire_truck_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.06,
                  ),
                  Text(
                    "Orders",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.17,
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Text(
                      "${cartlist.length}",
                      style: TextStyle(color: Colors.blueAccent, fontSize: 20),
                    ),
                  ),
                ],
              )),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.01,
          ),
          TextButton(
              onPressed: () {
                Navigator.pushNamed(context, "Notifications");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).height * 0.03,
                  ),
                  Icon(
                    Icons.notifications_none,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.06,
                  ),
                  Text(
                    "Notifications",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              )),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.01,
          ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, "Settings");
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.sizeOf(context).height * 0.03,
                ),
                Icon(
                  Icons.settings,
                  color: Colors.white,
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 0.06,
                ),
                Text(
                  "Settings",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          Text(
            "    ___________________________",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.01,
          ),
          TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(
                        "Sign Out",
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                      content: Text(
                        "Are You Sure Want To Sign Out??",
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            Navigator.pop(context);
                          },
                          child: Text(
                            "No",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        TextButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text("Rate this App"),
                                    content: Container(
                                      // height: MediaQuery.sizeOf(context).height*0.2,
                                      child: RatingBar.builder(
                                        initialRating: 0,
                                        itemCount: 5,
                                        itemBuilder: (context, index) {
                                          switch (index) {
                                            case 0:
                                              return Icon(
                                                Icons
                                                    .sentiment_very_dissatisfied,
                                                color: Colors.red,
                                              );
                                            case 1:
                                              return Icon(
                                                Icons.sentiment_dissatisfied,
                                                color: Colors.redAccent,
                                              );
                                            case 2:
                                              return Icon(
                                                Icons.sentiment_neutral,
                                                color: Colors.amber,
                                              );
                                            case 3:
                                              return Icon(
                                                Icons.sentiment_satisfied,
                                                color: Colors.lightGreen,
                                              );
                                            case 4:
                                              return Icon(
                                                Icons.sentiment_very_satisfied,
                                                color: Colors.green,
                                              );
                                          }
                                          return Container();
                                        },
                                        onRatingUpdate: (rating) {
                                          print(rating);
                                        },
                                      ),
                                    ),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            for (int i = 0; i < 7; i++) {
                                              Navigator.pop(context);
                                            }
                                          },
                                          child: Text(
                                            "Yes",
                                            style: TextStyle(fontSize: 20),
                                          ))
                                    ],
                                  );
                                },
                              );
                            },
                            child: Text(
                              "Yes",
                              style: TextStyle(fontSize: 20),
                            ))
                      ],
                    );
                  },
                );
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).height * 0.03,
                  ),
                  Icon(
                    Icons.output_outlined,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.06,
                  ),
                  Text(
                    "Sign Out",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
