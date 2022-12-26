
import 'package:firebase_demo/utilities/firebase.dart';
import 'package:firebase_demo/view/SignInScreen.dart';
import 'package:firebase_demo/view/orders.dart';
import 'package:firebase_demo/view/user_infor.dart';
import 'package:flutter/material.dart';

import 'HomePage.dart';

class ManageAccount extends StatelessWidget {
  const ManageAccount({super.key});

  @override
  Widget build(BuildContext context) {
    final widths = MediaQuery.of(context).size.width;
    final heights = MediaQuery.of(context).size.height;
    Color iconColor = Color(0xFF655952);
    List catogories = [
      'Your order',
      'My profile',
      'Account Settings',
      'Logout'
    ];
    List catogoriesIcon = [
      Icon(
        Icons.local_shipping,
        size: heights * 0.04,
        color: iconColor,
      ),
      Icon(
        Icons.account_circle_outlined,
        size: heights * 0.04,
        color: iconColor,
      ),
      Icon(
        Icons.settings,
        size: heights * 0.04,
        color: iconColor,
      ),
      Icon(
        Icons.logout,
        size: heights * 0.04,
        color: iconColor,
      ),
    ];
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'SHOP NOW',
            style: TextStyle(color: Colors.black),
          ),
          leading: InkWell(
            onTap: () {
              
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()),
                                  );
            },
            child: Icon(Icons.keyboard_arrow_left,color: Color(0xFF5c4f49),)),
          centerTitle: true,
        ),
        body: Padding(
          padding: EdgeInsets.only(left: widths * 0.05, top: widths * 0.05),
          child: SizedBox(
            height: heights * 0.9,
            width: widths * 0.9,
            child: ListView.separated(
              itemBuilder: (context, index) {
                return Row(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xffdd6d3b),
                          borderRadius: BorderRadius.circular(4)),
                      width: widths * 0.04,
                      height: heights * 0.1,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0xFFfff1ea),
                          borderRadius: BorderRadius.circular(4)),
                      width: widths * 0.85,
                      height: heights * 0.1,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              switch (index) {
                                case 0:
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyOrders()),
                                  );
                                  break;
                                case 1:
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UserInfoPage()),
                                  );
                                  break;
                                case 2:
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()),
                                  );
                                  break;
                                case 3:
                                  FirebaseDemo().signOut();
                                  
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => SignInScreen()),
                                  );
                                  break;
                                default:
                              }
                            },
                            child: SizedBox(
                                width: widths * 0.25,
                                child: catogoriesIcon[index]),
                          ),
                          SizedBox(
                            width: widths * 0.6,
                            child: Text(
                              catogories[index],
                              style: TextStyle(
                                color: Color(0xFF5c4f49),
                                fontSize: heights * 0.02,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                );
              },
              itemCount: 4,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: heights * 0.01,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
