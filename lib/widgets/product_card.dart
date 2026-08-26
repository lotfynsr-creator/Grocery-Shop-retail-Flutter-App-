import 'package:flutter/material.dart';

class ProductCard
    extends
        StatelessWidget {
  final String title;
  final String sub;
  final String price;
  final String img;

  const ProductCard({super.key, required this.title, required this.sub, required this.price, required this.img});

  @override
  Widget build(
    BuildContext context,
  ) {
    return SizedBox(
      width: 160,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            15,
          ),
          border: Border.all(
            color: Colors.grey[200]!,
          ),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(
          12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                img,
                height: 75,
                fit: BoxFit.contain,
              ),
            ),
            const Spacer(),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.brown,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              sub,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 11,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  price,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.deepOrange,
                  ),
                ),
                Container(
                  width: 28,
                  height: 28,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/images/plus.png',
                      width: 14,
                      height: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
