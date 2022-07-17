import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_game_reward/blocs/bloc/give_aways_bloc.dart';
import 'package:flutter_game_reward/widgets/categories.dart';
import 'package:flutter_game_reward/widgets/giveawayslist.dart';
import 'package:flutter_game_reward/widgets/storiesListview.dart';
import 'package:lottie/lottie.dart';

import 'giveaway_detail.dart';

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
        backgroundColor: Color.fromARGB(255, 0, 1, 41),
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
              return SingleChildScrollView(
                child: Column(
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
                          return GestureDetector(
                            onTap: () {
                              print("Clicledddd");
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => GiveAwayDetailRoute(
                                    title: state.giveAways[index].title,
                                    imageUrl: state.giveAways[index].image,
                                    description:
                                        state.giveAways[index].description,
                                    instructions:
                                        state.giveAways[index].instructions,
                                    open_giveaway_url:
                                        state.giveAways[index].openGiveaway,
                                    published_date: state
                                        .giveAways[index].publishedDate
                                        .toString(),
                                    type:
                                        state.giveAways[index].type.toString(),
                                    platforms: state.giveAways[index].platforms
                                        .toString(),
                                    end_date:
                                        state.giveAways[index].users.toString(),
                                    users:
                                        state.giveAways[index].users.toString(),
                                    status: state.giveAways[index].status
                                        .toString(),
                                    gamerpower_url:
                                        state.giveAways[index].gamerpowerUrl,
                                    open_giveaway:
                                        state.giveAways[index].openGiveaway,
                                    herotag: index.toString(),
                                  ),
                                ),
                              );
                            },
                            child: StoriesListView(
                                giveAways: state.giveAways[index]),
                          );
                        },
                      ),
                    ),
                    CategoriWidget(),
                    Padding(
                      padding: const EdgeInsets.only(
                        right: 200.0,
                        left: 10,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Most Popular ❤️‍🔥",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      height: height * 48 / 100,
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: state.giveAways.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              print("Clicledddd");
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => GiveAwayDetailRoute(
                                    title: state.giveAways[index].title,
                                    imageUrl: state.giveAways[index].image,
                                    description:
                                        state.giveAways[index].description,
                                    instructions:
                                        state.giveAways[index].instructions,
                                    open_giveaway_url:
                                        state.giveAways[index].openGiveaway,
                                    published_date: state
                                        .giveAways[index].publishedDate
                                        .toString(),
                                    type:
                                        state.giveAways[index].type.toString(),
                                    platforms: state.giveAways[index].platforms
                                        .toString(),
                                    end_date:
                                        state.giveAways[index].users.toString(),
                                    users:
                                        state.giveAways[index].users.toString(),
                                    status: state.giveAways[index].status
                                        .toString(),
                                    gamerpower_url:
                                        state.giveAways[index].gamerpowerUrl,
                                    open_giveaway:
                                        state.giveAways[index].openGiveaway,
                                    herotag: index.toString(),
                                  ),
                                ),
                              );
                            },
                            child: Hero(
                              tag: index,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 18.0, bottom: 10.0),
                                child: Column(
                                  children: [
                                    GiveAwaysList(
                                      giveAways: state.giveAways[index],
                                    ),
                                    SizedBox(height: height * 4 / 100)
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              );
            }
            return const Center(child: Text("UNKNOWN ERROR OCUURED"));
          },
        ),
      ),
    );
  }
}
