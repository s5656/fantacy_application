import 'package:fantasy_application/HomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpVerificationPage extends StatelessWidget {
  final TextEditingController mobileNumber;

  TextEditingController otpEntered = TextEditingController();

  OtpVerificationPage({required this.mobileNumber});

  String confidentialMobileNumber(String mobileNumber){
    var updatedMobileNumber = mobileNumber.substring(6,10);
    return "***** *$updatedMobileNumber";
  }

  void otpVerification(BuildContext context) {
    if (otpEntered.text == "5656") {
      Navigator.pushReplacement(
          context, MaterialPageRoute(
          builder: (context) => HomePage()));
    }
    // else {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //     const SnackBar(
    //       content: Text('Error!!! Enter Correct OTP'),
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
              'Error!!!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            content: const Text(
              'Enter Correct OTP.',
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

    return WillPopScope(
      onWillPop: () async {return false;},
      child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: const Text("OTP Verification"),
            ),
            body: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/cricket_logo.jpg'),
                fit: BoxFit.cover,
              )),
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
                        'OTP Verification',
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                      Text(
                        " OTP Sent on +91 ${confidentialMobileNumber(mobileNumber.text)}",
                        style: const TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 20),
                      ),
                      const Padding(padding: EdgeInsets.all(8)),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              maxLength: 4,
                              decoration: const InputDecoration(
                                labelText: 'Enter Sent OTP',
                                labelStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                ),
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                    width: 2.0,
                                  ),
                                ),
                              ),
                              controller: otpEntered,
                              inputFormatters: [
                                LengthLimitingTextInputFormatter(4),
                                FilteringTextInputFormatter.digitsOnly,
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10,left: 100,right: 100),
                        child: ElevatedButton(
                          onPressed: () => otpVerification(context),
                          child: const Text('Verify :)'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
