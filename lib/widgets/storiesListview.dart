import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_game_reward/services/giveawaysServices.dart';

import '../blocs/bloc/give_aways_bloc.dart';

class StoriesListView extends StatelessWidget {
  final GiveAways giveAways;
  const StoriesListView({Key? key, required this.giveAways}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: SizedBox(
        child: Row(
          children: [
            BlocBuilder<GiveAwaysBloc, GiveAwaysState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Container(
                      height: height * 9 / 100,
                      width: width * 15 / 100,
                      decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.blueAccent, width: 2.0),
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          giveAways.thumbnail,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 1.5 / 100,
                    ),
                    Text(
                      giveAways.title.substring(0, 5),
                      maxLines: 1,
                      style: TextStyle(
                        color: Color.fromARGB(255, 184, 184, 184),
                        fontWeight: FontWeight.w700,
                      ),
                    )
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
