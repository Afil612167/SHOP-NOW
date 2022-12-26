
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'image.dart';

class circularAvathar extends StatelessWidget {
  const circularAvathar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height=MediaQuery.of(context).size.height;
    return Align(
        alignment: Alignment.topCenter,
        child: SizedBox(
          height:height*0.1 ,
          child: CircleAvatar(
            radius: 70.0,
            backgroundColor: Colors.black,
            child: CircleAvatar(
              child: Images(),
              radius: 68.0,
              backgroundImage: NetworkImage(FirebaseAuth.instance.currentUser!.photoURL!),
            ),
          ),
        ));
  }
}