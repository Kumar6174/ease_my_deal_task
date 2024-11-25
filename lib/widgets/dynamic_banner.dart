import 'package:flutter/material.dart';

class DynamicBanner extends StatelessWidget {
  final List<dynamic> banners; // Expecting a list of banners
  const DynamicBanner(this.banners, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200, // Fixed height for the banner slider
      child: PageView.builder(
        itemCount: banners.length,
        itemBuilder: (context, index) {
          final banner = banners[index];
          return GestureDetector(
            onTap: (){
              Navigator.pushNamed(
                context,
                '/bannerDetail',
                arguments: banner ?? {}, // Fallback to an empty map if banner is null
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,

                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Ensure text and image fit inside the height constraints
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          banner['title'],
                          style: TextStyle(fontSize: 20, color: Colors.white),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis, // Prevent text overflow
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          banner['subtitle'],
                          style: TextStyle(fontSize: 16, color: Colors.white),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 4, // Image takes more space
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
                        child: Image.asset(
                          banner['image'],
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
