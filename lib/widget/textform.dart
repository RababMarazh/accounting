
import 'package:accountiong/constants/colors.dart';
import 'package:flutter/material.dart';

Widget textFormLogin(
        {required controller,
        String? lable,
        IconData? icon,
        required textInputType,
        dynamic validate,
        IconData? suffixIcon,
        String? hint,
        bool readOnly= false,
       
        ValueChanged<String>? onChanged,
        // bool obscureText = false,
        dynamic suffixOnTap,
        bool isPassword = false,
        textInputAction,
        inputFormatters,

        keyboardType}) =>
    Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextFormField(
        inputFormatters: inputFormatters,
      minLines: 1, // Minimum height
      maxLines: isPassword ? 1 : 5,  expands: false,
        style: TextStyle(fontSize: 16),
        validator: validate,
        obscureText: isPassword,
        onChanged: onChanged,
        controller: controller,
        textInputAction: textInputAction,
        readOnly:readOnly ,
        decoration: InputDecoration(
             filled: true, // Set the background to be filled
          fillColor: Colors.white, // Set the background color to white
      
          hintText: hint,
          contentPadding: const EdgeInsets.all(12),
          labelText: lable,
          labelStyle: const TextStyle(
              color: Colors.black, fontWeight: FontWeight.normal, fontSize: 12),
          suffixIcon: InkWell(
            onTap: suffixOnTap,
            child: Icon(
              suffixIcon,
              color: mainColor,
            ),
          ),
          // prefixIcon: Icon(
          //   icon,
          //   color: mainColor,
          //  // size: 30,
          // ), //SvgPicture.asset(icon),
          
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
        ),
      ),
    );
