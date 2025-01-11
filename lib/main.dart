import 'package:accountiong/pages/home.dart';
import 'package:accountiong/pages/mainpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
void main() async{
    WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
    
       debugShowCheckedModeBanner: false,
        title: 'Uruk',
      theme: ThemeData(
         
     
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 58, 183, 98)),
        useMaterial3: true,
      ),
        locale: const Locale('ar'),
      home:  MainPage(),
    );
  }
}


