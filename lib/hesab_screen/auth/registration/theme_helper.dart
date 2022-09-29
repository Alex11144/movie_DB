import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class ThemeHelper {
  InputDecoration textInputDecoration(
      [String lableText = "", String hintText = ""]) {
    return InputDecoration(
      labelText: lableText,
      hintText: hintText,
      fillColor: Colors.white,
      filled: true,
      contentPadding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: const BorderSide(color: Colors.grey)),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: BorderSide(color: Colors.grey.shade400)),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: const BorderSide(color: Colors.red, width: 2.0)),
      focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(100.0),
          borderSide: const BorderSide(color: Colors.red, width: 2.0)),
    );
  }

  BoxDecoration inputBoxDecorationShaddow() {
    return BoxDecoration(boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.1),
        blurRadius: 20,
        offset: const Offset(0, 5),
      )
    ]);
  }

  BoxDecoration buttonBoxDecoration(BuildContext context,
      [String color1 = "", String color2 = ""]) {
    Color c1 = Theme.of(context).primaryColor;
    Color c2 = Theme.of(context).colorScheme.secondary;
    if (color1.isEmpty == false) {
      c1 = HexColor(color1);
    }
    if (color2.isEmpty == false) {
      c2 = HexColor(color2);
    }

    return BoxDecoration(
      boxShadow: const [
        BoxShadow(color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
      ],
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        stops: const [0.0, 1.0],
        colors: [
          c1,
          c2,
        ],
      ),
      color: Colors.deepPurple.shade300,
      borderRadius: BorderRadius.circular(30),
    );
  }

  ButtonStyle buttonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
      ),
      minimumSize: MaterialStateProperty.all(const Size(50, 50)),
      backgroundColor: MaterialStateProperty.all(const Color(0xFFE31E24)),
      shadowColor: MaterialStateProperty.all(Colors.transparent),
    );
  }

  AlertDialog alartDialog(String title, String content, BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          child: const Text(
            "OK",
            style: TextStyle(color: Colors.white),
          ),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.black38)),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

class LoginFormStyle {}

//  Container(
//                           child: TextFormField(
//                             decoration: ThemeHelper().textInputDecoration('First Name', 'Enter your first name'),
//                           ),
//                           decoration: ThemeHelper().inputBoxDecorationShaddow(),
//                         ),
//                         SizedBox(height: 30,),
//                         Container(
//                           child: TextFormField(
//                             decoration: ThemeHelper().textInputDecoration('Last Name', 'Enter your last name'),
//                           ),
//                           decoration: ThemeHelper().inputBoxDecorationShaddow(),
//                         ),
//                         SizedBox(height: 20.0),
//                         Container(
//                           child: TextFormField(
//                             decoration: ThemeHelper().textInputDecoration("E-mail address", "Enter your email"),
//                             keyboardType: TextInputType.emailAddress,
//                             validator: (val) {
//                               if(!(val!.isEmpty) && !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(val)){
//                                 return "Enter a valid email address";
//                               }
//                               return null;
//                             },
//                           ),
//                           decoration: ThemeHelper().inputBoxDecorationShaddow(),
//                         ),
//                         SizedBox(height: 20.0),
//                         Container(
//                           child: TextFormField(
//                             decoration: ThemeHelper().textInputDecoration(
//                                 "Mobile Number",
//                                 "Enter your mobile number"),
//                             keyboardType: TextInputType.phone,
//                             validator: (val) {
//                               if(!(val!.isEmpty) && !RegExp(r"^(\d+)*$").hasMatch(val)){
//                                 return "Enter a valid phone number";
//                               }
//                               return null;
//                             },
//                           ),
//                           decoration: ThemeHelper().inputBoxDecorationShaddow(),
//                         ),
//                         SizedBox(height: 20.0),
//                         Container(
//                           child: TextFormField(
//                             obscureText: true,
//                             decoration: ThemeHelper().textInputDecoration(
//                                 "Password*", "Enter your password"),
//                             validator: (val) {
//                               if (val!.isEmpty) {
//                                 return "Please enter your password";
//                               }
//                               return null;
//                             },
//                           ),
//                           decoration: ThemeHelper().inputBoxDecorationShaddow(),
//                         ),