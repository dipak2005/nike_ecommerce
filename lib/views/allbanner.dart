import 'package:flutter/material.dart';

class Allbanner extends StatefulWidget {
  const Allbanner({super.key});

  @override
  State<Allbanner> createState() => _AllbannerState();
}

class _AllbannerState extends State<Allbanner> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "New Arrivals",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Nike Banner is not available!",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 17),
              ),
              Icon(Icons.no_backpack),
              SizedBox(
                height: 10,
              ),
              Text(
                "Shop now !!! ",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 17),
              ),
              Text(
                "Have a Good Day",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
