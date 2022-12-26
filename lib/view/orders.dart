import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_demo/view/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/item_provider.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});

  @override
  Widget build(BuildContext context) {
        final widths = MediaQuery.of(context).size.width;
    final heights = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Consumer<ItemChange>(builder: (context, orderProvider, child) {
        return Scaffold(
          backgroundColor: Colors.blue,
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 89, 0, 255),
            title: Text(
              'Orders',
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
            child:orderProvider.deliveryList.isEmpty?
            Column(
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
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen()),
                                  );
                      }, child: Text('Add Now'))
                    ],
                  ):
            ListView.builder(
              itemCount: orderProvider.deliveryList.length,
              itemBuilder: (context, index) {
                  return Container(
                    height: heights * 1,
                    width: widths * 1,
                    color: Color.fromARGB(255, 240, 239, 239),
                    child: ListView.separated(
                      itemCount: orderProvider.deliveryList.length,
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
                                        imageUrl: orderProvider
                                            .deliveryList[index].imageUrl),
                                  ),
                                  // ElevatedButton(
                                  //     onPressed: () {
                                  //       orderProvider.addToDelivery(
                                  //           cartProvider.cartList[index]);

                                  //       // cartProvider.orderListDescription.add(
                                  //       //     productList['lists'][cartProvider
                                  //       //         .catogoryChange][2][index]);
                                  //       // cartProvider.orderListImage.add(
                                  //       //     productList['lists'][cartProvider
                                  //       //         .catogoryChange][1][index]);
                                  //       // cartProvider.orderListItem.add(productList[
                                  //       //             'lists']
                                  //       //         [cartProvider.catogoryChange]
                                  //       //     [0][index]);
                                  //       // cartProvider.wishListCounter();
                                  //     },
                                  //     child: Text('order now'))
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
                                        orderProvider.deliveryList[index].title,
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
                                              'Description:-\n${orderProvider.deliveryList[index].description}',
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
              
              },
            ),
          ),
        );
      }),
    );
  }
  }
