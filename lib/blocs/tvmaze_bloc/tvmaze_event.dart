part of 'tvmaze_bloc.dart';

abstract class TvMazeEvent extends Equatable {
  const TvMazeEvent();

  @override
  List<Object> get props => [];
}

class GetTvMazeList extends TvMazeEvent {}

class GetTvMazeSearch extends TvMazeEvent {
  const GetTvMazeSearch(this.query);
  final String query;

  @override
  List<Object> get props => [query];
}
