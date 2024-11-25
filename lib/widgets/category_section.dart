import 'package:flutter/material.dart';

class CategorySection extends StatelessWidget {
  final List<dynamic> categories;
  CategorySection(this.categories);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                '/category',
                arguments: category ?? {}, // Fallback to an empty map if category is null
              );
            },
            child: Column(
              children: [
                Image.asset(category['icon'], height: 50),
                SizedBox(height: 8),
                Text(category['label'], style: TextStyle(fontSize: 12)),
              ],
            ),
          );
        },
      ),
    );
  }
}
