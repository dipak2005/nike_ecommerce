import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nike_ecommerce/views/util.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}
String? uname = "";
String? usurname = "";
String? filepath;
GlobalKey<FormState> gkey = GlobalKey<FormState>();

class _ProfileState extends State<Profile> {
  TextEditingController fname = TextEditingController();
  TextEditingController lname = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController mnumber = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fname.text = profile.fname ?? "";
    lname.text = profile.lname ?? "";
    location.text = profile.location ?? "";
    mnumber.text = profile.mnumber ?? "";
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              for (int i = 0; i < 2; i++) {
                Navigator.pop(context);
              }
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: Text("Profile"),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              bool isvalied = gkey.currentState?.validate() ?? true;
              if (isvalied) {
                gkey.currentState?.save();
                FocusScope.of(context).unfocus();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.blueAccent,
                    content: Center(child: Text("Saved Successfully")),
                  ),
                );
                profile.fname = fname.text;
                profile.lname = lname.text;
                profile.location = location.text;
                profile.mnumber = mnumber.text;
                print(profile.fname);
                gkey.currentState?.save();
              }
            },
            child: Text(
              "Done",
              style: TextStyle(
                  color: Colors.blueAccent,
                  fontSize: 18,
                  fontWeight: FontWeight.w800),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: gkey,
                child: Column(
                  children: [
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.02,
                    ),
                    Center(
                      child: Stack(
                        children: [
                          CircleAvatar(
                            radius: 80,
                            backgroundImage: filepath != null
                                ? FileImage(File(filepath ?? ""))
                                : null,
                          ),
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: IconButton(
                              onPressed: () {
                                pickimage(true);
                              },
                              icon: Icon(
                                Icons.camera_alt,
                                color: Colors.blueAccent,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.01,
                    ),
                    Text(
                      "$uname$usurname",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 20),
                    ),
                    TextButton(
                      onPressed: () {
                        pickimage(false);
                      },
                      child: Text(
                        "Change Profile Picture",
                        style: TextStyle(color: Colors.blueAccent),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.04,
                    ),
                    Align(
                      alignment: Alignment(-0.9, 0),
                      child: Text(
                        "First Name",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            uname = value;
                          });
                        },
                        controller: fname,
                        keyboardType: TextInputType.name,
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return "*Please Enter User Name";
                          } else {
                            return null;
                          }

                          FocusScope.of(context).unfocus();
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffF7F7F9),
                          focusColor: Colors.blueAccent,
                          label: Text("Enter User FirstName"),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                            BorderSide(color: Colors.blueAccent, width: 1),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.01,
                    ),
                    Align(
                      alignment: Alignment(-0.9, 0),
                      child: Text(
                        "Last Name",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            usurname = value;
                          });
                        },
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return "*Please Enter User LastName";
                          } else {
                            return null;
                          }

                          FocusScope.of(context).unfocus();
                        },
                        controller: lname,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffF7F7F9),
                          focusColor: Colors.blueAccent,
                          label: Text("Enter User LastName"),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                            BorderSide(color: Colors.blueAccent, width: 1),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.01,
                    ),
                    Align(
                      alignment: Alignment(-0.9, 0),
                      child: Text(
                        "Location",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      child: TextFormField(
                        validator: (value) {
                          if (value?.isEmpty ?? true) {
                            return "*Please Enter User Location";
                          } else {
                            return null;
                          }

                          FocusScope.of(context).unfocus();
                        },
                        controller: location,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffF7F7F9),
                          focusColor: Colors.blueAccent,
                          label: Text("Enter User Location"),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                            BorderSide(color: Colors.blueAccent, width: 1),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.01,
                    ),
                    Align(
                      alignment: Alignment(-0.9, 0),
                      child: Text(
                        "Mobile Number",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.9,
                      child: TextFormField(
                        controller: mnumber,
                        validator: (value) {
                          var val = int.tryParse(value!);
                          if (value?.isEmpty ?? true) {
                            return "* Enter User Mobile Number";
                          } else if (val == null) {
                            return "Invalied Mobile Number";
                          } else if ((value?.length) != 10) {
                            return "* Enter 10 Digits";
                          } else {
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Color(0xffF7F7F9),
                          focusColor: Colors.blueAccent,
                          label: Text("Enter User Mobile Number"),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide:
                            BorderSide(color: Colors.blueAccent, width: 1),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.01,
                    ),
                    TextButton(
                      onPressed: () {
                        profile.fname = fname.text;
                        profile.lname = lname.text;
                        profile.location = location.text;
                        profile.mnumber = mnumber.text;
                        uname = "";
                        usurname = "";
                        setState(() {
                          gkey.currentState?.reset();
                        });
                      },
                      child: Text(
                        "Reset",
                        style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 18,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  void pickimage(bool iscamera) async {
    XFile? file = await ImagePicker()
        .pickImage(source: iscamera ? ImageSource.camera : ImageSource.gallery);
    filepath = file?.path;
    setState(() {});
  }
}
