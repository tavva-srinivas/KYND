import 'package:flutter/material.dart';

import '../../../utils/appbar.dart';
import '../../../widgets/product_card_horizontal.dart';

class Plan_screen extends StatelessWidget {
  static const String route_name = "/plan";

  const Plan_screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Zomato-like Food Card')),
      body: ListView(
        children: [
          FoodCard(
            imageUrl: 'https://via.placeholder.com/400',
            name: 'The Best Restaurant',
            rating: 4.5,
            cuisine: 'Italian',
            priceRange: '₹₹₹',
            location: '123 Main St',
          ),
          FoodCard(
            imageUrl: 'https://via.placeholder.com/400',
            name: 'Another Restaurant',
            rating: 4.0,
            cuisine: 'Chinese',
            priceRange: '₹₹',
            location: '456 Elm St',
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
