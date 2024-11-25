import 'package:flutter/material.dart';

class DealDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Safely access arguments
    final product = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ?? {};

    // Extract details with null checks
    final name = product['name'] ?? 'Unknown Product';
    final price = product['price'] ?? 'N/A';
    final discount = product['discount'] ?? 0;
    final image = product['image'] ?? '';

    return Scaffold(
      appBar: AppBar(title: Text(name)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image.isNotEmpty
                ? Image.asset(image, height: 200)
                : Icon(Icons.image_not_supported, size: 200, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              '₹$price',
              style: TextStyle(fontSize: 20, color: Colors.green),
            ),
            Text(
              'Discount: $discount%',
              style: TextStyle(fontSize: 18, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }
}
