import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/utilities/firebase.dart';
import 'package:firebase_demo/view/SignInScreen.dart';
import 'package:firebase_demo/widgets/circleAvathar.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../view/orders.dart';
import '../view/splash_screen.dart';

class NavDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    Color iconColor = Color(0xFF655952);
    List catogoriesIcon = [
      Icon(
        Icons.local_shipping,
        size: height * 0.04,
        color: iconColor,
      ),
      Icon(
        Icons.account_circle_outlined,
        size: height * 0.03,
        color: iconColor,
      ),
      Icon(
        Icons.settings,
        size: height * 0.03,
        color: iconColor,
      ),
      Icon(
        Icons.logout,
        size: height * 0.03,
        color: iconColor,
      ),
    ];
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            // height: height * 0.3,
            width: width * 0.4,
            color: Color(0xff317cac),
            child: DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: width * 0.27,
                    child: Column(
                      children: [
                        SizedBox(
                          height: height * 0.028,
                        ),
                        circularAvathar(),
                      ],
                    ),
                  ),
                  Align(
                      child: Padding(
                    padding: EdgeInsets.only(left: width * 0.02),
                    child: Text(
                      FirebaseAuth.instance.currentUser!.displayName!,
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Color(0xffdfffff)),
                    ),
                  ))
                ],
              ),
            ),
          ),
          ListTile(
            leading: catogoriesIcon[0],
            title: Text('Orders'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyOrders()),
              )
            },
          ),
          ListTile(
            leading: catogoriesIcon[2],
            title: Text('Settings'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: Icon(Icons.border_color),
            title: Text('Feedback'),
            onTap: () => {Navigator.of(context).pop()},
          ),
          ListTile(
            leading: catogoriesIcon[3],
            title: Text('Logout'),
            onTap: () async {
              var sharePref = await SharedPreferences.getInstance();
              sharePref.setBool(SplashScreenState.KEYLOGIN, false);
              FirebaseDemo().signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => SignInScreen()),
              );
            },
          ),
        ],
      ),
    );
  }
}
