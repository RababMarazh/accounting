
// Controller to manage the selected date
import 'package:accountiong/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DateController extends GetxController {
  var selectedDate = DateTime.now().obs;  // Observable selected date
}

class DatePickerTextFormField extends StatelessWidget {
  final TextEditingController controller;

  DatePickerTextFormField({Key? key, required this.controller}) : super(key: key);

Future<void> _selectDate(BuildContext context) async {
  final DateController dateController = Get.find(); // Get the controller

  final DateTime currentDate = DateTime.now();
  final DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: dateController.selectedDate.value, // Use the controller's selected date
    firstDate: DateTime(1900),
    lastDate: DateTime(2100),
    builder: (BuildContext context, Widget? child) {
      return Theme(
        data: ThemeData.light().copyWith(
          primaryColor: mainColor, // Header background color
          colorScheme: ColorScheme.light(
            surface: light3,
            primary: mainColor, // Selection color
            onPrimary: secondery, // Text color on header
             onSurface: const Color.fromARGB(255, 179, 153, 4),  // Text color in body
          ),
          dialogBackgroundColor: light1, // Background color of the calendar
        ),
        child: child!,
      );
    },
  );

  if (pickedDate != null && pickedDate != dateController.selectedDate.value) {
    // Update the selected date in the controller
    dateController.selectedDate.value = pickedDate;
    controller.text = "${pickedDate.toLocal()}".split(' ')[0]; // Format date and update TextField
  }
}


  @override
  Widget build(BuildContext context) {
    final DateController dateController = Get.put(DateController());

    return GestureDetector(
      onTap: () => _selectDate(context),  // Open date picker on tap
      child: AbsorbPointer(  // Prevent keyboard from opening when tapping the TextFormField
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
             labelText: "ادخل التاريخ",
             labelStyle: TextStyle(
              color: Colors.black, fontWeight: FontWeight.normal, fontSize: 12),
             // hintText: "Pick a date",
                border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(10), // Adjust the border radius here
            borderSide: BorderSide(color: Colors.black),
          ),
            
          focusedBorder: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(10), // Adjust the border radius here
            borderSide: BorderSide(color: mainColor),
          ),
              filled: true,
              fillColor: Colors.white,
              suffixIcon: Icon(Icons.calendar_today,color: mainColor,),
              //border: OutlineInputBorder(),
              contentPadding: EdgeInsets.all(12),
            ),
          ),
        ),
      ),
    );
  }
}