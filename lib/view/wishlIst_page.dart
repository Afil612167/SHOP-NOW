import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_demo/controller/item_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/IconButtons/navigatingHomePage.dart';
import 'HomePage.dart';
import 'cart_page.dart';
import 'manageAccount.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final widths = MediaQuery.of(context).size.width;
    final heights = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Consumer<ItemChange>(builder: (context, wishListProvider, child) {
        return Scaffold(
          backgroundColor: Colors.blue,
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 89, 0, 255),
            leading: homePageNavigation(),
            title: Text(
              'Wishlist',
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w900,
                  fontStyle: FontStyle.italic),
            ),
            centerTitle: true,
          ),
          body: Container(
            height: heights * 1,
            width: widths * 1,
            color: Colors.white,
            child: ListView.builder(
              itemCount: wishListProvider.wishList.length + 1,
              itemBuilder: (context, index) {
                if (wishListProvider.wishList.isEmpty) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Empty',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w900),
                          ),
                          Center(
                            child: SizedBox(
                                height: heights * 0.3,
                                child: Icon(
                                  Icons.recycling,
                                  size: 100,
                                )),
                          )
                        ],
                      ),
                      ElevatedButton(onPressed: () {
                        
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
                                  ));
                      }, child: Text('Add Now'))
                    ],
                  );
                } else {
                  return Container(
                    height: heights * 1,
                    width: widths * 1,
                    color: Color.fromARGB(255, 240, 239, 239),
                    child: ListView.separated(
                      itemCount: wishListProvider.wishList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          color: Colors.white,
                          height: heights * 0.26,
                          width: widths * 1,
                          child: Row(
                            children: [
                              Column(
                                children: [
                                  SizedBox(
                                    // color: Colors.white,
                                    width: widths * 0.5,
                                    height: heights * 0.2,
                                    child: CachedNetworkImage(
                                        imageUrl: wishListProvider
                                            .wishList[index].imageUrl
                                        // wishListProvider
                                        // .wishListImage[index]
                                        ),
                                  ),
                                  ElevatedButton(
                                      onPressed: () {
                                        wishListProvider.addToCart(
                                            wishListProvider.wishList[index]);
                                      },
                                      child: Text('Add to cart'))
                                ],
                              ),
                              SizedBox(
                                height: heights * 0.225,
                                width: widths * 0.5,
                                // color: Colors.white,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      color: Colors.white,
                                      height: heights * 0.06,
                                      // width: widths*0,
                                      child: Center(
                                          child: Text(
                                        wishListProvider.wishList[index].title,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w900),
                                      )),
                                    ),
                                    SizedBox(
                                      height: heights * 0.16,
                                      width: widths * 0.5,
                                      child: ListView.builder(
                                          itemCount: 1,
                                          itemBuilder: (context, index2) {
                                            return Text(
                                              'Description:-\n${wishListProvider.wishList[index].description}',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                  color: Colors.black),
                                            );
                                          }),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          height: heights * 0.05,
                        );
                      },
                    ),
                  );
                }
              },
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
              // backgroundColor: Colors.blue,
              onTap: (value) {
                switch (value) {
                  case 0:
                    print('hlo');
                    if (value == 0) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    }
                    break;
                  case 1:
                    if (value != 1) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FavouritePage()),
                      );
                    }
                    print('by');
                    break;
                  case 2:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartPage()),
                    );
                    print('byby');
                    break;
                  case 3:
                    wishListProvider.userImage =
                        FirebaseAuth.instance.currentUser!.photoURL!;
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ManageAccount()),
                    );
                    break;
                  default:
                }
              },
              showSelectedLabels: true,
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
        );
      }),
    );
  }
}
