import 'package:flutter/material.dart';

class HomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
          title:const Text("Home Here")
      ),
      body: Container(
        padding: const EdgeInsets.all(32.0),
        child: const Center(
          child: Column(
            children: <Widget>[
              Text("Hello"),
            ],
          ),
        ),
      ),
    );

  }
}