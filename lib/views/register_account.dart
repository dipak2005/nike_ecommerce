import 'package:flutter/material.dart';

class Registeraccount extends StatefulWidget {
  const Registeraccount({super.key});

  @override
  State<Registeraccount> createState() => _RegisteraccountState();
}

class _RegisteraccountState extends State<Registeraccount> {
  GlobalKey<FormState> gkey = GlobalKey<FormState>();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool issave = false;
  bool isshow = false;
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
      body: Form(
        key: gkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Text(
                  "Register Account!",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 25),
                ),
              ),
              Text(
                "Fill your details or Continue  with \n                   Social Media",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(
                height: 50,
              ),
              Align(
                alignment: Alignment(-0.9, 0),
                child: Text(
                  "Your Name",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w300),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 18.0, left: 14),
                child: TextFormField(
                  controller: name,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter User Name";
                    } else {
                      return null;
                    }
                  },
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    focusColor: Colors.white,
                    hoverColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black, width: 1)),
                    hintText: "xxxxxxxx",
                    suffixStyle:
                    TextStyle(color: Colors.grey, letterSpacing: 1),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment(-0.9, 0),
                child: Text(
                  "Email Address",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w300),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 18.0, left: 14),
                child: TextFormField(
                  controller: email,
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return "Enter User EmailAddress";
                    } else if (value?.contains("@gmail.com") ?? true) {
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
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.black, width: 1)),
                    hintText: "xyz@gmail.com",
                    suffixStyle:
                    TextStyle(color: Colors.grey, letterSpacing: 1),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Align(
                alignment: Alignment(-0.9, 0),
                child: Text(
                  "Password",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w300),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 18.0, left: 14),
                child: TextFormField(
                  controller: password,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: isshow,
                  validator: (value) {
                    var intval = int.tryParse(value!);
                    if (value?.isEmpty ?? true) {
                      return "Enter User Password";
                    } else if (intval == null) {
                      return "* Invalied Password";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    focusColor: Colors.white,
                    hoverColor: Colors.white,
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black, width: 1),
                    ),
                    hintText: "Password",
                    suffixIcon: IconButton(
                        onPressed: () {
                          isshow = !isshow;
                          setState(() {});
                        },
                        icon: isshow
                            ? Icon(Icons.visibility)
                            : Icon(Icons.visibility_off)),
                    suffixStyle:
                    TextStyle(color: Colors.grey, letterSpacing: 1),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0.9, 0),
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, "Forget_password");
                  },
                  child: Text(
                    "Forget Password",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 10,
                    ),
                  ),
                ),
              ),
              SizedBox(
                  height: MediaQuery.sizeOf(context).height * 0.06,
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  child: ElevatedButton(
                      onPressed: () {
                        bool issave = gkey.currentState?.validate() ?? true;
                        if (issave) {
                          gkey.currentState?.save();
                          FocusScope.of(context).unfocus();
                          Navigator.pushNamed(context, "Homepage");
                        }
                      },
                      child: Text("Sign up"))),
              SizedBox(
                height: 20,
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.06,
                width: MediaQuery.sizeOf(context).width * 0.9,
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.white)),
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/g.png",
                        height: 50,
                        width: 50,
                      ),
                      Text("Sign up with Google"),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.13,
              ),
              InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "Signin");
                },
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Already Have Account?",
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      TextSpan(
                          text: "Log in", style: TextStyle(color: Colors.black))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
