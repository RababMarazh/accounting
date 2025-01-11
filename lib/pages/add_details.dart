import 'package:accountiong/constants/colors.dart';
import 'package:accountiong/widget/button.dart';
import 'package:accountiong/widget/calender.dart';
import 'package:accountiong/widget/dynamicdropdown.dart';
import 'package:accountiong/widget/textform.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddDetails extends StatelessWidget {
  AddDetails({super.key});

  final TextEditingController sectionController = TextEditingController();
  final TextEditingController _controller = TextEditingController();
  final TextEditingController monyController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController notesController = TextEditingController();

  String? selectedPosition; // Variable to hold the selected position

  Future<void> addDataToFirebase(String? position, String formattedDate, int money, String name, String note) async {
    try {
      final serverTimestamp = DateTime.now();
      final createdAtFormatted = DateFormat('dd-MM-yyyy').format(serverTimestamp);

      // Add new position to the "position" collection
      await FirebaseFirestore.instance.collection('position').add({
        'position': position, // Save selected position
        'createdAt': createdAtFormatted,
        'selectedDate': formattedDate,
        'money': money,
        'name': name,
        'note': note
      });

      print("Data added to position collection successfully");

      // Retrieve and update the sum of money in dropdown_items
      await updateDropdownItemSum(position, money);

    } catch (error) {
      print("Failed to add data: $error");
    }
  }

  Future<void> updateDropdownItemSum(String? position, int moneyToAdd) async {
    try {
      // Fetch the existing dropdown item for the selected position
      final snapshot = await FirebaseFirestore.instance
          .collection('dropdown_items')
          .where('name', isEqualTo: position)
          .limit(1)
          .get();

      if (snapshot.docs.isNotEmpty) {
        final document = snapshot.docs.first;
        final currentSum = document['sum'] ?? 0; // Get current sum, default to 0 if not available

        // Calculate the new sum
        final newSum = currentSum + moneyToAdd;

        // Update the sum in the dropdown item
        await FirebaseFirestore.instance
            .collection('dropdown_items')
            .doc(document.id)
            .update({
          'sum': newSum, // Update the sum field with the new value
        });

        print("Dropdown item sum updated successfully");
      } else {
        // If the position does not exist in dropdown_items, create a new document
        await FirebaseFirestore.instance.collection('dropdown_items').add({
          'name': position,
          'sum': moneyToAdd, // Initialize sum with the money value
        });

        print("New dropdown item created and sum initialized");
      }
    } catch (error) {
      print("Failed to update sum: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    final DateController dateController = Get.put(DateController());

    return Scaffold(
      backgroundColor: light3,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text('لمسة للاعمال الهندسية', style: TextStyle(color: Colors.black, fontSize: 16)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 100, // Set width of the container to match the image size
                  height: 100, // Set height of the container to match the image size
                  decoration: BoxDecoration(
                    shape: BoxShape.circle, // Make the container circular (same as ClipOval)
                    border: Border.all(
                      color: secondery, // Set the border color
                      width: 3, // Set the border width
                    ),
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      'assets/imgs/lamsah2.jpg',
                      width: 100, // Image width
                      height: 100, // Image height
                      fit: BoxFit.cover, // Ensure the image scales to fill the circle
                    ),
                  ),
                ),
              ),
              Center(child: Text('لمسة للاعمال الهندسية', style: TextStyle(color: Colors.white, fontSize: 15))),
              Center(child: Text('LAMSAH FOR ENGINEERING WORKS', style: TextStyle(color: Colors.white, fontSize: 15))),

              SizedBox(height: 60),
              DatePickerTextFormField(controller: _controller),
              textFormLogin(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                suffixIcon: Icons.money,
                controller: monyController,
                lable: "المبلغ بالدينار ",
                textInputType: TextInputType.number,
                validate: (value) {
                  if (value.isEmpty) return "ادخل البيانات المطلوبة";
                  if (int.tryParse(value) == null) return "يرجى إدخال رقم صحيح";
                  return null;
                },
              ),
              textFormLogin(
                suffixIcon: Icons.person_2_outlined,
                controller: nameController,
                lable: "الجهه المستلمة",
                textInputType: TextInputType.name,
                validate: (value) {
                  if (value.isEmpty) return "ادخل البيانات المطلوبة";
                  return null;
                },
              ),
              textFormLogin(
                suffixIcon: Icons.note_add_outlined,
                controller: notesController,
                lable: "التفاصيل",
                textInputType: TextInputType.name,
                validate: (value) {
                  if (value.isEmpty) return "ادخل البيانات المطلوبة";
                  return null;
                },
              ),
              DynamicDropdown(
                onSelected: (value) {
                  selectedPosition = value; // Capture the selected position
                },
              ),
              Button(
                text: 'إضافة',
                color: mainColor,
                function: () {
                  final moneyText = monyController.text.trim();
                  final name = nameController.text.trim();
                  final note = notesController.text.trim();
                  final selectedDate = dateController.selectedDate.value;

                  if (selectedPosition != null && int.tryParse(moneyText) != null) {
                    final money = int.parse(moneyText);
                    final formattedDate = DateFormat('dd-MM-yyyy').format(selectedDate);

                    addDataToFirebase(selectedPosition, formattedDate, money, name, note);

                    sectionController.clear();
                    monyController.clear();
                    nameController.clear();
                    notesController.clear();
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('الرجاء ادخال جميع المعلومات',style: TextStyle(color: Colors.white),),
                        backgroundColor: const Color.fromARGB(255, 118, 9, 1),
                      ),
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
