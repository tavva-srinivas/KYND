import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kynd/features/product/screens/product_detail_screen.dart';
import 'package:kynd/utils/devices_utils/device_util.dart';

import '../features/Plan/Screens/helper_widgets/clipper_horizontal_card.dart';

class Hor_plan_card extends StatefulWidget {
  final String id;
  final List<String> images;
  final String name;
  final double rating;
  final String price;
  final String mealTime;
  final bool is_veg;

  const Hor_plan_card({
    Key? key,
    required this.id,
    required this.images,
    required this.name,
    required this.rating,
    required this.mealTime,
    required this.price,
    required this.is_veg,
  }) : super(key: key);

  @override
  _Hor_plan_cardState createState() => _Hor_plan_cardState();
}

class _Hor_plan_cardState extends State<Hor_plan_card> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: () => Navigator.pushNamed(context, Product_detail.route_name, arguments: widget.id),
      child: Card(
        color: Colors.white,
        margin: const EdgeInsets.all(8.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 4.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image carousel with meal time
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              child: Stack(
                children: [
                  ClipPath(
                    clipper: Card_hor_clipper(offset: widget.mealTime.length * 8 + 50),
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 180.0,
                        viewportFraction: 1.0,
                        enableInfiniteScroll: true,
                        autoPlay: true,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                      ),
                      items: widget.images.map((image) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Image.asset(
                              image,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),

                  /// Dots for the slider
                  Positioned(
                    left: MediaQuery.of(context).size.width / 3,
                    bottom: 8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: widget.images.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () => {},
                          child: Container(
                            width: 10,
                            height: 6,
                            margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: _current == entry.key
                                  ? Colors.white.withOpacity(0.9)
                                  : Colors.grey.withOpacity(0.3),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),

                  // Description of meal type
                  Positioned(
                    bottom: 0,
                    right: 10,
                    child: Center(
                      child: Text(
                        widget.mealTime,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Details section
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
                        widget.name,
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 2.0),
                        decoration: BoxDecoration(
                          color: Colors.green.shade600,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.star, color: Colors.white, size: 16.0),
                            SizedBox(width: 4.0),
                            Text(
                              widget.rating.toString(),
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
                  SizedBox(height: 6.0),
                  // Veg/Non-Veg and Cuisine
                  RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: <TextSpan>[
                        TextSpan(
                          text: widget.is_veg ? "Veg" : "Non-Veg",
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        TextSpan(
                          text: ' • ',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey.shade800,
                          ),
                        ),
                        TextSpan(
                          text: "South Indian", // Replace with actual cuisine
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
