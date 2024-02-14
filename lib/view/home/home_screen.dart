import 'package:ecomerce/controller/controllers.dart';
import 'package:ecomerce/view/home/widgets/carousel-category/carousel_loading.dart';
import 'package:ecomerce/view/home/widgets/carousel-category/carousel_slider_view.dart';
import 'package:ecomerce/view/home/widgets/popular-category/popular_category.dart';
import 'package:ecomerce/view/home/widgets/popular-category/popular_category_loading.dart';
import 'package:ecomerce/view/home/widgets/popular_product/popular_product.dart';
import 'package:ecomerce/view/home/widgets/popular_product/popular_product_loading.dart';
import 'package:ecomerce/view/home/widgets/section_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';

import '../../component/main_header.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Column(
      children: [
        const MainHeader(),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Obx(() {
                  if (homeController.bannerList.isNotEmpty) {
                    return CarouselSliderView(
                        bannerList: homeController.bannerList);
                  } else {
                    return const CarouselLoading();
                  }
                }),
                const SectionTitle(title: "Popular Category"),
                Obx(() {
                  if (homeController.popularCategoryList.isNotEmpty) {
                    return PopularCategory(
                        categories: homeController.popularCategoryList);
                  } else {
                    return const PopularCategoryLoading();
                  }
                }),
                const SectionTitle(title: "Popular Product"),
                Obx(() {
                  if (homeController.popularProductList.isNotEmpty) {
                     return PopularProduct(
                        popularProducts: homeController.popularProductList);
                  } else {
                    return const PopularProductLoading();
                  }
                }),
              ],
            ),
          ),
        )
      ],
    ));
  }
}
