import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_demo/controller/item_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final widths =
        MediaQuery.of(context).size.width;

    return SafeArea(
      child: Consumer<ItemChange>(builder: (context, detailsProvider, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: const BackButton(color: Colors.black),
          ),
          body: Column(
            children: [
              SizedBox(
                height: height * 0.4,
                child: CachedNetworkImage(
                  imageUrl: detailsProvider.productDetais[0].imageUrl,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Expanded(
                  child: Container(
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 1),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(36),
                        topRight: Radius.circular(36))),
                child: SizedBox(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          child: Text(
                            detailsProvider.productDetais[0].title,
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.02,
                        ),
                        SizedBox(
                          width: widths * 0,
                        ),
                        const Text(
                          'Description',
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 16),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          child: SizedBox(
                            height: height * 0.2,
                            child: ListView.builder(
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                return Text(detailsProvider
                                        .productDetais[0].description
                                    // productList['lists']
                                    //       [detailsProvider.catogoryChange][2]
                                    //   [detailsProvider.itemsDetails]
                                    );
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 16 * 2,
                          ),
                        ),
                        Center(
                          child: SizedBox(
                            height: 48,
                            width: 200,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.orange,
                                    shape: const StadiumBorder()),
                                onPressed: (() {
                                  detailsProvider.addToCart(
                                      detailsProvider.productDetais[0]);
                                }),
                                child: const Text(
                                  "Add to cart",
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 16 * 2,
                        ),
                      ]),
                ),
              ))
            ],
          ),
        );
      }),
    );
  }
}
