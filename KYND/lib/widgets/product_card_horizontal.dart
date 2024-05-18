import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final double rating;
  final String cuisine;
  final String priceRange;
  final String location;

  const FoodCard({
    Key? key,
    required this.imageUrl,
    required this.name,
    required this.rating,
    required this.cuisine,
    required this.priceRange,
    required this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 4.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16.0),
              topRight: Radius.circular(16.0),
            ),
            child: Image.network(
              imageUrl,
              height: 180.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Restaurant Name and Rating
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.star, color: Colors.white, size: 16.0),
                          SizedBox(width: 4.0),
                          Text(
                            rating.toString(),
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                // Cuisine and Price Range
                Text(
                  '$cuisine · $priceRange',
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 8.0),
                // Location
                Row(
                  children: [
                    Icon(Icons.location_pin, color: Colors.grey, size: 16.0),
                    SizedBox(width: 4.0),
                    Text(
                      location,
                      style: TextStyle(
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
