import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isone = false;
  bool istwo = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 30,
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.02,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.notifications_none,
                color: Colors.grey,
                size: 39,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                " NOTIFICATIONS",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 18),
              ),
            ],
          ),
          Container(
            height: MediaQuery.sizeOf(context).height * 0.06,
            width: MediaQuery.sizeOf(context).width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "    Notifications",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.black38),
                ),
                Switch(
                  // activeTrackColor: Colors.black.withOpacity(0.8),
                  value: isone,
                  autofocus: true,
                  thumbColor: MaterialStatePropertyAll(Colors.white),
                  activeColor: Colors.blue.shade500,
                  inactiveThumbColor: Colors.white,
                  onChanged: (value) {
                    isone = value;
                    setState(() {});
                  },
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.sizeOf(context).height * 0.05,
            width: MediaQuery.sizeOf(context).width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "    App Notification ",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                      color: Colors.black38),
                ),
                Switch(
                  // activeTrackColor: Colors.black.withOpacity(0.8),
                  value: istwo,
                  autofocus: true,
                  thumbColor: MaterialStatePropertyAll(Colors.white),
                  activeColor: Colors.blue.shade500,
                  inactiveThumbColor: Colors.white,
                  onChanged: (value) {
                    istwo = value;
                    setState(() {});
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.02,
          ),
          Row(
            children: [
              SizedBox(
                width: 20,
              ),
              Icon(
                Icons.person_2_outlined,
                color: Colors.grey,
                size: 39,
              ),
              Text(
                "  Account",
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
            ],
          ),
          Container(
            height: MediaQuery.sizeOf(context).height * 0.04,
            width: MediaQuery.sizeOf(context).width,
            child: ListTile(
                leading: Text(
                  "Edit Profile",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.black38),
                ),
                trailing: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, "Profiles");
                    },
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                    ))),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: MediaQuery.sizeOf(context).height * 0.06,
            width: MediaQuery.sizeOf(context).width,
            child: ListTile(
              leading: Text(
                "Change Password",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black38),
              ),
              trailing: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, "Forget_password");
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          // SizedBox(height: 20,),
          Container(
            height: MediaQuery.sizeOf(context).height * 0.1,
            width: MediaQuery.sizeOf(context).width,
            child: ListTile(
              leading: Text(
                "Facebook",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black38),
              ),
              trailing: IconButton(
                onPressed: () {

                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.sizeOf(context).height * 0.04,
            width: MediaQuery.sizeOf(context).width,
            child: Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Icon(
                  Icons.more_outlined,
                  color: Colors.grey,
                  size: 39,
                ),
                Text(
                  "   More",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ),
          Container(
            height: MediaQuery.sizeOf(context).height * 0.07,
            width: MediaQuery.sizeOf(context).width,
            child: ListTile(
              leading: Text(
                "Language",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black38),
              ),
              trailing: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, "Forget_password");
                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Container(
            height: MediaQuery.sizeOf(context).height * 0.1,
            width: MediaQuery.sizeOf(context).width,
            child: ListTile(
              leading: Text(
                "Country",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.black38),
              ),
              trailing: IconButton(
                onPressed: () {

                },
                icon: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          ElevatedButton(
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
                                        for(int i=0;i<8;i++){
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
                        ),),
                    ],
                  );
                },
              );
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.output_outlined,
                  color: Colors.blueAccent,
                ),
                Text(
                  "Logout",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: 20),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
