import 'package:flutter/material.dart';

class SearchScreen extends StatelessWidget {
  final List<String> suggestions = [
    "Sofas",
    "Dining Tables",
    "Chairs",
    "Beds",
    "Wardrobes",
    "Study Tables",
    "TV Units",
    "Bookshelves"
  ]; // Mock suggestions list

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
        title: Text('Search', style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Search Bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search for furniture...',
                  prefixIcon: Icon(Icons.search, color: Colors.grey),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                ),
                onChanged: (query) {
                  // Handle search query here
                  print('Search query: $query');
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Suggestions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          // Suggestions List
          Expanded(
            child: ListView.builder(
              itemCount: suggestions.length,
              itemBuilder: (context, index) {
                final suggestion = suggestions[index];
                return ListTile(
                  leading: Icon(Icons.search, color: Colors.blue),
                  title: Text(suggestion),
                  onTap: () {
                    // Handle navigation or selection
                    print('Tapped on: $suggestion');
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
