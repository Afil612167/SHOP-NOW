// import 'package:cached_network_image/cached_network_image.dart';
// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:firebase_demo/controller/modelClass/modelClassItemList.dart';
import 'package:firebase_demo/utilities/List/item_list.dart';
import 'package:firebase_demo/view/showExitPopUp.dart';
import 'package:firebase_demo/view/wishlIst_page.dart';
import 'package:firebase_demo/view/cart_page.dart';
import 'package:firebase_demo/widgets/homeScreenWidgets/HomePageCatGrid.dart';
import 'package:firebase_demo/widgets/homeScreenWidgets/itemGirdHome.dart';
import 'package:firebase_demo/widgets/nav_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controller/item_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ItemChange>().getItems();
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Product> products_list = [];
    final widths = MediaQuery.of(context).size.width;
    final heights = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Consumer<ItemChange>(builder: (context, itemProvider, child) {
        return WillPopScope(
          onWillPop: () => showExitPopup(context),
          child: Scaffold(
            drawer: NavDrawer(),
            resizeToAvoidBottomInset: false,
            backgroundColor: Color.fromARGB(255, 239, 238, 238),
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Color(0xff3578ac),
              title: Text(
                'SHOP NOW ',
                style: TextStyle(
                    color: Color(0xffdfffff), fontWeight: FontWeight.w900),
              ),
              centerTitle: true,
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: heights * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: widths * 0.05,
                    ),
                    Container(
                      height: heights * 0.06,
                      width: widths * 0.9,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 214, 208, 208),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: TextFormField(
                          onChanged: (value) {
                            try {
                              products_list.clear();
                              if (value.isEmpty) {
                                itemProvider.update(data: productList1);
                              } else {
// products_list.addAll(itemProvider.)

                                products_list.addAll(itemProvider
                                    .currentProductList
// itemProvider.currentProductList
                                    .where((element) => element.title
                                        .toLowerCase()
                                        .contains(value.toLowerCase()))
                                    .toList());
                                itemProvider.update(data: products_list);
                                print(products_list[0].title);
                              }
                            } catch (e) {
                              print('Exception is' + e.toString());
                            }
                            // _foodList.where((food) => food.name.toLowerCase().contains(userInputValue.toLowerCase()).toList();
                          },
                          textInputAction: TextInputAction.search,
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.all(8.0),
                              hintText: 'Search ',
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                ),
                              ),
                              suffixIcon: Icon(Icons.search),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
                catogoryGrid(heights: heights),
                itemGrid(heights: heights, widths: widths),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
                // backgroundColor: Colors.blue,
                onTap: (value) {
                  switch (value) {
                    case 0:
                      print('hlo');
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                      break;
                    case 1:
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FavouritePage()),
                      );
                      print('by');
                      break;
                    case 2:
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => CartPage()),
                      );
                      print('byby');
                      break;
                  }
                },
                showSelectedLabels: false,
                type: BottomNavigationBarType.fixed,
                showUnselectedLabels: false,
                selectedItemColor: Colors.grey,
                unselectedItemColor: Colors.grey,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.category), label: 'hlo'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite), label: 'hi'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_cart_checkout_sharp),
                      label: 'kh'),
                ]),
          ),
        );
      }),
    );
  }
}
