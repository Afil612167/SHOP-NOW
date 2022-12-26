import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';

import '../../controller/item_provider.dart';
import '../../view/product_details.dart';

class itemGrid extends StatefulWidget {
  itemGrid({
    Key? key,
    required this.heights,
    required this.widths,
  }) : super(key: key);

  final double heights;
  final double widths;
  @override
  State<itemGrid> createState() => _itemGridState();
}

class _itemGridState extends State<itemGrid> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ItemChange>(builder: (context, itemProvider, child) {
      return SizedBox(
        height: widget.heights * 0.659,
        width: double.infinity,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: widget.heights * 0.025,
            crossAxisSpacing: widget.widths * 0.1,
            childAspectRatio: 1 / 1.3,
            crossAxisCount: 2,
          ),
          itemCount: itemProvider.currentProductList.length,
          itemBuilder: (context, index) {
            return Container(
                height: widget.heights * 0.1,
                width: widget.widths * 0.3,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(80, 0, 0, 0),
                        offset: Offset(
                          0.20,
                          0.0,
                        ),
                        blurRadius: 5.0,
                        spreadRadius: 5.0,
                      )
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: GridTile(
                  header: Column(
                    children: [
                      SizedBox(
                        height: widget.heights * 0.013,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: widget.widths * 0.01,
                          ),
                          LikeButton(
                            onTap: (isliked) async {
                              itemProvider.addToWhishlist(
                                  itemProvider.currentProductList[index]);
                            },
                            size: widget.heights * 0.03,
                          ),
                          SizedBox(
                            width: widget.widths * 0.27,
                          ),
                          InkWell(
                              onTap: () {
                                try {
                                itemProvider.addToCart(
                                    itemProvider.currentProductList[index]);
                                } catch (e) {
                                  print(e.toString());
                                }
                              },
                              child: Icon(
                                Icons.add_shopping_cart_outlined,
                                color: Colors.black,
                              )),
                        ],
                      ),
                    ],
                  ),
                  footer: Row(
                    children: [
                      SizedBox(
                        width: widget.widths * 0.02,
                      ),
                      SizedBox(
                        height: widget.heights * 0.035,
                        width: widget.widths * 0.4,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 1,
                            itemBuilder: (context, index2) {
                              return Text(
                                itemProvider.currentProductList[index].title,
                                style: TextStyle(fontWeight: FontWeight.w900),
                              );
                            }),
                      )
                    ],
                  ),
                  child: InkWell(
                    onTap: () {
                      itemProvider.addToProductDetails(
                          itemProvider.currentProductList[index]);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailsScreen()),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.all(widget.heights * 0.01),
                      child: CachedNetworkImage(
                        imageUrl:
                            itemProvider.currentProductList[index].imageUrl,
                        errorWidget: (context, url, error) => Icon(Icons.error),
                        placeholder: (context, url) =>
                            Center(child: CircularProgressIndicator()),
                      ),
                    ),
                  ),
                
                ));
          },
        ),
      );
    });
  }
}
