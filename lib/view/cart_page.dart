import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_demo/view/wishlIst_page.dart';
import 'package:firebase_demo/widgets/IconButtons/navigatingHomePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/item_provider.dart';
import 'HomePage.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final widths = MediaQuery.of(context).size.width;
    final heights = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Consumer<ItemChange>(builder: (context, cartProvider, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: Colors.blue,
            appBar: AppBar(
              leading: homePageNavigation(),
              backgroundColor: Color.fromARGB(255, 89, 0, 255),
              title: Text(
                'Cart',
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
              child: cartProvider.cartList.isEmpty
                  ? Column(
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
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomeScreen(),
                                  ));
                            },
                            child: Text('Add Now'))
                      ],
                    )
                  : ListView.builder(
                      itemCount: cartProvider.cartList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: heights * 1,
                          width: widths * 1,
                          color: Color.fromARGB(255, 240, 239, 239),
                          child: ListView.separated(
                            itemCount: cartProvider.cartList.length,
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
                                              imageUrl: cartProvider
                                                  .cartList[index].imageUrl),
                                        ),
                                        ElevatedButton(
                                            onPressed: () {
                                              cartProvider.addToDelivery(
                                                  cartProvider.cartList[index]);
                                            },
                                            child: Text('order now'))
                                      ],
                                    ),
                                    SizedBox(
                                      height: heights * 0.225,
                                      width: widths * 0.5,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            color: Colors.white,
                                            height: heights * 0.06,
                                            // width: widths*0,
                                            child: Center(
                                                child: Text(
                                              cartProvider
                                                  .cartList[index].title,
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
                                                    'Description:-\n${cartProvider.cartList[index].description}',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
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
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return SizedBox(
                                height: heights * 0.05,
                              );
                            },
                          ),
                        );
                      },
                    ),
            ),
            bottomNavigationBar: BottomNavigationBar(
                onTap: (value) {
                  switch (value) {
                    case 0:
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      break;
                    case 1:
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FavouritePage()),
                      );
                      break;
                    case 2:
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CartPage()),
                      );
                      break;
                  }
                },
                
                selectedItemColor: Colors.grey,
                unselectedItemColor: Colors.grey,
                showSelectedLabels: false,
                type: BottomNavigationBarType.fixed,
                showUnselectedLabels: false,
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.category), label: 'hlo'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.favorite), label: 'hi'),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_cart_checkout_sharp),
                      label: 'kh'),
                  // BottomNavigationBarItem(
                  //     icon: Icon(Icons.manage_accounts), label: 'kh'),
                ]),
          ),
        );
      }),
    );
  }
}
