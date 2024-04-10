import 'dart:convert';

import 'package:http/http.dart' as http;

class Http_helper{

  static const String base_url = "http://";

  // for get request
  static Future<Map<String,dynamic>> get(String endpoint) async{
    final response = await http.get(Uri.parse('$base_url/$endpoint'));
    return _handleResponse(response);
  }

  // for post request
   static Future<Map<String,dynamic>> post(String endpoint,dynamic data) async{
    final response = await http.post(
      Uri.parse('$base_url/$endpoint'),
        headers: {"Content-Type":"application/json"},
        body: jsonEncode(data),
    );
    return _handleResponse(response);
   }


   // for put request
  static Future<Map<String,dynamic>> put(String endpoint,dynamic data) async{
    final response = await http.put(
      Uri.parse('$base_url/$endpoint'),
      headers: {"Content-Type":"application/json"},
      body: jsonEncode(data),
    );
    return _handleResponse(response);
  }



  // To delete
  static Future<Map<String,dynamic>> delete(String endpoint) async{
    final response = await http.post(Uri.parse('$base_url/$endpoint'));
    return _handleResponse(response);
  }


  // Handle HTTP response
  static Map<String,dynamic> _handleResponse(http.Response response){
    if(response.statusCode == 200){
      return json.decode(response.body);
    }else{
      print("Error in http request in http_request.dart ");
      throw Exception('Failed to load data : ${response.statusCode}');
    }
  }


}