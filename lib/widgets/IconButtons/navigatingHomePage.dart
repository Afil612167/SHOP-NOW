
import 'package:flutter/material.dart';

import '../../view/HomePage.dart';

class homePageNavigation extends StatelessWidget {
  const homePageNavigation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: ((context) => HomeScreen())));
        },
        icon: Icon(Icons.arrow_back));
  }
}
