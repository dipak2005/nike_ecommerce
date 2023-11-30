import 'package:flutter/material.dart';
import 'package:nike_ecommerce/views/util.dart';

import 'model.dart';

class Allproduct extends StatefulWidget {
  const Allproduct({super.key});

  @override
  State<Allproduct> createState() => _AllproductState();
}

class _AllproductState extends State<Allproduct> {
  bool isshow = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Nike Product",
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        actions: [
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
            ),
          ),
          isshow
              ? IconButton(
              onPressed: () {
                isshow = !isshow;
                setState(() {});
              },
              icon: Icon(
                Icons.grid_view,
                color: Colors.black,
              ))
              : IconButton(
            onPressed: () {
              isshow = !isshow;
              setState(() {});
            },
            icon: Icon(
              Icons.list_alt_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: isshow
          ? ListView.builder(
        itemCount: productlist.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> map = productlist[index];
          Promodel pm = Promodel.frommap(map);
          return InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      actions: [
                        IconButton(
                          onPressed: () {

                            setState(() {favlist.add(map);});
                          },
                          icon: Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ),
                        ),
                        IconButton(
                          onPressed: () {

                            setState(() {
                              cartlist.add(map);
                            });
                          },
                          icon: Icon(
                            Icons.shopping_bag,
                            color: Colors.blue,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "Sneakershop",
                                  arguments: map);
                            },
                            icon: Icon(
                              Icons.fullscreen,
                              color: Colors.blue,
                            ))
                      ],
                      title: Text(
                        "Product Details",
                        style:
                        TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      content: Container(
                        height: MediaQuery.sizeOf(context).height * 0.1,
                        width: MediaQuery.sizeOf(context).width * 0.7,
                        child: Column(
                          children: [
                            Text(
                              "Best Seller",
                              style: TextStyle(
                                  color: Colors.blue, fontSize: 18),
                            ),
                            Text(
                              pm.name ?? "",
                              style: TextStyle(
                                  color: Colors.blue, fontSize: 18),
                            ),
                            Text(
                              "\u20B9${pm.prize}",
                              style: TextStyle(
                                  color: Colors.blue, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            },
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.25,
              width: MediaQuery.sizeOf(context).width * 0.3,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.lightBlueAccent],
                ),
              ),
              child: Column(
                children: [
                  Image.asset(
                    pm.image ?? "",
                    height: MediaQuery.sizeOf(context).height * 0.2,
                  )
                ],
              ),
            ),
          );
        },
      )
          : GridView.builder(
        physics: BouncingScrollPhysics(
            decelerationRate: ScrollDecelerationRate.fast),
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: productlist.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> map = productlist[index];
          Promodel pm = Promodel.frommap(map);
          return InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    actions: [
                      IconButton(
                        onPressed: () {
                          favlist.add(map);
                          setState(() {});
                        },
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          cartlist.add(map);
                        },
                        icon: Icon(
                          Icons.shopping_bag,
                          color: Colors.blue,
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "Sneakershop",
                                arguments: map);
                          },
                          icon: Icon(
                            Icons.fullscreen,
                            color: Colors.blue,
                          ))
                    ],
                    title: Text(
                      "Product Details",
                      style: TextStyle(color: Colors.black, fontSize: 18),
                    ),
                    content: Container(
                      height: MediaQuery.sizeOf(context).height * 0.1,
                      width: MediaQuery.sizeOf(context).width * 0.7,
                      child: Column(
                        children: [
                          Text(
                            "Best Seller",
                            style: TextStyle(
                                color: Colors.blue, fontSize: 18),
                          ),
                          Text(
                            pm.name ?? "",
                            style: TextStyle(
                                color: Colors.blue, fontSize: 18),
                          ),
                          Text(
                            "\u20B9${pm.prize}",
                            style: TextStyle(
                                color: Colors.blue, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: Container(
              height: MediaQuery.sizeOf(context).height * 0.5,
              width: MediaQuery.sizeOf(context).width * 0.3,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [Colors.blueAccent, Colors.lightBlueAccent],
                ),
              ),
              child: Column(
                children: [
                  Image.asset(
                    pm.image ?? "",
                    height: MediaQuery.sizeOf(context).height * 0.2,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
