
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kynd/features/home/Screens/categories.dart';
import 'package:kynd/features/home/Screens/homescreen_widgets/circular_container.dart';
import 'package:kynd/utils/devices_utils/device_util.dart';
import '../../../Getx controllers/User_controller.dart';
import '../../../widgets/helper_to_product_card/Grid_layout.dart';
import '../../../widgets/product_card_vertical.dart';
import '../../auth/Model/user.dart';
import 'homescreen_widgets/carousel_slider.dart';
import 'homescreen_widgets/container_curveedges.dart';
import 'homescreen_widgets/home_appbar.dart';
import 'homescreen_widgets/home_searchbar.dart';




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


    return Scaffold(
      body: SingleChildScrollView(
        // physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            primarycolor_container_with_curvededges(
              child: Column(
                children: [

                  // App bar
                  const home_appbar(),

                  // Seach bar
                  const home_searchbar(),

                  // // Categories
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     children: [
                  //       Text("Popular Categories",style: Theme.of(context).textTheme.headlineSmall!.apply(color: Colors.white),),
                  //       const SizedBox(height: 10,),
                  //       Row(
                  //         children: [
                  //           for(int i = 0;i<3;i++)
                  //             const Custom_container(width: 50,height: 50,radius: 40,margin_right: 16,background_color: Colors.white,)
                  //         ],
                  //       )
                  //     ],
                  //   ),
                  // ),

                  const SizedBox(height: 24,),

                ],
              )
            ),

            /// Categories
            SizedBox(
              height: Device_util.get_height(context)*0.08,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: tags.length,
                itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(8.0),
                  child: GestureDetector (
                    onTap: () {
                      /// going to the categories screen
                      Navigator.pushNamed(context, Category_screen.route_name,
                          arguments: tags[index]);
                    },
                    child: Chip(
                      label: Text(tags[index]),
                      backgroundColor: Colors.indigoAccent.shade200,
                      labelStyle: TextStyle(color: Colors.white),
                                  ),
                  ),
                  );}),
            ),

            const SizedBox(height: 16,),



            // latest and trendy deals ( for network images is_networkimage = true should be done)
            const corousel_slider(banners: ["assets/images/profile.jpg",
                "assets/images/profile.jpg",
                "assets/images/profile.jpg"]),

            SizedBox(height: 24,),

            gridlayout(item_count : 4,item_builder: (context,index) => Product_card_vertical(price: 1000, name: 'iphone', image: 'need to k', id:" "),main_axis_extent:Device_util.get_height(context)*0.365,),


            SizedBox(height: 200,)












          ],
        )
      ),
    );
  }
}

