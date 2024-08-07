import 'package:flutter/material.dart';
import 'package:kynd/features/auth/Screens/login_widgets/divider.dart';
import 'package:kynd/features/auth/Screens/login_widgets/google_facebook.dart';
import 'package:kynd/features/auth/Screens/signup_widgets/form.dart';
import 'package:kynd/features/auth/Screens/signup_widgets/terms_and_conditions.dart';
import 'package:kynd/features/auth/services/auth_service.dart';
import 'package:kynd/utils/devices_utils/device_util.dart';

import '../../Onboarding/screens/Onboard_screen.dart';


class SignUp_screen extends StatefulWidget {
  static const String route_name = "/signup";

  const SignUp_screen({super.key});

  @override
  State<SignUp_screen> createState() => _SignUp_screenState();
}

class _SignUp_screenState extends State<SignUp_screen> {

  // controllers
  final TextEditingController _firstname_controller = TextEditingController();
  final TextEditingController _secondname_controller = TextEditingController();
  final TextEditingController _address_controller = TextEditingController();
  final TextEditingController _phonenumber_controller = TextEditingController();
  final TextEditingController _email_controller = TextEditingController();
  final TextEditingController _password_controller = TextEditingController();

  // Form key for validation
  final GlobalKey<FormState> _signup_formkey = GlobalKey<FormState>();

  // for api post request
  final Auth_service auth_service = Auth_service();

  @override
  void dispose() {
    super.dispose();
    _firstname_controller.dispose();
    _secondname_controller.dispose();
    _address_controller.dispose();
    _phonenumber_controller.dispose();
    _email_controller.dispose();
    _password_controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool dark = Device_util.is_dark_mode(context);
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title
              Text(
                "Let's create your account",
                style: Theme.of(context).textTheme.headlineSmall,
              ),

              const SizedBox(
                height: 24,
              ),

              signup_form(firstname_controller: _firstname_controller, secondname_controller: _secondname_controller, address_controller: _address_controller, phonenumber_controller: _phonenumber_controller, email_controller: _email_controller, password_controller: _password_controller, signup_formkey: _signup_formkey),

              // Terms and conditions
              const signup_t_and_c(),

              const SizedBox(height: 24),

             // create account button
              SizedBox(width : double.infinity, child: ElevatedButton(onPressed: (){

                if(_signup_formkey.currentState!.validate()){
               Auth_service.signup_user(context: context, first_name: _firstname_controller.text, last_name: _secondname_controller.text, phone_number: _phonenumber_controller.text, address: _address_controller.text, email: _email_controller.text, password: _password_controller.text);
              }
         },
                child: const Text("Create Account"),),),
              
              
              const SizedBox(height: 24,),

              login_divider(dark: dark, divider_text: "or signup using"),

              const SizedBox(height: 16,),

              const login_googlefacebook()
            ],
          ),
        ),
      ),
    );
  }
}

