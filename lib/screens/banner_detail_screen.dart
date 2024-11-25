import 'package:flutter/material.dart';

class BannerDetailScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Safely access arguments
    final banner = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>? ?? {};

    // Extract details with null checks
    final title = banner['title'] ?? 'Unknown Banner';
    final subtitle = banner['subtitle'] ?? 'No details available';
    final image = banner['image'] ?? '';

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image.isNotEmpty
                ? Image.asset(image)
                : Icon(Icons.image_not_supported, size: 200, color: Colors.grey),
            SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text(
              subtitle,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
