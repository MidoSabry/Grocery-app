import 'package:ecomerce/controller/category_controller.dart';
import 'package:ecomerce/controller/dashboard_controller.dart';
import 'package:ecomerce/controller/home_controller.dart';
import 'package:ecomerce/controller/product_controller.dart';
import 'package:get/get.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(DashboardController());
    Get.put(HomeController());
    Get.put(ProductController());
    Get.put(CategoryController());
  }
}