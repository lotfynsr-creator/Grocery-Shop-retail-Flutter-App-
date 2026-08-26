import 'package:flutter/material.dart';

class OrdersScreen extends StatefulWidget {
  const OrdersScreen({super.key});

  @override
  State<OrdersScreen> createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;

  // Sample data — swap these out for real order data later.
  final List<_Order> _ongoing = const [
    _Order(number: '348', status: 'Preparing', statusColor: Colors.blue, date: 'August 20, 2026', price: '\$65'),
    _Order(number: '349', status: 'On the way', statusColor: Colors.orange, date: 'August 24, 2026', price: '\$120'),
  ];

  final List<_Order> _history = const [
    _Order(number: '345', status: 'Delivered', statusColor: Colors.green, date: 'October 26, 2014', price: '\$700'),
    _Order(number: '346', status: 'Cancelled', statusColor: Colors.red, date: 'October 14, 2016', price: '\$452'),
    _Order(number: '347', status: 'Delivered', statusColor: Colors.green, date: 'July 26, 2017', price: '\$281'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 1);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Orders',
          style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.bold),
        ),
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.deepOrange,
          unselectedLabelColor: Colors.brown,
          indicatorColor: Colors.deepOrange,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          tabs: const [
            Tab(text: 'Ongoing'),
            Tab(text: 'History'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _OrderList(orders: _ongoing),
          _OrderList(orders: _history),
        ],
      ),
    );
  }
}

class _OrderList extends StatelessWidget {
  final List<_Order> orders;
  const _OrderList({required this.orders});

  @override
  Widget build(BuildContext context) {
    if (orders.isEmpty) {
      return const Center(
        child: Text('No orders yet', style: TextStyle(color: Colors.brown)),
      );
    }
    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: orders.length,
      separatorBuilder: (context, i) => const Divider(height: 24),
      itemBuilder: (context, i) {
        final order = orders[i];
        return Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.deepOrange,
              ),
              child: const Icon(Icons.shopping_basket, color: Colors.white, size: 22),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Order #${order.number}',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.brown,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    order.status,
                    style: TextStyle(
                      color: order.statusColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 13,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    order.date,
                    style: const TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ],
              ),
            ),
            Text(
              order.price,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.deepOrange,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _Order {
  final String number;
  final String status;
  final Color statusColor;
  final String date;
  final String price;

  const _Order({
    required this.number,
    required this.status,
    required this.statusColor,
    required this.date,
    required this.price,
  });
}
