import 'package:fantasy_application/sorting_contest.dart';
import 'package:fantasy_application/one_winner_contest.dart';
import 'package:fantasy_application/wallet_screen.dart';
import 'package:flutter/material.dart';

import 'constant/common_uses.dart';
import 'match_timing.dart';
import 'my_contest.dart';
import 'my_teams.dart';

class ContestScreen extends StatefulWidget {
  String firstTeamName ='CSK';
  String verses='vs';
  String secondTeamName='MI';

  @override
  State<ContestScreen> createState() => _ContestScreenState();
}

class _ContestScreenState extends State<ContestScreen> {

  TextEditingController _textEditingController = TextEditingController();

  Map<int, int> contestDetails = {
    73:3,82:2,39:4, 22:5
  };

  int _selectedIndex = 0;

  List<Widget> _widgetOptions = [
    MyContestTab(),
    MyTeamsTab(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: appContestAppBar(
            widget.firstTeamName,
            widget.verses,
            widget.secondTeamName,
          ),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                'All Contest',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top:8), // Remove the padding here
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 115,
                    height: 30,
                    child: FilledButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EntryFee()),
                        );
                      },
                      label: Text('Winning Prize'),
                      icon: Icon(Icons.arrow_circle_down_rounded),
                    ),
                  ),
                  Container(
                    width: 115,
                    height: 30,
                    child: FilledButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EntryFee()),
                        );
                      },
                      label: Text('No Of User'),
                      icon: Icon(Icons.arrow_circle_down_rounded),
                    ),
                  ),
                  Container(
                    width: 115,
                    height: 30,
                    child: FilledButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => EntryFee()),
                        );
                      },
                      label: Text('Entry Fee'),
                      icon: Icon(Icons.arrow_circle_down_rounded),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(5), // Add padding for the ListView
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        OneWinnerContest(
                          entryFee: contestDetails.keys.elementAt(0),
                          numberOfSpot: contestDetails.values.elementAt(0),
                        ),
                        OneWinnerContest(
                          entryFee: contestDetails.keys.elementAt(0),
                          numberOfSpot: contestDetails.values.elementAt(0),
                        ),
                        OneWinnerContest(
                          entryFee: contestDetails.keys.elementAt(1),
                          numberOfSpot: contestDetails.values.elementAt(1),
                        ),
                        OneWinnerContest(
                          entryFee: contestDetails.keys.elementAt(2),
                          numberOfSpot: contestDetails.values.elementAt(2),
                        ),
                        OneWinnerContest(
                          entryFee: contestDetails.keys.elementAt(2),
                          numberOfSpot: contestDetails.values.elementAt(2),
                        ),
                        OneWinnerContest(
                          entryFee: contestDetails.keys.elementAt(3),
                          numberOfSpot: contestDetails.values.elementAt(3),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(label: 'Contest', icon: Icon(Icons.wine_bar)),
            BottomNavigationBarItem(
              label: 'My Contest',
              icon: Icon(Icons.wine_bar_outlined),
            ),
            BottomNavigationBarItem(
              label: 'My Teams',
              icon: Icon(Icons.person_add_alt_1),
            ),
          ],

        ),
      ),
    );
  }
  void privateContest(){
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            'Enter Private Code',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          content: TextField(
            controller: _textEditingController,
            decoration: InputDecoration(labelText: 'Code'),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
              ),
              child: const Text(
                'Submit',
                style: TextStyle(
                  color: Colors.white,
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

  Widget appContestAppBar(String firstName, String verses, String secondTeamName) {
    return Row(
      children: [
        Column(
          children: [
            Row(
              children: [
                Text(
                  firstName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                SizedBox(width: 7,),
                Text(
                  verses,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                SizedBox(width: 7,),
                Text(
                  secondTeamName,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ],
            ),
            Row(children: [
              MyCountdownTimer(
                targetTime:
                CommonUses.firstMatchTargetedTime)],),

          ],
        ),
        SizedBox(width: 110,),
        Row(
          children: [
            IconButton(onPressed: (){
              privateContest();
              debugPrint('data');
              }, icon: const Icon(Icons.emoji_events)),
            SizedBox(width: 3,),
            IconButton(onPressed: (){
              Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context)=> WalletScreen()));
            },
                icon: const Icon(Icons.account_balance_wallet_outlined))

              ],
        ),
      ],
    );
  }
}
