import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:kynd/bottom_nav.dart';
import 'package:kynd/features/auth/Screens/signup.dart';
import 'package:kynd/features/auth/services/auth_service.dart';

class form_signincreateaccount extends StatelessWidget {
  final TextEditingController email_controller;
  final TextEditingController password_controller;
  final GlobalKey<FormState> form_key;
  const form_signincreateaccount({super.key,
    required this.email_controller,
    required this.password_controller,
    required this.form_key
  });

  String? validator(String val,labelText){
    if(val.isEmpty){ return "Enter your $labelText"; }
    else {
      return null;
    }
  }


  @override
  Widget build(BuildContext context) {
    return Form(
      key: form_key,
        child: Column(
          children: [

          TextFormField(
            controller: email_controller,
            validator: (stringText) => validator(stringText!,"E-Mail"),
            decoration: const InputDecoration(prefixIcon: Icon(Iconsax.direct_right), labelText: "E-Mail"),
         ),

          const SizedBox(height: 16,),

           TextFormField(
             controller: password_controller,
             validator: (stringText) => validator(stringText!,"Password"),
             decoration: const InputDecoration(prefixIcon: Icon(Iconsax.password_check),labelText: "Password",suffixIcon: Icon(Iconsax.eye_slash)),
        ),

            const SizedBox(height: 4,),

        // Remember me and forget password

         Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Remember me -> checkbox and text
            Row(
              children: [
                Checkbox(value: true, onChanged: (value){}),
                Text("Remember me",style: Theme.of(context).textTheme.bodySmall,),
              ],
            ),

            // Forget password
            TextButton(onPressed: (){}, child: Text("Forget Password",style: Theme.of(context).textTheme.bodySmall))
          ],
        ),

        const SizedBox(height: 32,),


        // SignIn button
        SizedBox(width: double.infinity,child: ElevatedButton(onPressed: (){
          print("pressed on signin ${email_controller.text}");
          if(form_key.currentState!.validate()){
            Auth_service.signin_user(context: context, email: email_controller.text, password: password_controller.text).then((value) => Navigator.pushNamedAndRemoveUntil(context,Bottom_nav.route_name, (route) => false));

          }
        },child: const Text("Sign-In"),),),

        const SizedBox(height: 16,),


        SizedBox(width: double.infinity,child: OutlinedButton(onPressed: (){Navigator.pushNamed(context,SignUp_screen.route_name);},style: Theme.of(context).outlinedButtonTheme.style, child: const Text("Create Account")),),

      ],

    ));
  }
}