import 'package:flutter/material.dart';

class MyTeamsTab extends StatefulWidget {
  @override
  _MyTeamsTabState createState() => _MyTeamsTabState();
}

class _MyTeamsTabState extends State<MyTeamsTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Teams'),
      ),
      body: Center(
        child: Text('My Teams Tab Content'),
      ),
    );
  }
}