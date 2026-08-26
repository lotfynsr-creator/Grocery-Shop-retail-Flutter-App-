import 'package:flutter/material.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final List<_CartProduct> _items = [
    _CartProduct(title: 'Red Apple', unit: 'kg', pricePerUnit: 4.99, qty: 2, img: 'assets/images/apple.png'),
    _CartProduct(title: 'Orginal Banana', unit: 'kg', pricePerUnit: 5.99, qty: 2, img: 'assets/images/banana.png'),
    _CartProduct(title: 'Avocado Bowl', unit: 'st', pricePerUnit: 24, qty: 1, img: 'assets/images/Avocado.png'),
    _CartProduct(title: 'Salmon', unit: 'kg', pricePerUnit: 50, qty: 2, img: 'assets/images/salmon.png'),
  ];

  void _increment(int index) {
    setState(() => _items[index].qty++);
  }

  void _decrement(int index) {
    setState(() {
      if (_items[index].qty > 1) {
        _items[index].qty--;
      }
    });
  }

  void _removeItem(int index) {
    setState(() => _items.removeAt(index));
  }

  double get _total =>
      _items.fold(0, (sum, item) => sum + item.pricePerUnit * item.qty);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Cart',
          style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: _items.isEmpty
                ? const Center(
                    child: Text('Your cart is empty', style: TextStyle(color: Colors.brown)),
                  )
                : ListView.builder(
                    itemCount: _items.length,
                    itemBuilder: (context, index) {
                      final item = _items[index];
                      return Dismissible(
                        key: ValueKey(item.title + index.toString()),
                        direction: DismissDirection.endToStart,
                        onDismissed: (_) => _removeItem(index),
                        background: Container(
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          color: Colors.red,
                          child: const Icon(Icons.delete, color: Colors.white),
                        ),
                        child: _CartItemTile(
                          item: item,
                          onIncrement: () => _increment(index),
                          onDecrement: () => _decrement(index),
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.brown),
                    ),
                    Text(
                      '\$${_total.toStringAsFixed(2)}',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.deepOrange),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepOrange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: _items.isEmpty ? null : () {},
                    child: const Text(
                      'CheckOut',
                      style: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CartProduct {
  final String title;
  final String unit;
  final double pricePerUnit;
  int qty;
  final String img;

  _CartProduct({
    required this.title,
    required this.unit,
    required this.pricePerUnit,
    required this.qty,
    required this.img,
  });
}

class _CartItemTile extends StatelessWidget {
  final _CartProduct item;
  final VoidCallback onIncrement;
  final VoidCallback onDecrement;

  const _CartItemTile({
    required this.item,
    required this.onIncrement,
    required this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            Image.asset(item.img, width: 55, height: 55),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.brown),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove, size: 14),
                          onPressed: onDecrement,
                          constraints: const BoxConstraints(),
                          padding: const EdgeInsets.all(6),
                        ),
                        Text('${item.qty}', style: const TextStyle(fontWeight: FontWeight.bold)),
                        IconButton(
                          icon: const Icon(Icons.add, size: 14),
                          onPressed: onIncrement,
                          constraints: const BoxConstraints(),
                          padding: const EdgeInsets.all(6),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Text(
              '\$${item.pricePerUnit.toStringAsFixed(2)} ${item.unit}',
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.brown),
            ),
          ],
        ),
      ),
    );
  }
}
