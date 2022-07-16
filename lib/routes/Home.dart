import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_game_reward/blocs/bloc/give_aways_bloc.dart';
import 'package:flutter_game_reward/widgets/giveawayslist.dart';
import 'package:flutter_game_reward/widgets/storiesListview.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return BlocProvider<GiveAwaysBloc>(
      create: (context) => GiveAwaysBloc(RepositoryProvider.of(context))
        ..add(GiveAwaysFetchedEvent()),
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Color.fromARGB(255, 36, 37, 88),
          title: Row(
            children: [
              const Text(
                "Taha.",
                style: TextStyle(
                  color: Color.fromARGB(255, 199, 199, 199),
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              const Text(
                "Codes",
                style: TextStyle(
                    color: Color.fromARGB(255, 29, 101, 160),
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
            ],
          ),
          centerTitle: false,
        ),
        body: BlocBuilder<GiveAwaysBloc, GiveAwaysState>(
          builder: (context, state) {
            if (state is GiveAwaysLoadingState) {
              return Center(
                child: Lottie.asset("assets/splashLoading.json",
                    height: 80, width: 80),
              );
            }
            if (state is GiveAwaysLoadedState) {
              return Column(
                children: [
                  Container(
                    height: height * 15 / 100,
                    width: width,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 36, 37, 88),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(22),
                        bottomRight: Radius.circular(22),
                      ),
                    ),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return StoriesListView(
                            giveAways: state.giveAways[index]);
                      },
                    ),
                  ),
                  Container(
                    height: height * 70 / 100,
                    child: ListView.builder(
                      itemCount: state.giveAways.length,
                      itemBuilder: (context, index) {
                        return GiveAwaysList(
                          giveAways: state.giveAways[index],
                        );
                      },
                    ),
                  ),
                ],
              );
            }
            return const Center(child: Text("UNKNOWN ERROR OCUURED"));
          },
        ),
      ),
    );
  }
}
