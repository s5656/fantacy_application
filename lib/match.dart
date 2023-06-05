import 'package:flutter/material.dart';

import 'contest_screen.dart';
import 'match_timing.dart';
class MyMatchList extends StatelessWidget {
  String verses = 'VS';
  int matchItemCount = 1;
  String firstTeamName;
  String secondTeamName;
  String matchType;
  String firstTeamImage;
  String secondTeamImage;
  DateTime targetedTime;

  MyMatchList(this.firstTeamName, this.secondTeamName, this.matchType,
      this.firstTeamImage, this.secondTeamImage, this.targetedTime,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: matchItemCount,
        shrinkWrap: true,
        scrollDirection: Axis.vertical,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ContestScreen()));
            },
            child: Container(
              height: 120,
              width: 200,
              child: Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        Image.asset(
                          firstTeamImage,
                          height: 60,
                          width: 50,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          firstTeamName,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          matchType,
                          style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          verses,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            const Icon(
                              Icons.timer,
                              size: 15,
                              color: Colors.redAccent,
                            ),
                            SizedBox(width: 5),
                            MyCountdownTimer(
                                targetTime:
                                    targetedTime) //year,month,day,hr,min,sec
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          secondTeamName,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          secondTeamImage,
                          height: 60,
                          width: 50,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
