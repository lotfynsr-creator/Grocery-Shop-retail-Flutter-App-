import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String label;
  final String img;
  final Color color;

  const CategoryItem({
    super.key,
    required this.label,
    required this.img,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(shape: BoxShape.circle, color: color),
          child: Center(
            child: Image.asset(img, width: 32, height: 32),
          ),
        ),
        const SizedBox(height: 8),
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
