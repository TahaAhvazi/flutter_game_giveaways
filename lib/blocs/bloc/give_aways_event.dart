part of 'give_aways_bloc.dart';

abstract class GiveAwaysEvent extends Equatable {
  const GiveAwaysEvent();

  @override
  List<Object> get props => [];
}

class GiveAwaysFetchedEvent extends GiveAwaysEvent {}
