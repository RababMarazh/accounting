import 'package:accountiong/constants/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DynamicDropdown extends StatefulWidget {
  final ValueChanged<String?> onSelected;
  DynamicDropdown({required this.onSelected});

  @override
  _DynamicDropdownState createState() => _DynamicDropdownState();
}

class _DynamicDropdownState extends State<DynamicDropdown> {
  final List<String> _dropdownItems = [];
  String? _selectedItem;

  final TextEditingController _newItemController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadDropdownItems(); // Load items from Firebase
  }

  // Function to load items from Firebase collection
  void _loadDropdownItems() async {
    final snapshot = await FirebaseFirestore.instance.collection('dropdown_items').get();
    setState(() {
      _dropdownItems.clear();
      _dropdownItems.addAll(snapshot.docs.map((doc) => doc['name'] as String));
    });
  }

  // Function to reset the selected item
  void _resetDropdown() {
    setState(() {
      _selectedItem = null;
    });
  }

  // Function to add a new item to the dropdown
void _addItem() async {
  if (_newItemController.text.isNotEmpty) {
    final newItem = _newItemController.text;

    // Format the current date as dd_MM_yyyy
    String formattedDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

    await FirebaseFirestore.instance.collection('dropdown_items').add({
      'name': newItem,
      'createdAt': formattedDate, 
      'sum':0
       // Save the formatted date as a string
    });

    _newItemController.clear(); // Clear the input field after adding
    Navigator.pop(context); // Close the dialog
  }
}



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Dropdown for selecting position
          DropdownButtonFormField<String>(
            iconDisabledColor: mainColor,
            iconEnabledColor: mainColor,
            style: TextStyle(fontSize: 12, color: Colors.black),
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(12),
              filled: true,
              fillColor: Colors.white,
              labelStyle: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.normal, fontSize: 12),
              labelText: 'اختار الموقع',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: mainColor),
              ),
            ),
            value: _selectedItem,
            items: _dropdownItems.map((item) {
              return DropdownMenuItem<String>(
                value: item,
                child: Text(
                  item,
                  style: TextStyle(color: Colors.black),
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedItem = value;
              });
              widget.onSelected(value);
            },
          ),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              _showAddItemDialog();
            },
            child: Text('إضافة موقع جديد', style: TextStyle(fontSize: 12, color: Colors.black)),
          ),
          SizedBox(height: 20),
       
        ],
      ),
    );
  }

  // Dialog to add a new item to the dropdown
  void _showAddItemDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('إضافة موقع جديد', style: TextStyle(fontSize: 12, color: Colors.black)),
          content: TextField(
            controller: _newItemController,
            decoration: InputDecoration(
              hintText: 'اسم الموقع',
              hintStyle: TextStyle(fontSize: 12, color: Colors.black),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('إلغاء', style: TextStyle(fontSize: 12, color: Colors.red)),
            ),
            ElevatedButton(
              onPressed: _addItem,
              child: Text('إضافة', style: TextStyle(fontSize: 12, color: Colors.blue)),
            ),
          ],
        );
      },
    );
  }
}
