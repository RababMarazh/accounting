import 'package:accountiong/constants/colors.dart';
import 'package:accountiong/widget/card1.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class PositionPage extends StatelessWidget {
  final String positionName;

  PositionPage({super.key, required this.positionName});

  @override
  Widget build(BuildContext context) {
    print(positionName);
    var streamData = FirebaseFirestore.instance
        .collection('position')
        .where('position', isEqualTo: positionName)
        .orderBy('position');

    return Scaffold(
      backgroundColor: light3,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text(
          'لمسة للاعمال الهندسية',
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipOval(
              child: Image.asset(
                'assets/imgs/lamsah2.jpg',
                fit: BoxFit.cover,
                width: 40.0,
                height: 40.0,
              ),
            ),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: streamData.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Error');
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasData) {
            // Check if data is available
            if (snapshot.data!.docs.isEmpty) {
              return const Center(child: Text('No data found for this position.'));
            }

            return Padding(
              padding: const EdgeInsets.only(top: 10),
              child: ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                 
                  var data = snapshot.data!.docs[index];
                   print(data['money'],);
                  return Card1(
                    position: data['position'],
                    money: data['money'],
                    name: data['name'],
                    notes: data['note'],
                    date: data['selectedDate'],
                  );
                },
              ),
            );
          }

          return Center(child: Text('No data available'));
        },
      ),
    );
  }
}
