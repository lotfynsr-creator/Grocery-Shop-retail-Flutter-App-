import 'package:flutter/material.dart';

import 'widgets/category_item.dart';
import 'widgets/product_card.dart';
import 'widgets/section_header.dart';

class GroceryHomeScreen
    extends
        StatelessWidget {
  const GroceryHomeScreen({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(
          20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  15,
                ),
                image: const DecorationImage(
                  image: AssetImage(
                    'assets/images/banner.png',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const SectionHeader(
              title: 'Categories',
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 90,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CategoryItem(
                    label: 'Fruits',
                    img: 'assets/images/noun.png',
                    color: Colors.purple.shade100,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  CategoryItem(
                    label: 'Vegtables',
                    img: 'assets/images/pumpkin.png',
                    color: Colors.orange.shade100,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  CategoryItem(
                    label: 'Meat',
                    img: 'assets/images/Meat.png',
                    color: Colors.red.shade100,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  CategoryItem(
                    label: 'Fish',
                    img: 'assets/images/fish2.png',
                    color: Colors.pink.shade100,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            const SectionHeader(
              title: 'Popular Deals',
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 230,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  ProductCard(
                    title: 'Red Apple',
                    sub: '1kg, priceg',
                    price: '\$ 4,99',
                    img: 'assets/images/apple.png',
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  ProductCard(
                    title: 'Orginal Banana',
                    sub: '1kg, priceg',
                    price: '\$ 5,99',
                    img: 'assets/images/banana.png',
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  ProductCard(
                    title: 'Potatoes',
                    sub: '1 pcs, priceg',
                    price: '\$ 2,49',
                    img: 'assets/images/pumpkin.png',
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  ProductCard(
                    title: 'Steak Meat',
                    sub: '500g, priceg',
                    price: '\$ 12,99',
                    img: 'assets/images/Meat.png',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
