import 'package:ecomerce/view/home/widgets/popular-category/popular_category_loading_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PopularCategoryLoading extends StatelessWidget {
  const PopularCategoryLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.only(right: 10),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: 5,
          itemBuilder: (context, index) => const PopularCategoryLoadingCard()),
    );
  }
}
