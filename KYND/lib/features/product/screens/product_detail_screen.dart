import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kynd/features/product/screens/helping_widgets/Rating_stars.dart';
import 'package:kynd/features/product/screens/product_review.dart';
import 'package:kynd/features/product/screens/tabs_detail_screen/menu_tab.dart';
import 'package:kynd/utils/devices_utils/device_util.dart';

import '../../home/Screens/homescreen_widgets/curved_edges.dart';

class Product_detail extends StatefulWidget {
  static const String route_name = '/product_detail';

  final String product_id;
  const Product_detail({super.key, required this.product_id});

  @override
  _Product_detailState createState() => _Product_detailState();
}

class _Product_detailState extends State<Product_detail> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFe8f5e9),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: IconButton(
              icon: Icon(Icons.favorite_border, color: Colors.black),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  /// breif-details, image, name
                  ClipPath(
                    clipper: Custom_curved_edges(),
                    child: Container(
                      color: Color(0xFFe8f5e9),
                      child: Column(
                        children: [
                          /// short-details
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 18, right: 16, bottom: 10, top: 10),
                                child: Flexible(
                                  child: Container(
                                    height: Device_util.get_height(context) * 0.14,
                                    width: 3,
                                    color: Colors.redAccent.shade100,
                                  ),
                                ),
                              ),

                              /// short details
                              const Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text("500 Cal"),
                                    SizedBox(height: 12),
                                    Text("60 gm Carbs"),
                                    SizedBox(height: 12),
                                    Text("30 gm Protein"),
                                    SizedBox(height: 12),
                                    Text("14 gm Fat"),
                                  ],
                                ),
                              ),

                              /// carousel images
                              Expanded(
                                flex: 2,
                                child: Column(
                                  children: [
                                    CarouselSlider(
                                      options: CarouselOptions(
                                        height: Device_util.get_height(context) * 0.24,
                                        viewportFraction: 1.0,
                                        enableInfiniteScroll: true,
                                        autoPlay: true,
                                      ),
                                      items: ["assets/images/breakfast.jpg", "assets/images/breakfast.jpg", "assets/images/breakfast.jpg"]
                                          .map((image) {
                                        return Builder(
                                          builder: (BuildContext context) {
                                            return CircleAvatar(
                                              radius: 100, // adjust the size as needed
                                              backgroundColor: Colors.transparent,
                                              child: ClipOval(
                                                child: Image.asset(
                                                  image,
                                                  width: Device_util.get_width(context) * 0.5, // adjust the size as needed
                                                  height: Device_util.get_width(context) * 0.5, // adjust the size as needed
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      }).toList(),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 24),

                          Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 24),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      /// plan name
                                      Row(
                                        children: [
                                          Container(
                                            height: 8,
                                            width: 8,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(100), color: Colors.redAccent.shade100),
                                          ),
                                          SizedBox(width: 12),
                                          Text(
                                            "Paneer paratha and dahi",
                                            style: Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.grey.shade800),
                                            overflow: TextOverflow.ellipsis,
                                            maxLines: 2,
                                          )
                                        ],
                                      ),

                                      /// ratings
                                      Padding(
                                        padding: const EdgeInsets.only(left: 16, top: 8),
                                        child: Row(
                                          children: [
                                            RatingStars(
                                              rating: 4.8,
                                              size: 16,
                                            ),
                                            SizedBox(width: 8),
                                            Text(4.8.toString())
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 12),
                            ],
                          ),
                          SizedBox(height: 32)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            /// Tabs, proceed to pay and wishlist or cart
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Column(
                  children: [
                    // Custom Tabs
                    Stack(
                      children: [

                        Positioned(
                          bottom: 0,
                          left: 40,
                          right: 40,
                          child: Container(
                            height: 3, // Adjust the height as needed
                            color:Color(0xFFe8f5e9),
                            child: Center(
                              child: Text(
                                'Positioned Widget',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),


                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Column(
                                children: [
                                  Text(
                                    'Menu',
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black,
                                    ),
                                  ),

                                  SizedBox(height: 6),

                                  // Bottom Indicator
                                  Container(
                                    width: Device_util.get_width(context)*0.3,
                                    height: 3,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(100),topRight: Radius.circular(100))
                                    ),

                                    // margin: EdgeInsets.only(left: MediaQuery.of(context).size.width / 4 * _selectedIndex), // 4. Adjust margin based on _selectedIndex
                                  ),

                                ],
                              ),
                            ),

                            /// when tapping on the reviews tab
                            Expanded(
                              flex: 1,
                              child: GestureDetector(
                                onTap: () {
                                  // Navigate to the Product_review screen
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Product_review(product_id: widget.product_id),
                                    ),
                                  );
                                },
                                child: Column(
                                  children: [
                                    Text(
                                      'Reviews',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black54,
                                      ),
                                    ),
                                    SizedBox(height: 6,)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),


                      ],
                    ),

                    // Bottom Indicator


                    // Tab Content
                    Expanded(
                      child: MenuTab(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
