import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_game_reward/services/giveawaysServices.dart';

part 'give_aways_event.dart';
part 'give_aways_state.dart';

class GiveAwaysBloc extends Bloc<GiveAwaysEvent, GiveAwaysState> {
  final GetGiveAwaysSservice _getGiveAwaysSservice;
  GiveAwaysBloc(this._getGiveAwaysSservice) : super(GiveAwaysLoadingState()) {
    on<GiveAwaysFetchedEvent>((event, emit) async {
      GiveAwaysLoadingState();
      final myGiveAwaysList = await _getGiveAwaysSservice.getGiveAways();
      emit(GiveAwaysLoadedState(giveAways: myGiveAwaysList));
      print(state);
    });
  }
}
