import 'package:flutter/material.dart';
import 'package:kynd/features/admin/screens/helper_to_screens/add_product_screen.dart';
import 'package:kynd/utils/appbar.dart';

import 'helper_to_screens/add_products_screen.dart';


class Admin_products extends StatelessWidget {
  const Admin_products({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Custom_Appbar(back_color: Colors.pinkAccent.shade200,
        title: Padding(
          padding: const EdgeInsets.only(left: 24.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:[
              RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(
                    text: 'Hello  ',
                    style:  Theme.of(context).textTheme.titleLarge!.apply(color: Colors.white),
                  ),
                  TextSpan(
                    text: 'Srinivas,',
                    style: Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.white)
                  ),
                ],
              ),
            ),

              /// admin-------
              Padding(
                padding: const EdgeInsets.only(right: 24),
                child: Text("ADMIN",style: Theme.of(context).textTheme.headlineMedium!.apply(color: Colors.white),),
              )
      ]
          ),
        )
      ),
      body: Center(
        child: Text("admin_products"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Add_product_screen.route_name);
        },
        child: Icon(Icons.add_outlined) ,
        shape: CircleBorder( ),
        backgroundColor: Color(0xFFFCB5AC),
        // on long press we will get the functionality
        tooltip: "Add a product",
      ),
    );
  }
}
