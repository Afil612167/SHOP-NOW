import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/controller/item_provider.dart';
import 'package:firebase_demo/utilities/firebase.dart';
import 'package:firebase_demo/view/SignInScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/circleAvathar.dart';

class UserInfoPage extends StatelessWidget {
  const UserInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final heght = MediaQuery.of(context).size.height;

    String? userImage = FirebaseAuth.instance.currentUser!.photoURL;

    return SafeArea(
      child: Consumer<ItemChange>(builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: Colors.black87,
          body: Column(
            children: [
              Container(
                width: double.infinity,
                height: 250,
              ),
              Stack(children: [
                Container(
                  margin: EdgeInsets.only(top: width * 0.05, left: 25),
                  width: width * 0.9,
                  height: heght * 0.43,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16.0),
                      border: Border.all(width: 1, color: Colors.black)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          width: width*0.7,
                          height: heght*0.065,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(width: 1, color: Colors.black)),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 15,
                            ),
                            const Text(
                              'Name',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            SizedBox(
                              child: Text(
                                FirebaseAuth.instance.currentUser!.displayName!,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: heght * 0.015,
                                    fontWeight: FontWeight.w200),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Container(
                          width: width*0.7,
                          height: heght*0.065,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border:
                                  Border.all(width: 1, color: Colors.black)),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 15,
                              ),
                              Text(
                                'email',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                                  Text(
                                    FirebaseAuth.instance.currentUser!.email!,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: heght * 0.015,
                                        fontWeight: FontWeight.w200),
                                  )
                            ],
                          )),
                    ],
                  ),
                ),
                circularAvathar(),
              ]),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SignInScreen()),
                    );
                    FirebaseDemo().signOut();
                  },
                  child: Text('Logout'))
            ],
          ),
        );
      }),
    );
  }
}


