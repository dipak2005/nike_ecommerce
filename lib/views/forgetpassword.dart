import 'package:flutter/material.dart';

class Forgetpassword extends StatefulWidget {
  const Forgetpassword({super.key});

  @override
  State<Forgetpassword> createState() => _ForgetpasswordState();
}

class _ForgetpasswordState extends State<Forgetpassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              "Forget Password",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 25),
            ),
          ),
          Text(
            "Enter your Email Account To Reset \n                   Your Password",
            style: TextStyle(color: Colors.grey),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 18.0, left: 14),
            child: TextFormField(
              validator: (value) {
                if (value?.isEmpty ?? true) {
                  return "Enter User EmailAddress";
                } else if (value?.contains("@") ?? true) {
                  return null;
                } else {
                  return "Enter Valied EmailAddress";
                }
              },
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                focusColor: Colors.white,
                hoverColor: Colors.white,
                filled: true,
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.black, width: 1)),
                hintText: "xxxxxxxxxx",
                suffixStyle: TextStyle(color: Colors.grey, letterSpacing: 1),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.06,
            width: MediaQuery.sizeOf(context).width * 0.9,
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.blueAccent)),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Icon(
                        Icons.email,
                        size: 40,
                        color: Colors.blueAccent,
                      ),
                      content: Container(
                        height: MediaQuery.sizeOf(context).height * 0.15,
                        width: MediaQuery.sizeOf(context).width * 0.6,
                        child: Column(
                          children: [
                            Text(
                              "Check Your Email ",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 17,
                                fontWeight: FontWeight.w700,
                                letterSpacing: 1,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              "We Have Send Password Recovery \n               Code in Your Email",
                              style: TextStyle(color: Colors.grey),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Text(
                "Reset Password",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
