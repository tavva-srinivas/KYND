
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kynd/features/home/Screens/homescreen_widgets/circular_container.dart';
import '../../../Getx controllers/provider.dart';
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
  
  
  @override
  Widget build(BuildContext context) {
    
    final User_provider userProvider = Get.put(User_provider());

    // Get the user object from the UserProvider( using get function)
    User user = userProvider.user;

    
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            primarycolor_container_with_curvededges(
              child: Column(
                children: [

                  // App bar
                  const home_appbar(),

                  // Seach bar
                  const home_searchbar(),

                  // Categories
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Popular Categories",style: Theme.of(context).textTheme.headlineSmall!.apply(color: Colors.white),),
                        const SizedBox(height: 10,),
                        Row(
                          children: [
                            for(int i = 0;i<3;i++)
                              const Custom_container(width: 50,height: 50,radius: 40,margin_right: 16,background_color: Colors.white,)
                          ],
                        )
                      ],
                    ),
                  ),

                  const SizedBox(height: 30,),

                ],
              )
            ),

            const SizedBox(height: 16,),

            // latest and trendy deals ( for network images is_networkimage = true should be done)
            const corousel_slider(banners: ["assets/images/profile.jpg",
                "assets/images/profile.jpg",
                "assets/images/profile.jpg"]),












          ],
        )
      ),
    );
  }
}



