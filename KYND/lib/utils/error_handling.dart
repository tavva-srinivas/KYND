import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:kynd/utils/devices_utils/device_util.dart';

// fun() --> positional arguments
// fun({}) --> named arguments as well as default arguments can ke kept
void http_error_handling({required http.Response res,required BuildContext context,required VoidCallback on_success}){
     switch(res.statusCode){
          case 200: on_success(); break;

          case 500:break;

          // Client error : used registered email for registration
          case 400: Device_util.showSnackbar(context,jsonDecode(res.body)["msg"]);
          break;

          // authentication error --> wrong password
          case 401: Device_util.showSnackbar(context,jsonDecode(res.body)["error"]);
          break;

          default: Device_util.showSnackbar(context, res.body);

     }
}


