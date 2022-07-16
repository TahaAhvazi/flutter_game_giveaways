import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategoriWidget extends StatelessWidget {
  const CategoriWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  children: [
                    FadeInImage(
                      fit: BoxFit.cover,
                      width: width / 2 - 30,
                      height: 70,
                      image: AssetImage('assets/blure.png'),
                      placeholder: AssetImage(
                        'assets/placegit.gif',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 40),
                      child: Text(
                        "SPORT",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  children: [
                    FadeInImage(
                      fit: BoxFit.cover,
                      width: width / 2 - 30,
                      height: 70,
                      image: AssetImage('assets/blure.png'),
                      placeholder: AssetImage(
                        'assets/placegit.gif',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 40),
                      child: Text(
                        "ONLINE",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            width: 30,
          ),
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  children: [
                    FadeInImage(
                      fit: BoxFit.cover,
                      width: width / 2 - 30,
                      height: 70,
                      image: AssetImage('assets/blure.png'),
                      placeholder: AssetImage(
                        'assets/placegit.gif',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 35),
                      child: Text(
                        "OFFLINE",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Stack(
                  children: [
                    FadeInImage(
                      fit: BoxFit.cover,
                      width: width / 2 - 30,
                      height: 70,
                      image: AssetImage('assets/blure.png'),
                      placeholder: AssetImage(
                        'assets/placegit.gif',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, left: 40),
                      child: Text(
                        "ACTION",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
