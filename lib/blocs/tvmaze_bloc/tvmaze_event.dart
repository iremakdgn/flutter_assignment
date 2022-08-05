part of 'tvmaze_bloc.dart';

abstract class TvMazeEvent extends Equatable {
  const TvMazeEvent();

  @override
  List<Object> get props => [];
}

class GetTvMazeListed extends TvMazeEvent {}

class GetTvMazeSearched extends TvMazeEvent {
  const GetTvMazeSearched(this.query);
  final String query;

  @override
  List<Object> get props => [query];
}
