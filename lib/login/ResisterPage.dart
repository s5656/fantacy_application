import 'package:fantasy_application/login/LoginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'OtpVerificationPage.dart';

class ResisterPage extends StatelessWidget {
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController userName = TextEditingController();


  void fillAllTheDetails(BuildContext context){
    if(mobileNumber.text.length == 10 && name.text.isNotEmpty && userName.text.isNotEmpty){
      Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context)=> OtpVerificationPage(mobileNumber: mobileNumber)));
    }
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
              'Fill All The Details',
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
        onTap: ()=> FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
        resizeToAvoidBottomInset: false,
          appBar: AppBar(
                title: const Text("Register Page"),
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
                margin: const EdgeInsets.only(top: 150,bottom: 180,left: 20,right: 20),
                child: Column(
                  children: [
                    const Padding(padding: EdgeInsets.all(15)),
                    const Text("Profile Details",
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
                            controller: mobileNumber,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                              FilteringTextInputFormatter.digitsOnly,
                            ],
                          ),
                        )
                      ],
                    ),
                    const Padding(padding: EdgeInsets.all(8)),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: const InputDecoration(
                              labelText: 'Enter Your Name',
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
                            controller: name,
                          ),
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.all(8)),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: const InputDecoration(
                              labelText: 'Enter Team Name',
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
                            controller: userName,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            onPressed: ()=> fillAllTheDetails(context),
                            child: const Text('Sign Up')),
                        TextButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(
                                  builder: (context)=> LoginPage()));} ,
                            child: const Text('Already had an account/ Log In'))
                      ],
                    )
                  ],
                ),
              ),
            ),
    )));
  }
}