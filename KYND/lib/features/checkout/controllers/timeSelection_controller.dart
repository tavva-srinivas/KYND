import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TimeSelectionController extends GetxController {
  // for date selection
  var dates = <DateTime>[].obs;
  var selectedDate = Rxn<int>();

// for time selection
  final List<String> timeSlots = [
    "7:30 AM", "8:00 AM", "8:30 AM", "9:00 AM", "9:30 AM", "10:00 AM",
    "10:30 AM", "11:00 AM"];
  var selectedTime = Rxn<int>();

  // for the specific cooking instructions
  var textController = TextEditingController().obs;

  @override
  void onInit() {
    super.onInit();
    calculateNextSevenDays();
  }

  /// meathods for picking the date

  void calculateNextSevenDays() {
    final now = DateTime.now();
    dates.clear();

    for (int i = 1; i <= 7; i++) {
      dates.add(now.add(Duration(days: i)));
    }
  }

  String formatDay(DateTime date) {
    return DateFormat.E().format(date); // e.g., Mon, Tue
  }

  String formatDate(DateTime date) {
    return DateFormat('d').format(date); // Day of the month (e.g., 15)
  }

  String formatMonth(DateTime date) {
    return DateFormat('MMM').format(date); // Month abbreviation (e.g., Jun)
  }



  /// for selecing the appropriate time

  // Function to parse the string into DateTime
  TimeOfDay parseTime(String timeString) {
    // Define the format of the input string
    final format = DateFormat('h:mm a');
    final dateTime = format.parse(timeString);
    return TimeOfDay(hour: dateTime.hour, minute: dateTime.minute);
  }



  /// for the specific cooking instructions

  void addText(String text) {
    final currentText = textController.value.text;
    if (currentText.isEmpty) {
      textController.value.text = text;
    } else {
      textController.value.text = '$currentText\n$text';
    }
  }

}





// var selectedTime = TimeOfDay(hour: 8, minute: 15).obs;
// var selectedDate = DateTime.now().obs;
//
//
// Future<void> selectTime(BuildContext context) async {
//   final TimeOfDay? picked = await showTimePicker(
//     context: context,
//     initialTime: selectedTime.value,
//   );
//   if (picked != null && picked != selectedTime.value) {
//     selectedTime.value = picked;
//   }
// }
//
// Future<void> selectDate(BuildContext context) async {
//   final DateTime? picked = await showDatePicker(
//     context: context,
//     initialDate: selectedDate.value,
//     firstDate: DateTime.now(),
//     lastDate: DateTime(2101),
//   );
//   if (picked != null && picked != selectedDate.value) {
//     selectedDate.value = picked;
//   }
// }