import 'package:flutter/material.dart';

import '../../../utils/appbar.dart';
import '../../../widgets/product_card_horizontal.dart';

class Plan_screen extends StatelessWidget {
  static const String route_name = "/plan";

  const Plan_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  ListView(
        children: [
          Hor_plan_card(
            id: '1',
            name: 'High Protein',
            rating: 4.5,
            mealTime: 'Breakfast',
            price: '₹₹₹',
            images: ["assets/images/breakfast.jpg","assets/images/breakfast.jpg","assets/images/breakfast.jpg"],
            is_veg: true,
            // images: ['https://res.cloudinary.com/dczkxl7th/image/upload/v1715357133/1/oj51umownyl4gox1phkz.jpg','https://res.cloudinary.com/dczkxl7th/image/upload/v1715357133/1/oj51umownyl4gox1phkz.jpg','https://res.cloudinary.com/dczkxl7th/image/upload/v1715357133/1/oj51umownyl4gox1phkz.jpg','https://res.cloudinary.com/dczkxl7th/image/upload/v1715357133/1/oj51umownyl4gox1phkz.jpg','https://res.cloudinary.com/dczkxl7th/image/upload/v1715357133/1/oj51umownyl4gox1phkz.jpg'],
          ),
        ],
      ),
    );
  }
}

//       Scaffold(
//         appBar: Custom_Appbar(
//           title: Padding(
//             padding: const EdgeInsets.only(left: 16,top: 0),
//             child: Text("Plan",style: Theme.of(context).textTheme.headlineLarge,),
//           ),
//         ),
//
//         body:Container()
//     );
//   }
// }
