import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_game_reward/services/giveawaysServices.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:lottie/lottie.dart';

class GiveAwaysList extends StatelessWidget {
  const GiveAwaysList({Key? key, required this.giveAways}) : super(key: key);

  final GiveAways giveAways;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 30 / 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22.0),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(22.0),
        child: Stack(
          children: [
            FadeInImage(
              fit: BoxFit.cover,
              width: double.infinity,
              image: NetworkImage(giveAways.thumbnail),
              placeholder: AssetImage(
                'assets/placegit.gif',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * 17 / 100),
              child: GlassmorphicContainer(
                width: double.infinity,
                height: height * 13 / 100,
                borderRadius: 20,
                blur: 12,
                alignment: Alignment.bottomCenter,
                border: 0,
                linearGradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFffffff).withOpacity(0.1),
                      Color(0xFFFFFFFF).withOpacity(0.05),
                    ],
                    stops: [
                      0.1,
                      1,
                    ]),
                borderGradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFFffffff).withOpacity(0.5),
                    Color((0xFFFFFFFF)).withOpacity(0.5),
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 8.0, left: 15.0),
                  child: Row(
                    children: [
                      SizedBox(
                        height: 50,
                        width: 50,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            giveAways.thumbnail,
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, top: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              giveAways.title.length > 3
                                  ? giveAways.title.substring(0, 10)
                                  : giveAways.title,
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                            Text(
                              giveAways.description.length > 3
                                  ? giveAways.description.substring(0, 20)
                                  : giveAways.description,
                              style: TextStyle(
                                color: Color.fromARGB(255, 56, 215, 243),
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 50.0),
                        child: Container(
                          height: 30,
                          width: 100,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topRight,
                              end: Alignment.topLeft,
                              colors: [
                                Color.fromARGB(255, 247, 252, 255),
                                Color.fromARGB(255, 25, 213, 238),
                                Color.fromARGB(255, 31, 196, 247),
                                Color.fromARGB(255, 9, 180, 231),
                              ],
                            ),
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Center(
                            child: Text(
                              "Follow +",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
