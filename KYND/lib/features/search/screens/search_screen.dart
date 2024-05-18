import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kynd/features/search/models/product_search_summary.dart';
import 'package:kynd/features/search/screens/searched_screen.dart';
import 'package:kynd/features/search/services/search_services.dart';

class Search_screen extends StatefulWidget {
  static const String route_name = '/search';
  Search_screen({super.key});

  @override
  State<Search_screen> createState() => _Search_screenState();
}

class _Search_screenState extends State<Search_screen> {


  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  Timer? _debounce;
  List<Product_summary> _searchResults = [];

  @override
  void initState() {
    super.initState();
    // Automatically focus the search bar
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FocusScope.of(context).requestFocus(_focusNode);
    });
    _onSearchChanged("");
  }

  @override
  void dispose() {
    _searchController.dispose();
    _focusNode.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  void _onSearchChanged(String searchStr) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 600), () async {
      // Make your API call here
      try {
        var results = await Search_services.get_search_products(context: context, search: searchStr);
        setState(() {
          _searchResults = results;
        });
      } catch (e) {
        // Handle error
        print('Error fetching search results: $e');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Container(
          height: 44,
          child: TextField(
            focusNode: _focusNode,
            controller: _searchController,
            onSubmitted: (String search_str) {
              // TODO: implementation when pressing enter in the search screen
              print('Enter pressed: $search_str');
              Navigator.pushNamed(context, Searched_screen.route_name,arguments: search_str);
            },
            onChanged: (String searchStr) async {
              _onSearchChanged(searchStr);
            },
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: Theme.of(context).textTheme.bodyText2,
              prefixIcon: Icon(Icons.search, color: Colors.indigoAccent),
              suffixIcon: IconButton(
                icon: Icon(Icons.clear_rounded, color: Colors.grey),
                onPressed: () {
                  _searchController.clear();
                  _onSearchChanged("");
                },
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(color: Colors.indigoAccent, width: 1.5), // Blue outline color
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(color: Colors.indigoAccent, width: 1.5), // Blue outline color
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(color: Colors.indigoAccent, width: 1.5), // Blue outline color when focused
              ),
              filled: true,
              fillColor: Colors.grey.shade100,
              contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10), // Adjust padding
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              itemCount: _searchResults.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_searchResults[index].name, style: Theme.of(context).textTheme.titleMedium),
                  leading: Icon(Icons.arrow_drop_up_sharp, color: Colors.grey),  // Use Icons here
                  onTap: () {
                    // Handle search item tap
                  },
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  height: 1,
                  thickness: 1,
                  color: Colors.grey[300],
                  indent: 0,
                  endIndent: 0,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
