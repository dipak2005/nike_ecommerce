import 'package:flutter/material.dart';

class Nike3 extends StatefulWidget {
  const Nike3({super.key});

  @override
  State<Nike3> createState() => _Nike3State();
}

class _Nike3State extends State<Nike3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1483C2),
      body: Column(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height * 0.72,
            width: MediaQuery.sizeOf(context).width,
            child: Stack(
              children: [
                Positioned(
                  bottom: 0,
                  child: Image.asset(
                    "assets/n.png",
                    color: Colors.white.withOpacity(0.3),
                    fit: BoxFit.cover,
                    height: 300,
                    scale: 1,
                    width: 420,
                  ),
                ),
                Positioned(
                  left: 70.5,
                  bottom: 100,
                  child: Text(
                    "    YOU HAVE THE \n          POWER TO ",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            "There are Many Beautiful and  attractive \n plants to your  Room  ",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 5,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10)),
                width: MediaQuery.sizeOf(context).width * 0.1,
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 5,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(10)),
                width: MediaQuery.sizeOf(context).width * 0.1,
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 5,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                width: MediaQuery.sizeOf(context).width * 0.1,
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height*0.11,
          ),
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.8,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, "Signin");
              },
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Text(
                  "NEXT",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
