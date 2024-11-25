import 'package:flutter/material.dart';

class TopNavigation extends StatelessWidget {
  final String deliveryAddress;

  TopNavigation(this.deliveryAddress);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Delivery Address
          Row(
            children: [
              Icon(Icons.location_on, color: Colors.grey),
              SizedBox(width: 8),
              Text('Delivery to $deliveryAddress', style: TextStyle(color: Colors.grey)),
            ],
          ),
          // Action Icons: Search, Wishlist, Cart
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/search');
                },
                child: Icon(Icons.search, color: Colors.grey),
              ),
              SizedBox(width: 16),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/wishlist');
                },
                child: Icon(Icons.favorite_border, color: Colors.grey),
              ),
              SizedBox(width: 16),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/cart');
                },
                child: Icon(Icons.shopping_cart, color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
