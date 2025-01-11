import 'package:accountiong/constants/colors.dart';
import 'package:accountiong/pages/add_details.dart';
import 'package:accountiong/pages/position_page.dart';
import 'package:accountiong/widget/card1.dart';
import 'package:accountiong/widget/excel.dart';
import 'package:accountiong/widget/note_card.dart';
import 'package:accountiong/widget/position_card.dart';
import 'package:accountiong/widget/richtext.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
 
   Home({super.key});

  @override
  Widget build(BuildContext context) {
         var streamData = FirebaseFirestore.instance.collection('dropdown_items').orderBy('createdAt');

    return  Scaffold(
     backgroundColor:light3,
     // const Color.fromARGB(255, 233, 231, 231),
      appBar: AppBar(
  backgroundColor: mainColor,
  title: Text(
    'لمسة للاعمال الهندسية',
    style: TextStyle(color: Colors.black,fontSize: 15),
  ),
  actions: [
    Padding(
      padding: const EdgeInsets.all(8.0), // Add some padding around the image
      child: ClipOval(
        child: Image.asset(
          'assets/imgs/lamsah2.jpg',
          fit: BoxFit.cover, // Ensures the image scales properly
          width: 40.0, // Adjust the width and height to set the size
          height: 40.0,
        ),
      ),
    ),
  ],
),

       body:
       StreamBuilder(
         stream: streamData.snapshots(),
         builder:  (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Error');
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasData) {
               return Padding(
                 padding: const EdgeInsets.only(top: 10),
                 child: ListView.builder(
                             itemCount: snapshot.data?.docs.length,
                             itemBuilder:(context, index){
                 var data = snapshot.data!.docs[index];
                               return PositionCard(
                                data:data,
                                ontap:(){
                                  Get.to(()=>PositionPage(positionName: data['name'],));
                                } ,
                                );
               
                             }),
               );
            }
         
         
         
         
         
         return Container(
              color: mainColor,
            );} 
         
         
         
       ),



    
        //        floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //    Get.to(()=>AddDetails());
        //   },
        //   child: Icon(Icons.add), // Icon inside the button
        //   backgroundColor: mainColor, // Button color
        // ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat, // Default location
      
    );
  }
}

