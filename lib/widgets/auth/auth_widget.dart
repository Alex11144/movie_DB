import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("The Movie DB"))),
      body: Center(
        child: Container(
            color: Colors.white,
            height: 840,
            width: 390,
            child: SingleChildScrollView(
              child: HeaderWidget(),
            )),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 16, color: Colors.black);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 25,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Login to your account',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          RichText(
              text: TextSpan(style: textStyle, children: [
            const TextSpan(
                text:
                    "In order to use the editing and rating capabilities of TMDB, as well as get personal recommendations you will need to login to your account. If you do not have an account, registering for an account is free and simple."),
            TextSpan(
                style: const TextStyle(color: Colors.lightBlue),
                text: " click here",
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    print("Register");
                  }),
            const TextSpan(text: " to get started.")
          ])),

          const SizedBox(
            height: 15,
          ),
          RichText(
              text: TextSpan(style: textStyle, children: [
            const TextSpan(
                text:
                    "If you signed up but didn't get your verification email,"),
            TextSpan(
                style: const TextStyle(color: Colors.lightBlue),
                text: 'click here ',
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    print("verify email");
                  }),
            const TextSpan(text: "to have it resent.")
          ])),
          // Text(
          //     style: textStyle,
          //     "If you signed up but didn't get your verification email, Click here to have it resent."),
          const SizedBox(
            height: 15,
          ),
          const FormWidget(),
        ],
      ),
    );
  }
}

class FormWidget extends StatefulWidget {
  const FormWidget({Key? key}) : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final loginTextController = TextEditingController(text: 'admin');
  final passswordTextController = TextEditingController(text: 'admin');
  String? errorText = null;

  void auth() {
    final login = loginTextController.text;
    final password = passswordTextController.text;
    if (login == 'admin' && password == 'admin') {
      Navigator.of(context).pushNamed('/main_screen');
      errorText = null;
    } else {
      errorText = '???????????????? ?????????? ?????? ????????????';
    }
    setState(() {});
  }

  void resetPassword() {
    print("password reset");
  }

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(fontSize: 16, color: Colors.black);

    const textDecoration = InputDecoration(
        isCollapsed: true,
        enabledBorder:
            OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xff01b4e4))),
        contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 12));
    final errorText = this.errorText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Image.network(
        //     'https://d2jcoi69vojtfw.cloudfront.net/ArendaAz/2022/8/115945/1e1a33c6-17b1-44e8-ade8-7611d7d8829c.jpg'),
        if (errorText != null) ...[
          Text(
            errorText,
            style: const TextStyle(color: Colors.red),
          ),
          const SizedBox(
            height: 20,
          )
        ],

        const Text("Username", style: textStyle),
        const SizedBox(height: 5),
        TextField(
          controller: loginTextController,
          decoration: textDecoration,
        ),
        const SizedBox(
          height: 15,
        ),
        const Text("Password", style: textStyle),
        const SizedBox(height: 5),
        TextField(
          controller: passswordTextController,
          decoration: textDecoration,
        ),
        const SizedBox(
          height: 20,
        ),
        Row(children: [
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Colors.lightBlue,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(7))),
              onPressed: auth,
              child: Container(
                margin: const EdgeInsets.all(7),
                child: const Text(
                  "Login",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 17,
                  ),
                ),
              )),
          const SizedBox(
            width: 10,
          ),
          TextButton(
              child: const Text(
                "Reset password",
                style: TextStyle(
                  color: Colors.lightBlue,
                  fontWeight: FontWeight.w400,
                ),
              ),
              onPressed: resetPassword),
        ])
      ],
    );
  }
}
