import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_demo/utilities/List/item_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../controller/item_provider.dart';

class catogoryGrid extends StatelessWidget {
  const catogoryGrid({
    Key? key,
    required this.heights,
  }) : super(key: key);

  final double heights;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: heights * 0.1,
      child: GridView.builder(
        itemCount: 4,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4, mainAxisSpacing: 10, crossAxisSpacing: 15),
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
              child: Container(
                margin: EdgeInsets.all(10),
                // color: Colors.white,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(80, 0, 0, 0),
                    offset: Offset(
                      0.0,
                      0.10,
                    ),
                    blurRadius: 5.0,
                    spreadRadius: 2.0,
                  )
                ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: CachedNetworkImage(
                    imageUrl: catList[index].imageUrl,
                  ),
                ),
              ),
              onTap: () {
                context
                    .read<ItemChange>()
                    .changeCategory(cat: catList[index].type);
              });
        },
      ),
    );
  }
}
