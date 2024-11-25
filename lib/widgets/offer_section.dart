import 'package:flutter/material.dart';

class OfferSection extends StatelessWidget {
  final Map<String, dynamic> offers;
  OfferSection(this.offers);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(offers['title'], style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),

        ...offers['offers'].map((offer) {
        return Padding(
          padding: const EdgeInsets.only(left: 16.0,right: 16.0),

          child: Container(

            decoration: BoxDecoration(

              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(5),
            ),// Light grey background color
            margin: EdgeInsets.symmetric(vertical: 4.0), // Optional spacing between tiles
            child: ListTile(
              // style: ListTileStyle.list,
              leading: Icon(Icons.local_offer, color: Colors.yellow),
              title: Text(offer['title']),
              subtitle: Text(offer['subtitle']),
            ),
          ),
        );
      }).toList(),]
    );
  }
}
