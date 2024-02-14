import 'package:ecomerce/model/product.dart';
import 'package:ecomerce/service/remote_service/remote_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController instance = Get.find();
  TextEditingController searchTextEditController = TextEditingController();
  RxList<Product> productList = List<Product>.empty(growable: true).obs;
  RxBool isProductLoading = false.obs;

   RxString searchVal = ''.obs;

  @override
  void onInit() {
    getProducts();
    super.onInit();
  }

  void getProducts() async {
    try {
      isProductLoading(true);
      var result = await RemoteProductService().get();
      if (result != null) {
        productList.assignAll(productListFromJson(result.body));
      }
    } finally {
      isProductLoading(false);
      // print(productList.length);
    }
  }

  void getProductByName({required String keyword}) async {
    try {
      isProductLoading(true);
      var result = await RemoteProductService().getByName(keyword: keyword);
      if(result != null){
        productList.assignAll(productListFromJson(result.body));
      }
    } finally {
      isProductLoading(false);
      // print(productList.length);
    }
  }


  void getProductByCategory({required int id}) async {
    try {
      isProductLoading(true);
      var result = await RemoteProductService().getByCategory(id: id);
      if(result != null){
        productList.assignAll(productListFromJson(result.body));
      }
    } finally {
      isProductLoading(false);
      print(productList.length);
    }
  }
}
