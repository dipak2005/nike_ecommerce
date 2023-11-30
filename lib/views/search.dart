



// import 'package:NikeMart/views/util.dart';
import 'package:flutter/material.dart';
import 'package:nike_ecommerce/views/util.dart';

class Search extends StatefulWidget {
  Map<String, dynamic>? map = {};

  Search({Key? key, this.map}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

Map<String, dynamic>? fp;

class _SearchState extends State<Search> {
  TextEditingController searchcontroller = TextEditingController();
  int search = 4;
  List<Map<String, dynamic>> foundproduct = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    foundproduct = productlist;
  }

  void runfilter(String enterkey) {
    List<Map<String, dynamic>> result = [];
    if (enterkey.isEmpty) {
      result = productlist;
    } else {
      result = productlist
          .where((element) =>
          element["name"].toString().contains(enterkey.toString()))
          .toList();
    }
    setState(() {
      foundproduct = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Search",
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: Text(
              "Cancel",
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w700,
                  fontSize: 18),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SearchBar(
              hintText: "Please Search only A TO Z latter",
              leading: Icon(
                Icons.search,
                color: Colors.grey,
                size: 30,
              ),
              onChanged: (value) {
                runfilter(value);
              },
              trailing: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.mic,
                      color: Colors.grey,
                    ))
              ]),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.4,
            child: ListView.builder(
              itemCount: foundproduct.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> map = foundproduct[index];
                return Card(
                  key: ValueKey(map),
                  color: Colors.blue,
                  elevation: 4,
                  margin: EdgeInsets.all(10),
                  child: ListTile(
                    onTap: () {
                      Navigator.pushNamed(context, "Sneakershop",
                          arguments: map);
                    },
                    leading: Image.asset("${map["image"]}"),
                    title: Text(
                      "${map["name"]}",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 18),
                    ),
                    trailing: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, "Sneakershop",
                              arguments: fp);
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        )),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
