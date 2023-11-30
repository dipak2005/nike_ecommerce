import 'package:flutter/material.dart';

class Nike1 extends StatefulWidget {
  const Nike1({super.key});

  @override
  State<Nike1> createState() => _Nike1State();
}

class _Nike1State extends State<Nike1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1483C2),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.2,
          ),
          Center(
            child: Text(
              "WELLCOME TO \n        NIKE",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  letterSpacing: 2),
            ),
          ),
          Stack(
            children: [
              Container(
                height: MediaQuery.sizeOf(context).height * 0.5,
                width: MediaQuery.sizeOf(context).width,
                child: Image.asset(
                  "assets/n.png",
                  color: Colors.white.withOpacity(0.2),
                  // height: MediaQuery.sizeOf(context).height * 0.5,
                  fit: BoxFit.cover,
                  scale: 0.3,
                ),
              ),
              Positioned(
                bottom: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.3,
                    ),
                    Container(
                      height: 5,
                      decoration: BoxDecoration(
                          color: Colors.white,
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
                          color: Colors.amber,
                          borderRadius: BorderRadius.circular(10)),
                      width: MediaQuery.sizeOf(context).width * 0.1,
                    )
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height*0.12,
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height*0.06,
            width: MediaQuery.sizeOf(context).width * 0.8,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(
                  Colors.white,
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, "Nike2");
              },
              child: Text(
                "GET STARTED",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
