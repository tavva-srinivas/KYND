import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kynd/features/home/Screens/homescreen_widgets/container_curveedges.dart';
import 'package:kynd/features/personalisation/screens/profile_screen.dart';
import 'package:kynd/features/personalisation/screens/widgets/section_heading.dart';
import 'package:kynd/features/personalisation/screens/widgets/settings_menu_tile.dart';
import 'package:kynd/utils/devices_utils/device_util.dart';


class Settings_screen extends StatelessWidget {

  static const String route_name = "/account-settings";

  const Settings_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
           children: [

             /// header
             primarycolor_container_with_curvededges(
               child: Column(
                  children: [

                    /// App bar
                    //  Custom_Appbar(title: Padding(
                    //    padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
                    //    child: Text("Account",style: Theme.of(context).textTheme.headlineLarge!.apply(color: Colors.white),),
                    //  ),),


                    SizedBox(height: Device_util.get_Appbar_height(),),


                    /// User profile card
                    Row(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8),
                          child: CircleAvatar(
                            radius: Device_util.get_height(context)*0.05,
                            backgroundImage: const AssetImage("assets/images/profile.jpg"), // Provide the image asset
                          ),
                        ),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Tavva Srinivas",style: Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.white),maxLines: 1,overflow: TextOverflow.ellipsis,),
                              Text("we_are_kind@gmail.com",style: Theme.of(context).textTheme.bodySmall!.apply(color: Colors.white.withOpacity(0.8)),)
                            ],
                          ),
                        ),

                         Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(onPressed: (){
                                  Navigator.pushNamed(context, Profile_screen.route_name);
                                }, icon: const Icon(Iconsax.edit,color: Colors.white,size: 28,))
                              ],
                            ),
                          ),
                      ],
                    ),


                    const SizedBox(height: 24,)


               ],
             ),),

             ///body
             Expanded(
               child: SingleChildScrollView(
                 child: Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 24),
                   child: Column(
                     children: [
                 
                       // Account settings
                       const Custom_section_heading(title: "Acount Settings",show_action_button: false),
                 
                       const SizedBox(height: 8,),
                 
                       const Settings_menu_tile(icon: Iconsax.safe_home , title: "My Addresses", sub_title: "Set delivery addresses"),
                       const Settings_menu_tile(icon: Iconsax.shopping_cart , title: "Whishlist", sub_title: "Add remove products and move to checkout"),
                       const Settings_menu_tile(icon: Iconsax.bag_tick , title: "My orders", sub_title: "In progress and completed orders"),
                       const Settings_menu_tile(icon: Iconsax.discount_shape , title: "My Coupons", sub_title: "List of all the discounted coupons"),
                       const Settings_menu_tile(icon: Iconsax.notification , title: "Notification", sub_title: "Set any kind of notification message"),
                       const Settings_menu_tile(icon: Iconsax.security_card , title: "Account Privacy", sub_title: "Manage data usage and connected accounts"),
                 
                       const SizedBox(height: 32,),
                 
                       /// App settings
                       const Custom_section_heading(title: "App Settings",show_action_button: false),
                 
                       const SizedBox(height: 8),
                 
                       Settings_menu_tile(icon: Iconsax.location, title: 'Geolocation', sub_title: "Set recommendations based on location",
                       trailing: Switch(value: true , onChanged: (value) {},),
                       ),
                 
                 
                       const SizedBox(height: 32),
                 
                       /// Logout
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 16),
                         child: SizedBox(
                           width: double.infinity,
                           child: OutlinedButton(onPressed: (){},style: OutlinedButton.styleFrom(
                             side: const BorderSide(color: Colors.red,width: 2)
                           ),child: Text("Logout",style: Theme.of(context).textTheme.headlineSmall!.apply(color: Colors.red),),),
                         ),
                       ),
                 
                       const SizedBox(height: 48)
                 
                 
                 
                 
                 
                 
                     ],
                   ),
                 ),
               ),
             ),

           ],

        ) ,
   
    );
  }
}
