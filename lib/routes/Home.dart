import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_game_reward/blocs/bloc/give_aways_bloc.dart';
import 'package:flutter_game_reward/widgets/giveawayslist.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<GiveAwaysBloc>(
      create: (context) => GiveAwaysBloc(RepositoryProvider.of(context))
        ..add(GiveAwaysFetchedEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("All Give Aways"),
          centerTitle: true,
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
              return ListView.builder(
                itemCount: state.giveAways.length,
                itemBuilder: (context, index) {
                  return GiveAwaysList(
                    giveAways: state.giveAways[index],
                  );
                },
              );
            }
            return const Center(child: Text("UNKNOWN ERROR OCUURED"));
          },
        ),
      ),
    );
  }
}
