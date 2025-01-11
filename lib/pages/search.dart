import 'package:accountiong/constants/colors.dart';
import 'package:accountiong/widget/card1.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Search extends StatefulWidget {
  Search({super.key});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController searchController = TextEditingController();
  String searchQuery = "";

  // This function will update the search query whenever the user types
  void onSearchChanged(String query) {
    setState(() {
      searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Firestore query to filter based on the search query
    var streamData = FirebaseFirestore.instance
        .collection('position')
        .where('position', isGreaterThanOrEqualTo: searchQuery) // Filter by position
        .where('position', isLessThanOrEqualTo: searchQuery + '\uf8ff') // To include all results starting with the search query
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
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: searchController,
              onChanged: onSearchChanged,
              decoration: InputDecoration(
                labelText: 'Search Position',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
          ),
          // Stream to fetch filtered positions from Firestore
          Expanded(
            child: StreamBuilder(
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
                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: ListView.builder(
                      itemCount: snapshot.data?.docs.length,
                      itemBuilder: (context, index) {
                        var data = snapshot.data!.docs[index];
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

                return Center(child: Text('No positions found'));
              },
            ),
          ),
        ],
      ),
    );
  }
}
