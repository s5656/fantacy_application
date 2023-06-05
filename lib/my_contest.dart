import 'package:flutter/material.dart';

class MyContestTab extends StatefulWidget {
  @override
  _MyContestTabState createState() => _MyContestTabState();
}

class _MyContestTabState extends State<MyContestTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Contest'),
      ),
      body: Center(
        child: Text('My Contest Tab Content'),
      ),
    );
  }
}