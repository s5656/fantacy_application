import 'package:flutter/material.dart';

import 'number_of_teams_joined.dart';

class OneWinnerContest extends StatefulWidget {

  int entryFee;
  int numberOfSpot;

  OneWinnerContest({required this.entryFee,
    required this.numberOfSpot});

  @override
  State<OneWinnerContest> createState() => _OneWinnerContestState();
}

class _OneWinnerContestState extends State<OneWinnerContest> {
  double progress = 0.0;

  int totalElements = 0;

  int prizePoolAmount =0;

  int numberOfSpotLeft =0;

  int countNumberOfClicks=0;

  void addElement() {
    setState(() {
      totalElements++;
      progress = totalElements / widget.numberOfSpot; // Assuming 2 elements to fill the bar
    });
  }

  void prizePool() {
    setState(() {
      double calulatedPrize = (widget.entryFee * widget.numberOfSpot) * 0.92;
      prizePoolAmount = calulatedPrize.toInt();
      numberOfSpotLeft = widget.numberOfSpot;

      numberOfSpotLeft = numberOfSpotLeft-countNumberOfClicks;
    });}


  @override
  Widget build(BuildContext context) {
    prizePool();
    return Column(children: [
                  Container(
                      height: 150,
                      width: 400,
                      child: Card(
                        color: Color.fromRGBO(220, 220, 220, 2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black, width: 2),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 8.0,right: 8,left: 8),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('Prize Pool',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black
                                    ),),
                                    Text('Entry Fee',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black
                                      ),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0,left: 7.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('₹ $prizePoolAmount',
                                      style: TextStyle(
                                          fontSize: 22,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold
                                      ),),
                                    ElevatedButton(
                                        onPressed: (){
                                          joinContest();
                                        },
                                        child: Text('₹ ${widget.entryFee}'))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0,left: 7.0,top: 8,bottom: 8),
                                child: Column(
                                  children: [
                                    LinearProgressIndicator(
                                      value: progress,
                                      backgroundColor: Colors.grey,
                                      valueColor: AlwaysStoppedAnimation<Color>(Colors.orange),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0,left: 7.0,bottom: 6),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text('${numberOfSpotLeft} Spots left',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black
                                      ),),
                                    Text('${widget.numberOfSpot} Spots',
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black
                                      ),),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 8.0,left: 7.0),
                                child: Container(
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.greenAccent.withOpacity(0.5), // Specify the shadow color
                                          spreadRadius: 1,
                                          blurRadius: 10,
                                          offset: Offset(0, 3), // Specify the offset of the shadow
                                        ),
                                      ],
                                    border: Border(
                                      top: BorderSide(
                                        color: Colors.black,
                                        width: 2.0,
                                      ),
                                    ),
                                  ),
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Icon(
                                        Icons.local_police_outlined,
                                        size: 18,
                                      ),
                                      Text(
                                        ' ₹ $prizePoolAmount',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(
                                        width: 210,
                                      ),
                                      Icon(
                                        Icons.military_tech_outlined,
                                        size: 20,
                                        color: Colors.black,
                                      ),
                                      Text(
                                        '1 Winner',
                                        style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ),
                            ],
                          ),
                        ),
                      ))
                ]);
  }

  void joinContest() {
    if(countNumberOfClicks < widget.numberOfSpot){
      addElement();
      countNumberOfClicks++;
    }else {
      showPopupMessage('Contest is full');
    }
    if(countNumberOfClicks == widget.numberOfSpot){
      numberOfSpotLeft = 0;
    }

  }
  void showPopupMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(message),
              backgroundColor: Colors.red,
            ),
          );
  }
}
