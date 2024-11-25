import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems = [
    {
      "name": "3-Seater Sofa",
      "price": 10499,
      "quantity": 1,
      "image": "assets/sofa1.png",
    },
    {
      "name": "Study Table",
      "price": 4599,
      "quantity": 2,
      "image": "assets/study.png",
    },
    {
      "name": "Wardrobe",
      "price": 8499,
      "quantity": 1,
      "image": "assets/storage.png",
    },
  ]; // Mock data for cart items

  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('My Cart', style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          // Cart Items List
          Expanded(
            child: cartItems.isEmpty
                ? _buildEmptyCart(context) // Pass context explicitly
                : _buildCartItemsList(),
          ),
          // Cart Total and Checkout Button
          _buildCartSummary(context), // Pass context explicitly
        ],
      ),
    );
  }

  // Empty Cart State
  Widget _buildEmptyCart(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart_outlined, size: 100, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'Your cart is empty!',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Start shopping and add items to your cart.',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context); // Correct usage of context
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

  // Cart Items List
  Widget _buildCartItemsList() {
    return ListView.builder(
      itemCount: cartItems.length,
      itemBuilder: (context, index) {
        final item = cartItems[index];
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
              '₹${item['price']} x ${item['quantity']}',
              style: TextStyle(color: Colors.grey),
            ),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                // Remove item from cart logic
                print('Removed ${item['name']} from cart');
              },
            ),
          ),
        );
      },
    );
  }

  // Cart Total and Checkout Section
  Widget _buildCartSummary(BuildContext context) {
    // Explicitly cast total price to int
    final num totalPrice = cartItems.fold(0, (num sum, item) {
      return sum + (item['price'] * item['quantity']).toInt();
    });

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 2),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Total:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text('₹$totalPrice', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              // Handle checkout
              print('Proceed to checkout');
            },
            child: Text('Proceed to Checkout',style: TextStyle(color: Colors.white),),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,

              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            ),
          ),
        ],
      ),
    );
  }
}
