import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:kynd/features/home/controllers.home/category_prod_controller.dart';
import 'package:kynd/features/home/services/home_services.dart';
import 'package:kynd/features/personalisation/screens/widgets/section_heading.dart';
import 'package:kynd/utils/appbar.dart';
import 'package:kynd/utils/devices_utils/device_util.dart';
import 'package:kynd/widgets/helper_to_product_card/Grid_layout.dart';

import '../../../Getx controllers/User_controller.dart';
import '../../../widgets/loading.dart';
import '../../../widgets/product_card_vertical.dart';
import '../../admin/models/product.dart';

class Category_screen extends StatelessWidget {
  static const route_name = "/category-deals";


  Category_screen({super.key,
    required this.category
  });

  final String category;

  final Category_prod_controller prod_controller = Get.put(Category_prod_controller());
  final User_provider user_provider = Get.put(User_provider());


  void _getProducts(BuildContext context) async {
    try {
      prod_controller.isLoading.value = true;
      List<Product> products = await Home_services.get_category_prod(context: context, category: category);
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
            title: Text(category, style: Theme.of(context).textTheme.headlineMedium,),
            show_backarrow: true,
            ),
        body: Obx(() {
          if (prod_controller.isLoading.value) {
            return Loading();
          } else {
            return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: gridlayout(
                    cross_axis_count: 1,
                    item_count: prod_controller.category_products!.length,
                    item_builder: (context, index) =>
                        Product_card_vertical(
                          icon: Icons.add_outlined,
                          price: prod_controller.category_products![index]
                              .price,
                          name: prod_controller.category_products![index]
                              .name,
                          image: prod_controller.category_products![index]
                              .images[0],
                          id: prod_controller.category_products![index].id!,

                        ),
                    main_axis_extent: Device_util.get_height(context) * 0.35,
                  ),
                )
            );
          }
        }
        )
    );
  }
}



// GridView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: 10,
//                   main_axis_extent: Device_util.get_height(context) * 0.35,
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 1 , childAspectRatio: 1.4 , mainAxisSpacing: 12),
//                   itemBuilder: (context,index) {
//                     return Product_card_vertical(
//                       icon: Icons.add_outlined,
//                       price: prod_controller.category_products![index].price,
//                       name: prod_controller.category_products![index].name,
//                       image: prod_controller.category_products![index].images[0],
//                       id: prod_controller.category_products![index].id!,
//                     );
//                   }),
