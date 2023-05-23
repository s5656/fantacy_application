import 'package:fantasy_application/OtpVerificationPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'ResisterPage.dart';

class LoginPage extends StatefulWidget {

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController mobileNumber = TextEditingController();

  TextEditingController getMobileNumber(){
    return mobileNumber;
  }

  void _isTenDigitEntered(BuildContext context) {
    if (mobileNumber.text.length == 10) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => OtpVerificationPage(mobileNumber: mobileNumber)));
    }
    // else{
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //       content: Text('Please enter a 10-digit number.'),
    //       backgroundColor: Colors.red,
    //     ),
    //   );
    // }
    else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Invalid Input',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            content: const Text(
              'Please enter a 10-digit number.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'OK',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    mobileNumber.addListener(() {
      if (mobileNumber.text.length > 10) {
        mobileNumber.text = mobileNumber.text.substring(0, 10);
        mobileNumber.selection = TextSelection.fromPosition(
          TextPosition(offset: mobileNumber.text.length),
        );
      }
    });

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text("Login Page"),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/cricket_logo.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Card(
              elevation: 20,
              shadowColor: Colors.cyan,
              color: Colors.white54,
              margin: const EdgeInsets.only(top: 150,bottom: 270,left: 20,right: 20),
              child: Column(
                children: [
                  const Padding(padding: EdgeInsets.all(15)),
                  const Text(
                    "Please Enter Your Mobile Number",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const Padding(padding: EdgeInsets.all(8)),
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          decoration: const InputDecoration(
                            labelText: 'Enter Mobile Number',
                            labelStyle: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.normal,
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.blue,
                                width: 2.0,
                              ),
                            ),
                          ),
                          controller: mobileNumber,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10),
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: ElevatedButton(
                      onPressed: () => _isTenDigitEntered(context),
                      child: const Text('Log In'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 2,bottom: 5,left: 170,right: 5),
                    child: ElevatedButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ResisterPage()));
                      },
                      child: const Text('Register/New User'),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
