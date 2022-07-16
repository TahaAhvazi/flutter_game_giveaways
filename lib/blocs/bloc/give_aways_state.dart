part of 'give_aways_bloc.dart';

abstract class GiveAwaysState extends Equatable {
  const GiveAwaysState();

  @override
  List<Object> get props => [];
}

class GiveAwaysLoadingState extends GiveAwaysState {
  @override
  List<Object> get props => [];
}

class GiveAwaysLoadedState extends GiveAwaysState {
  final List<GiveAways> giveAways;

  const GiveAwaysLoadedState({required this.giveAways});
  @override
  List<Object> get props => [giveAways];
}
