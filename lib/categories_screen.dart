import 'package:flutter/material.dart';

class CategoriesScreen
    extends
        StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.brown,
          ),
          onPressed: () => Navigator.pop(
            context,
          ),
        ),
        title: const Text(
          'Categories',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.deepOrange,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(
          20,
        ),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                filled: true,
                fillColor: Colors.grey[100],
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 0,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(
                    15,
                  ),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 20,
              childAspectRatio: 0.75,
              children: [
                CategoryItem(
                  label: 'Fruits',
                  img: 'assets/images/noun.png',
                  color: Colors.purple.shade100,
                ),
                CategoryItem(
                  label: 'Vegtables',
                  img: 'assets/images/pumpkin.png',
                  color: Colors.orange.shade100,
                ),
                CategoryItem(
                  label: 'Meat',
                  img: 'assets/images/Meat.png',
                  color: Colors.red.shade100,
                ),
                CategoryItem(
                  label: 'Fish',
                  img: 'assets/images/fish2.png',
                  color: Colors.pink.shade100,
                ),
                CategoryItem(
                  label: 'Sea food',
                  img: 'assets/images/seafood.png',
                  color: Colors.amber.shade100,
                ),
                CategoryItem(
                  label: 'Juice',
                  img: 'assets/images/juice.png',
                  color: Colors.lightGreen.shade100,
                ),
                CategoryItem(
                  label: 'Egg & Milk',
                  img: 'assets/images/egg.png',
                  color: Colors.lightBlue.shade100,
                ),
                CategoryItem(
                  label: 'Ice cream',
                  img: 'assets/images/ice.png',
                  color: Colors.pink.shade100,
                ),
                CategoryItem(
                  label: 'Cake',
                  img: 'assets/images/cake.png',
                  color: Colors.orange.shade200,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class CategoryItem
    extends
        StatelessWidget {
  final String label;
  final String img;
  final Color color;

  const CategoryItem({super.key, required this.label, required this.img, required this.color});

  @override
  Widget build(
    BuildContext context,
  ) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
          child: Center(
            child: Image.asset(
              img,
              width: 32,
              height: 32,
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.brown,
            fontWeight: FontWeight.w500,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
