import 'package:accountiong/constants/colors.dart';
import 'package:flutter/material.dart';

class Constants {
  static TextStyle black18(BuildContext context) {
   double scaleFactor = MediaQuery.of(context).textScaleFactor;

    return TextStyle(
      color: Colors.black,
      fontSize:18*scaleFactor,
      fontFamily: "IBMPlexSansArabic" // Adjust the factor as per your design
    );
  }
    static TextStyle white15(BuildContext context) {
    double scaleFactor = MediaQuery.of(context).textScaleFactor;
    return TextStyle(
      color: Colors.white,
      fontSize: 15 * scaleFactor,
      fontFamily: "IBMPlexSansArabic" 
    );
  }
    static TextStyle whiteB20(BuildContext context) {
    double scaleFactor = MediaQuery.of(context).textScaleFactor;
    return TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 20 * scaleFactor,
      fontFamily: "IBMPlexSansArabic" 
    );
  }


  static TextStyle darkB17(BuildContext context) {
    double scaleFactor = MediaQuery.of(context).textScaleFactor;
    return TextStyle(
      color: darkColor,
      fontWeight: FontWeight.bold,
      fontSize: 17 * scaleFactor,
      fontFamily: "IBMPlexSansArabic" 
    );
  }
    static TextStyle secondaryB17(BuildContext context) {
    double scaleFactor = MediaQuery.of(context).textScaleFactor;
    return TextStyle(
      color: secondery,
      fontWeight: FontWeight.bold,
      fontSize: 17 * scaleFactor,
      fontFamily: "IBMPlexSansArabic" 
    );
  }
      static TextStyle secondary15(BuildContext context) {
    double scaleFactor = MediaQuery.of(context).textScaleFactor;
    return TextStyle(
      color: secondery,
      //fontWeight: FontWeight.bold,
      fontSize: 15 * scaleFactor,
      fontFamily: "IBMPlexSansArabic" 
    );
  }

  static TextStyle whiteB17(BuildContext context) {
    double scaleFactor = MediaQuery.of(context).textScaleFactor;
    return TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 17 * scaleFactor,
      fontFamily: "IBMPlexSansArabic" 
    );
  }

  static TextStyle whiteB15(BuildContext context) {
    double scaleFactor = MediaQuery.of(context).textScaleFactor;
    return TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 15 * scaleFactor,
      fontFamily: "IBMPlexSansArabic" 
    );
  }

  static TextStyle blackB18(BuildContext context) {
    double scaleFactor = MediaQuery.of(context).textScaleFactor;
    return TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 18 * scaleFactor,
      fontFamily: "IBMPlexSansArabic" 
    );
  }
    static TextStyle blackB20(BuildContext context) {
    double scaleFactor = MediaQuery.of(context).textScaleFactor;
    return TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 20 * scaleFactor,
      fontFamily: "IBMPlexSansArabic" 
    );
  }
    static TextStyle black15(BuildContext context) {
    double scaleFactor = MediaQuery.of(context).textScaleFactor;
    return TextStyle(
      color: Colors.black,
      fontSize: 15 * scaleFactor,
      fontFamily: "IBMPlexSansArabic" 
    );
  }
     static TextStyle black12(BuildContext context) {
    double scaleFactor = MediaQuery.of(context).textScaleFactor;
    return TextStyle(
      color: Colors.black,
      fontSize: 12 * scaleFactor,
      fontFamily: "IBMPlexSansArabic" 
    );
  }
      static TextStyle blackB15(BuildContext context) {
    double scaleFactor = MediaQuery.of(context).textScaleFactor;
    return TextStyle(
      color: Colors.black,
      fontSize: 15 * scaleFactor,
      fontWeight: FontWeight.bold,
      fontFamily: "IBMPlexSansArabic" 
    );
  }

  static TextStyle blue15(BuildContext context) {
    double scaleFactor = MediaQuery.of(context).textScaleFactor;
    return TextStyle(
      color: mainColor,
      fontWeight: FontWeight.bold,
      fontSize: 15 * scaleFactor,
      fontFamily: 'IBMPlexSansArabic'
    );
  }

  static TextStyle blue14(BuildContext context) {
    double scaleFactor = MediaQuery.of(context).textScaleFactor;
    return TextStyle(
      color: mainColor,
      fontWeight: FontWeight.w600,
      fontSize: 14 * scaleFactor,
      fontFamily: "IBMPlexSansArabic" 
    );
    
  }
    static TextStyle orange14(BuildContext context) {
    double scaleFactor = MediaQuery.of(context).textScaleFactor;
    return TextStyle(
      color: secondery,
      fontWeight: FontWeight.w600,
      fontSize: 14 * scaleFactor,
      fontFamily: "IBMPlexSansArabic" 
    );
  }

    static TextStyle descreptionStyle(BuildContext context) {
    double scaleFactor = MediaQuery.of(context).textScaleFactor;
    return TextStyle(
      color: const Color.fromARGB(255, 90, 90, 90),
      fontWeight: FontWeight.bold,
      fontSize: 12 * scaleFactor,
      fontFamily: "IBMPlexSansArabic" 
    );
  }
}

// const black15 =  TextStyle(color: Colors.black,fontSize: 15);

//  TextStyle blue15 =  TextStyle(color:mainColor,fontWeight: FontWeight.bold,fontSize: 15);
//   TextStyle blue14 =  TextStyle(color:mainColor,fontWeight: FontWeight.w600,fontSize: 14);


 