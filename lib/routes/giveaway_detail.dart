import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_game_reward/routes/giveAwayDetail.dart';
import 'package:glassmorphism/glassmorphism.dart';

class GiveAwayDetailRoute extends StatelessWidget {
  final String herotag;
  final String title;
  final String imageUrl;
  final String description;
  final String instructions;
  final String open_giveaway_url;
  final String published_date;
  final String type;
  final String platforms;
  final String end_date;
  final String users;
  final String status;
  final String gamerpower_url;
  final String open_giveaway;

  const GiveAwayDetailRoute({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.instructions,
    required this.open_giveaway_url,
    required this.published_date,
    required this.type,
    required this.platforms,
    required this.end_date,
    required this.users,
    required this.status,
    required this.gamerpower_url,
    required this.open_giveaway,
    required this.herotag,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    print(herotag);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Give Away Detail'),
          centerTitle: true,
          backgroundColor: Color.fromARGB(255, 0, 1, 41),
          elevation: 0,
        ),
        backgroundColor: Color.fromARGB(255, 0, 1, 41),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15),
                  ),
                  child: Stack(
                    children: [
                      Hero(
                        tag: herotag,
                        child: FadeInImage(
                          fit: BoxFit.cover,
                          width: double.infinity,
                          image: NetworkImage(imageUrl),
                          placeholder: AssetImage(
                            'assets/placegit.gif',
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 148.0),
                        child: GlassmorphicContainer(
                          width: double.infinity,
                          height: height * 13 / 100,
                          borderRadius: 20,
                          blur: 22,
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
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15.0, top: 20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        title.length > 3
                                            ? title.substring(0, 14)
                                            : title,
                                        style: TextStyle(
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'PLATFORMS : $platforms',
                                        style: TextStyle(
                                          color:
                                              Color.fromARGB(255, 56, 215, 243),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                height: 230.0,
                width: double.infinity,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Description : ",
                  style: TextStyle(
                    color: Color.fromARGB(255, 56, 215, 243),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text(
                    textDirection: TextDirection.ltr,
                    description,
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "instructions : ",
                  style: TextStyle(
                    color: Color.fromARGB(255, 56, 215, 243),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Text(
                    textDirection: TextDirection.ltr,
                    instructions,
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            GiveAwayDetailweb(giveAwayUrl: open_giveaway_url),
                      ));
                    },
                    child: Container(
                      height: 70,
                      width: 150,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.topLeft,
                          colors: [
                            Color.fromARGB(255, 247, 252, 255),
                            Color.fromARGB(255, 125, 255, 39),
                            Color.fromARGB(255, 121, 241, 40),
                          ],
                        ),
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Center(
                        child: Text(
                          "OPEN GIVE AWAY",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('Clicked');
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            GiveAwayDetailweb(giveAwayUrl: gamerpower_url),
                      ));
                    },
                    child: Container(
                      height: 70,
                      width: 150,
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
                          "OPEN GIVE AWAY 2",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
