import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_demo/controller/item_provider.dart';
import 'package:firebase_demo/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  runApp(ChangeNotifierProvider(
    create: (context) => ItemChange(),
    child: MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen()),
  ));
}
