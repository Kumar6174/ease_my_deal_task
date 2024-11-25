import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  final List<Map<String, dynamic>> wishlistItems = [
    {
      "name": "3-Seater Sofa",
      "price": 10499,
      "image": "assets/sofa1.png",
    },
    {
      "name": "Study Table",
      "price": 4599,
      "image": "assets/study.png",
    },
    {
      "name": "Wardrobe",
      "price": 8499,
      "image": "assets/storage.png",
    },
  ]; // Mock data for wishlist items

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('My Wishlist', style: TextStyle(color: Colors.white)),
      ),
      body: wishlistItems.isEmpty
          ? _buildEmptyWishlist(context) // Show empty state if no items
          : _buildWishlist(context), // Show wishlist items
    );
  }

  // Empty Wishlist UI
  Widget _buildEmptyWishlist(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.favorite_border, size: 100, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'Your wishlist is empty!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Browse and add your favorite items.',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Navigate to shop or categories screen
              Navigator.pop(context);
            },
            child: Text('Start Shopping'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }

  // Wishlist Items UI
  Widget _buildWishlist(BuildContext context) {
    return ListView.builder(
      itemCount: wishlistItems.length,
      itemBuilder: (context, index) {
        final item = wishlistItems[index];
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 4,
          child: ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                item['image'],
                height: 60,
                width: 60,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              item['name'],
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              '₹${item['price']}',
              style: TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                // Remove item from wishlist
                print('Removed ${item['name']} from wishlist');
              },
            ),
          ),
        );
      },
    );
  }
}
