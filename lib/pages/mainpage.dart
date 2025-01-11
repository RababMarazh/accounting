import 'package:accountiong/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final BottomNavController controller = Get.put(BottomNavController());

    return Scaffold(
      body: Obx(() => controller.currentScreen),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          onTap: controller.changePage,
          backgroundColor: Colors.blueGrey, // Background color
          selectedItemColor: const Color.fromARGB(255, 244, 236, 5), // Color for selected item
          unselectedItemColor: Colors.black, // Color for unselected items
          type: BottomNavigationBarType.fixed, // Ensures colors are applied
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: 'Add',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'All',
            ),
          ],
        ),
      ),
    );
  }
}
