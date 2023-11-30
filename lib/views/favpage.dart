import 'package:flutter/material.dart';
import 'package:nike_ecommerce/views/util.dart';

import 'homepage.dart';

class Favpage extends StatefulWidget {
  const Favpage({super.key});

  @override
  State<Favpage> createState() => _FavpageState();
}

class _FavpageState extends State<Favpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Favourit"),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.favorite,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: favlist.length == 0
          ? Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.blueAccent,
                radius: 150,
                child: Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 150,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "No Favourites Yet !",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              "Like a Nike Product You See? Save\n Then Here TO your Favourites.",
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 29,),
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
                "Add your Favourite",
                style:
                TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      )
          : GridView(
        gridDelegate:
        SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        children: favlist.map(
              (map) {
            return Stack(
              children: [
                Container(
                  height: MediaQuery.sizeOf(context).height * 0.4,
                  width: MediaQuery.sizeOf(context).width * 0.5,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0.9, 0.8),
                          blurRadius: 10,
                        ),
                      ]),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        flex: 5,
                        child: Image.asset(
                          isshoes
                              ? "${map?["image" ?? ""]}"
                              : isout
                              ? "${map?["image" ?? ""]}"
                              : istennis
                              ? "${map?["image" ?? ""]}"
                              : "",
                          fit: BoxFit.cover,
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Column(
                          children: [
                            Text(
                              "BEST SELLER",
                              style: TextStyle(color: Colors.blueAccent),
                            ),
                            Text("${map?["name" ?? ""]}"),
                            Text("\u20B9 ${map?["prize" ?? ""]}"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                    bottom: 5,
                    right: 5,
                    child: IconButton(
                        onPressed: () {
                          favlist.remove(map);

                          setState(() {});
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.blueAccent,
                        ))),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ))
              ],
            );
          },
        ).toList(),
      ),
    );
  }
}
