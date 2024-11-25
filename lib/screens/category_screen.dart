import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Safely access arguments
    final category = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ?? {};

    // Extract details with null checks
    final icon = category['icon'] ?? '';
    final label = category['label'] ?? 'Unknown Category';

    return Scaffold(
      appBar: AppBar(title: Text(label)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon.isNotEmpty
                ? Image.asset(icon, height: 100)
                : Icon(Icons.image_not_supported, size: 100, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              label,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
