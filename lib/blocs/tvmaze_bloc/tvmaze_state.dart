part of 'tvmaze_bloc.dart';

abstract class TvMazeState extends Equatable {
  const TvMazeState();

  @override
  List<Object?> get props => [];
}

class TvMazeInitial extends TvMazeState {}

class TvMazeLoading extends TvMazeState {}

class TvMazeLoaded extends TvMazeState {
  final List<TvMazeModel> tvMazeModel;
  const TvMazeLoaded(this.tvMazeModel);
}

class TvMazeSearch extends TvMazeState {
  final String query;
  const TvMazeSearch(this.query);

  TvMazeSearch copyWith({String? query}) {
    return TvMazeSearch(
      query ?? this.query,
    );
  }
}

class TvMazeError extends TvMazeState {
  final String? message;
  const TvMazeError(this.message);
}
