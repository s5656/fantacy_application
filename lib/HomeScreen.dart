import 'package:flutter/material.dart';

import 'constant/common_uses.dart';
import 'home_screen_images.dart';
import 'match.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<HomeScreenImage> multipleImages = [
    HomeScreenImage(image: 'assets/images/offer.jpg'),
    HomeScreenImage(image: 'assets/images/cricket.jpg'),
    HomeScreenImage(image: 'assets/images/champ.jpg')
  ];


  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          actions: [
            Row(
              children: [
                Container(
                  height: 100,
                  width: 150,
                  padding: EdgeInsets.all(5),
                  color: Colors.black,
                  child: Image.asset('assets/images/logoonhomepage.jpg'),
                ),
                const SizedBox(
                  width: 180,
                ),
                IconButton(
                    onPressed: () {
                      debugPrint('notification');
                    },
                    icon: const Icon(Icons.notifications))
              ],
            )
          ],
          bottom: const TabBar(
              isScrollable: true,
              tabs: [
            Tab(
              icon: const Icon(Icons.sports_cricket),
              text: 'Cricket',
            ),
            Tab(
              icon: const Icon(Icons.sports_kabaddi_sharp),
              text: 'kabaddi',
            ),
            Tab(
              icon: Icon(Icons.sports_basketball_sharp),
              text: 'Football',
            ),
            Tab(
              icon: Icon(Icons.sports_football_outlined),
              text: 'NBA',
            ),
          ]),
        ),
        body: homeScreenCricketBody(),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          items: const [
            BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(
                Icons.home,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Star',
              icon: Icon(
                Icons.star,
              ),
            ),
            BottomNavigationBarItem(
              label: 'Person',
              icon: Icon(
                Icons.person_2_outlined,
              ),
            ),
            BottomNavigationBarItem(
              label: 'more',
              icon: Icon(
                Icons.more_horiz,
              ),
            ),
          ],
          backgroundColor: Colors.black,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
        ),
      ),
    );
  }

  homeScreenCricketBody(){
    return Stack(
      children: [
        Column(
          children: [
            Container(
              height: 160,
              color: Colors.grey,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: multipleImages.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Card(
                      elevation: 2,
                      child: Container(
                        height: 150,
                        width: 380,
                        child: Image.asset(
                          multipleImages[index].image,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'UPCOMING MATCHES',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            MyMatchList(
                'CSK','MI','T20 LEAGUE',
                'assets/images/csk.jpg',
                'assets/images/mi.jpg',
                CommonUses.firstMatchTargetedTime
                 //year,month,day,hr,min,sec
            ),
            MyMatchList(
                'RCB','GT','T20 LEAGUE',
                'assets/images/rcb.jpg',
                'assets/images/gt.jpg',
                CommonUses.secondMatchTargetedTime
            ),

            MyMatchList(
                'RR','SRH','T20 LEAGUE',
                'assets/images/rr.jpg',
                'assets/images/srh.jpg',
              CommonUses.thirdMatchTargetedTime

            ),

          ],
        )
      ],
    );
  }
}
