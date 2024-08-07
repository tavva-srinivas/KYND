import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kynd/features/home/Screens/categories.dart';
import 'package:kynd/features/home/Screens/homescreen_widgets/circular_container.dart';
import 'package:kynd/utils/devices_utils/device_util.dart';
import '../../../Getx controllers/User_controller.dart';
import '../../../utils/constants/colors.dart';
import '../../../widgets/helper_to_product_card/Grid_layout.dart';
import '../../../widgets/product_card_vertical.dart';
import '../../auth/Model/user.dart';
import 'homescreen_widgets/carousel_slider.dart';
import 'homescreen_widgets/container_curveedges.dart';
import 'homescreen_widgets/home_appbar.dart';
import 'homescreen_widgets/home_searchbar.dart';
import 'package:badges/badges.dart' as badges;

class Home_Screen extends StatefulWidget {
  static const String route_name = '/home';
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  final List<String> tags = ['Breakfast', 'Juice', 'Chocolate', 'Dinner', 'Lunch'];

  @override
  Widget build(BuildContext context) {
    final User_provider userProvider = Get.put(User_provider());

    // Get the user object from the UserProvider( using get function)
    User user = userProvider.user;
    Device_util.set_status_bar_color(Custom_colors.primary);



    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              pinned: true,
              snap: false,
              backgroundColor: Colors.transparent,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: primarycolor_container_with_curvededges(
                  child: Column(
                    children: [
                      home_appbar(
                        sub_heading: 'Suryaraopet Vijayawada',
                        heading: 'Moghalrajpuram',
                        icons: [
                          IconButton(
                            onPressed: () {},
                            icon: const badges.Badge(
                              badgeContent: Text(
                                '12',
                                style: TextStyle(fontSize: 14),
                              ),
                              badgeStyle: badges.BadgeStyle(
                                badgeColor: Colors.white,
                                padding: EdgeInsets.all(1),
                              ),
                              child: Icon(
                                Iconsax.notification,
                                color: Colors.white,
                                size: 24,
                              ), // Change here
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Iconsax.note,
                              color: Colors.white,
                              size: 24,
                            ), // Change here
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(Device_util.get_height(context)*0.12),
                child: Padding(
                  padding:  EdgeInsets.only(bottom:Device_util.get_height(context)*0.03),
                  child: const home_searchbar(),
                ),
              ),
        
            ),
            SliverToBoxAdapter(
              child: SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Categories
                    SizedBox(
                      height: Device_util.get_height(context) * 0.08,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: tags.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                // Going to the categories screen
                                Navigator.pushNamed(
                                  context,
                                  Category_screen.route_name,
                                  arguments: tags[index],
                                );
                              },
                              child: Chip(
                                label: Text(tags[index]),
                                backgroundColor: Colors.indigoAccent.shade200,
                                labelStyle: TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 16),
                
                    // Latest and trendy deals (for network images is_networkimage = true should be done)
                    const corousel_slider(
                      banners: [
                        "assets/images/profile.jpg",
                        "assets/images/profile.jpg",
                        "assets/images/profile.jpg"
                      ],
                    ),
                
                    SizedBox(height: 24),
                
                    gridlayout(
                      item_count: 4,
                      item_builder: (context, index) => Product_card_vertical(
                        price: 1000,
                        name: 'iphone',
                        image: 'need to k',
                        id: " ",
                      ),
                      main_axis_extent: Device_util.get_height(context) * 0.36,
                    ),
                
                    SizedBox(height: 200),
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
