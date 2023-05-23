import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController otpController = TextEditingController();
  bool isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    otpController.addListener(checkOTP);
  }

  void checkOTP() {
    String enteredOTP = otpController.text;
    if (enteredOTP.length == 4) {
      FocusScope.of(context).unfocus(); // Close the keyboard
    }
  }

  void login() {
    String enteredOTP = otpController.text;

    if (enteredOTP == "5656") {
      setState(() {
        isLoggedIn = true;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error!!! Enter Correct OTP'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }}