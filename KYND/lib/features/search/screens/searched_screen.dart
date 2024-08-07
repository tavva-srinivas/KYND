import 'package:flutter/material.dart';

class Searched_screen extends StatelessWidget {
  static const String route_name = '/searched_screen';
  const Searched_screen({super.key, required this.search_str});

  final String search_str;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,  // This removes the default back arrow
        backgroundColor: Colors.indigoAccent,
        elevation: 10,
        title: SizedBox(
          height: kToolbarHeight*0.8,
          child: TextField(
            decoration: InputDecoration(
              hintText: search_str,
              hintStyle: Theme.of(context).textTheme.bodyLarge,
              prefixIcon: IconButton(
                icon: Icon(Icons.arrow_back_ios_new_sharp, color: Colors.indigoAccent),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              filled: true,
              fillColor: Colors.white,
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10), // Adjust padding
            ),
            onTap: (){
              // Navigator.  
            },

          ),
        ),
      ),

      body: Center(
        child: Text('Search results for "$search_str" will be displayed here.'),
      ),
    );
  }
}
