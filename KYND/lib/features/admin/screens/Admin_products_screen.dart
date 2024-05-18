import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kynd/features/admin/services/admin_services.dart';
import 'package:kynd/utils/appbar.dart';
import 'package:kynd/utils/devices_utils/device_util.dart';
import 'package:kynd/widgets/loading.dart';
import 'package:lottie/lottie.dart';

import '../../../Getx controllers/User_controller.dart';
import '../../../widgets/helper_to_product_card/Grid_layout.dart';
import '../../../widgets/product_card_vertical.dart';
import '../admin_controller/admin_products_controller.dart';
import '../models/product.dart';
import 'helper_to_screens/add_products_screen.dart';

class Admin_products extends StatelessWidget {



  Admin_products({Key? key}) : super(key: key) {}

  final User_provider user_provider = Get.put(User_provider());
  final Admin_product_controller prod_controller = Get.put(Admin_product_controller());


  void _getProducts(BuildContext context) async {
    try {
      prod_controller.isLoading.value = true;
      List<Product> products = await Admin_services.get_products(context: context);
      prod_controller.setProducts(products);
    } catch (error) {
      // Handle error
      print("Error fetching products: $error");
    }
  }



  @override
  Widget build(BuildContext context) {


    _getProducts(context);



    return Scaffold(
      appBar: Custom_Appbar(
        back_color: Colors.indigoAccent,
        title: Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Hello  ',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .apply(color: Colors.white),
                    ),
                    TextSpan(
                        text: user_provider.user.name,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .apply(color: Colors.white)),
                  ],
                ),
              ),

              /// admin-------
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Text(
                  "ADMIN",
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .apply(color: Colors.white),
                ),
              )
            ],
          ),
        ),
      ),
      body: Obx(() {
        if (prod_controller.isLoading.value) {
          return Loading();
        } else {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: gridlayout(
                item_count: prod_controller.myProducts!.length,
                item_builder: (context, index) => Product_card_vertical(
                  icon: Icons.delete_outline_sharp,
                  price: prod_controller.myProducts![index].price,
                  name: prod_controller.myProducts![index].name,
                  image: prod_controller.myProducts![index].images[0],
                  id: prod_controller.myProducts![index].id!,
                ),
                main_axis_extent: Device_util.get_height(context) * 0.35,
              ),
            ),
          );
        }
      }),

      /// floating button --> add product
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Add_product_screen.route_name);
        },
        child: Icon(
          Icons.add_outlined,
          color: Colors.white,
        ),
        shape: CircleBorder(),
        backgroundColor: Colors.indigoAccent,
        // on long press we will get the functionality
        tooltip: "Add a product",
      ),
    );
  }


}




