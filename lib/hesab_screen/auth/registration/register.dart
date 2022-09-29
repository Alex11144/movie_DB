import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:project_from_amirali/hesab_screen/auth/registration/theme_helper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:project_from_amirali/useful_classes/hicab_data.dart';

class RegistrationWidget extends StatefulWidget {
  const RegistrationWidget({Key? key}) : super(key: key);

  @override
  State<RegistrationWidget> createState() => _RegistrationWidgetState();
}

class _RegistrationWidgetState extends State<RegistrationWidget> {
  final loginTextController = TextEditingController(text: 'admin');
  final passswordTextController = TextEditingController(text: 'admin');
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 840,
        width: 390,
        child: Scaffold(
          body: Column(
            children: [
              const SizedBox(
                height: 40,
              ),
              const Text('Registration Page',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20)),
              const SizedBox(
                height: 30,
              ),
              Container(
                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                child: TextFormField(
                  decoration: ThemeHelper().textInputDecoration(
                      'First Name', 'Enter your first name'),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                child: TextFormField(
                  decoration: ThemeHelper()
                      .textInputDecoration('Last Name', 'Enter your last name'),
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                child: TextFormField(
                  controller: loginTextController,
                  decoration: ThemeHelper().textInputDecoration(
                      "E-mail address", "Enter your email"),
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) {
                    if (!(val!.isEmpty) &&
                        !RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                            .hasMatch(val)) {
                      return "Enter a valid email address";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                child: TextFormField(
                  decoration: ThemeHelper().textInputDecoration(
                      "Mobile Number", "Enter your mobile number"),
                  keyboardType: TextInputType.phone,
                  validator: (val) {
                    if (!(val!.isEmpty) && !RegExp(r"^(\d+)*$").hasMatch(val)) {
                      return "Enter a valid phone number";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                decoration: ThemeHelper().inputBoxDecorationShaddow(),
                child: TextFormField(
                  controller: passswordTextController,
                  obscureText: true,
                  decoration: ThemeHelper()
                      .textInputDecoration("Password*", "Enter your password"),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return "Please enter your password";
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                  decoration: ThemeHelper().buttonBoxDecoration(context),
                  child: ElevatedButton(
                    style: ThemeHelper().buttonStyle(),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                      child: Text(
                        "Register".toUpperCase(),
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onPressed: () {
                      LoginBox.getTransactions()
                          .put('email', loginTextController.text);
                      LoginBox.getTransactions()
                          .put('password', passswordTextController.text);

                      Navigator.of(context).pushNamed('hesab');
                    },
                  )),
              SizedBox(
                height: 50,
                child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('auth');
                    },
                    child: const Text(
                      'Already have an account',
                      style: TextStyle(fontSize: 13),
                    )),
              ),
              const SizedBox(height: 30.0),
              const Text(
                "Or create account using social media",
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 25.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: FaIcon(
                      FontAwesomeIcons.googlePlus,
                      size: 35,
                      color: HexColor("#EC2D2F"),
                    ),
                    onTap: () {
                      setState(() {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ThemeHelper().alartDialog("Google Plus",
                                "You tap on GooglePlus social icon.", context);
                          },
                        );
                      });
                    },
                  ),
                  const SizedBox(
                    width: 30.0,
                  ),
                  GestureDetector(
                    child: Container(
                      padding: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border:
                            Border.all(width: 5, color: HexColor("#40ABF0")),
                        color: HexColor("#40ABF0"),
                      ),
                      child: FaIcon(
                        FontAwesomeIcons.twitter,
                        size: 23,
                        color: HexColor("#FFFFFF"),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ThemeHelper().alartDialog("Twitter",
                                "You tap on Twitter social icon.", context);
                          },
                        );
                      });
                    },
                  ),
                  const SizedBox(
                    width: 30.0,
                  ),
                  GestureDetector(
                    child: FaIcon(
                      FontAwesomeIcons.facebook,
                      size: 35,
                      color: HexColor("#3E529C"),
                    ),
                    onTap: () {
                      setState(() {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return ThemeHelper().alartDialog("Facebook",
                                "You tap on Facebook social icon.", context);
                          },
                        );
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
