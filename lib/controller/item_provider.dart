// import 'package:flutter/cupertino.dart';
import 'package:firebase_demo/utilities/List/item_list.dart';
import 'package:flutter/material.dart';

import 'modelClass/modelClassItemList.dart';

class ItemChange extends ChangeNotifier {
  String defaultCategory = '0';
  List<Product> currentProductList = [];
  List<Product> currentSearchedProductList = productList1;
  List<Product> wishList = [];
  List<Product> cartList = [];
  List<Product> deliveryList = [];
  List<Product> productDetais = [];
  String itemImage = '';
  String userImage = '';

  Color favouriteColor = Colors.grey;
  userImageChange() {
    userImage = userImage;
    notifyListeners();
  }

  colorChange() {
    favouriteColor = Color.fromARGB(255, 219, 101, 93);
    notifyListeners();
  }

  changeCategory({required String cat}) {
    try {
      
    defaultCategory = cat;
    notifyListeners();
    getItems();
    } catch (e) {
      print("exception  is:--");
    }
  }

  getItems() {
    print('current proct list running');
    
    try {
      currentProductList.clear();
      // print(productList1.length);
      productList1.forEach((element) {
        print(element.category);
        if (element.category == defaultCategory) {
          currentProductList.add(element);
        }
      });
      notifyListeners();
    } catch (e) {
      print('error is' + e.toString());
    }
  }

  update({required List<Product> data}) {
    currentProductList.clear();
    try {
      data.forEach((element) {
        currentProductList.add(element);
      });
    } catch (e) {
      print('error is' + e.toString());
    }
    notifyListeners();
  }

  addToProductDetails(Product product) {
    productDetais.clear();
    productDetais.add(product);
  }

  addToWhishlist(Product product) {
    wishList.add(product);
  }

  addToCart(Product product) {
    cartList.add(product);
  }

  addToDelivery(Product product) {
    deliveryList.add(product);
  }
}

class Status {
  String LOADING = 'LOADING';
  String LOADED = 'LOADED';
}
