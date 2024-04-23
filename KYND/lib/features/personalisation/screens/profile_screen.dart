import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kynd/utils/appbar.dart';
import 'package:kynd/utils/constants/colors.dart';

class Profile_screen extends StatelessWidget {
  static const String route_name = "/profile";
   Profile_screen({super.key});

  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color.fromRGBO(230, 240, 248, 1.0),
      // Color.fromRGBO(220, 240, 248, 1.0),
       appBar: Custom_Appbar(
         show_backarrow: true,
         title: Text("Profile",style: Theme.of(context).textTheme.headlineMedium,) ,
       ),

      /// ---> body
      body: SingleChildScrollView(
        child: Column(
        
          children: [
            const SizedBox(height: 10,),
        
            ClipPath(
              clipper: profile_clipper(),
              child: Container(
                width: double.infinity,
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color:Colors.white,
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 14,),
                    Stack(
                      children : [
                        const CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage('assets/images/profile.jpg'), // Image asset
                        backgroundColor: Colors.white, // Set color inside the circle
                      ),
                        
                        /// edit profile option
                        Positioned(
                          right: 0,
                            bottom: 0,
                            child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: Custom_colors.soft_grey,
                                     border: Border.all(color: Custom_colors.grey)
                                  ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Center(child: Icon(Iconsax.edit,color: Custom_colors.dark_grey,)),
                                ),)
                        )
                ]
                    ),
        
                    const SizedBox(height: 16,),
        
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Name',
                                contentPadding: EdgeInsets.symmetric(vertical: 12.0,horizontal: 12),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value == null) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Email',
                                contentPadding: EdgeInsets.symmetric(vertical: 12.0,horizontal: 12),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value == null) {
                                  return 'Please enter your email';
                                }
                                // Additional email validation logic can be added here
                                return null;
                              },
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Phone Number',
                                contentPadding: EdgeInsets.symmetric(vertical: 12.0,horizontal: 12),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value == null) {
                                  return 'Please enter your phone number';
                                }
                                // Additional phone number validation logic can be added here
                                return null;
                              },
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Address',
                                contentPadding: EdgeInsets.symmetric(vertical: 12.0,horizontal: 12),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              validator: (value) {
                                if (value == null) {
                                  return 'Please enter your address';
                                }
                                return null;
                              },
                            ),
                            const SizedBox(height: 20.0),
                            TextFormField(
                              decoration: const InputDecoration(
                                labelText: 'Gender',
                                contentPadding: EdgeInsets.symmetric(vertical: 12.0,horizontal: 12),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              obscureText: true,
                              validator: (value) {
                                if (value == null) {
                                  return 'Select your gender';
                                }
                                return null;
                              },
                            ),
        
                            const SizedBox(height: 48.0),
        
        
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {


                                    }
                                  },
                                  child: const Text('Save changes'),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16,)
                          ],
                        ),
                      ),
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


class profile_clipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, 90);
    // path.quadraticBezierTo(0, 50, 30, 50);
    path.lineTo(size.width*1.5/5 - 30 , 90);

    path.quadraticBezierTo(size.width *1.5/5 - 5 , 80 , size.width *1.5/5, 70);

    path.quadraticBezierTo(size.width *1/2 , - 15 , size.width * 3.5/5, 70);

    path.quadraticBezierTo(size.width *3.5/5 + 5 , 80 , size.width *3.5/5+ 30, 90);

    // path.quadraticBezierTo(size.width *3.5/5 - 20 , 40 + 20 , size.width * 3.5/5, 110);

    // path.lineTo( size.width/2 , 0);
    path.lineTo(size.width, 90);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }

}