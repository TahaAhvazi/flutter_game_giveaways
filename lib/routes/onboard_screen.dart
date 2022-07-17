import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_game_reward/routes/Home.dart';
import 'package:flutter_game_reward/services/giveawaysServices.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final myController = PageController();
  bool isLastPage = false;
  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 1, 71),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 80.0),
        child: PageView(
          controller: myController,
          onPageChanged: (index) {
            setState(() => isLastPage = index == 2);
          },
          children: [
            Container(
              color: Color.fromARGB(255, 0, 1, 71),
              child: Center(
                child: Column(
                  children: [
                    Lottie.asset('assets/laptop.json'),
                    Text(
                      "Works on any platfom\n Online Data\n fast",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              child: Center(
                child: Column(
                  children: [
                    Lottie.asset('assets/fast.json'),
                    SizedBox(
                      height: 100,
                    ),
                    Text(
                      textDirection: TextDirection.ltr,
                      "Read all the updates detail of \n any game\n as FAST as possible",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              color: Color.fromARGB(255, 0, 1, 71),
              child: Center(
                child: Column(
                  children: [
                    Lottie.asset('assets/secure.json'),
                    Text(
                      "All the internetconnections\n through this app \n are fully SECURE",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: isLastPage
          ? TextButton(
              onPressed: () async {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => RepositoryProvider(
                    create: (context) => GetGiveAwaysSservice(),
                    child: HomePage(),
                  ),
                ));
              },
              child: Text(
                "Get started",
                style: TextStyle(
                  color: Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0),
                  ),
                  backgroundColor: Color.fromRGBO(0, 137, 179, 1),
                  primary: Color.fromARGB(255, 0, 1, 71),
                  minimumSize: Size.fromHeight(80)),
            )
          : Container(
              color: Color.fromARGB(255, 0, 1, 71),
              padding: EdgeInsets.symmetric(horizontal: 8),
              height: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      myController.jumpToPage(2);
                    },
                    child: Text(
                      "SKIP",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Center(
                    child: SmoothPageIndicator(
                      controller: myController,
                      effect: WormEffect(
                        dotColor: Color.fromARGB(255, 255, 255, 255),
                        activeDotColor: Colors.blueAccent,
                      ),
                      count: 3,
                      onDotClicked: (index) => myController.animateToPage(
                        index,
                        duration: Duration(microseconds: 500),
                        curve: Curves.easeOut,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      myController.nextPage(
                        duration: Duration(
                          microseconds: 600,
                        ),
                        curve: Curves.easeOut,
                      );
                    },
                    child: Text(
                      "NEXT",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
