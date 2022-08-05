// ignore_for_file: prefer_const_constructors
import 'package:flutter_assignment/blocs/tvmaze_bloc/tvmaze_bloc.dart';
import 'package:flutter_assignment/models/tvmaze_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const List<TvMazeModel> tvMazeModel = [];
  const String query = "test";
  const String errorMessage = "error";
  group('TvMazeState', () {
    test('supports value comparison', () {
      expect(TvMazeInitial(), TvMazeInitial());
      expect(TvMazeLoading(), TvMazeLoading());
      expect(TvMazeLoaded(tvMazeModel), TvMazeLoaded(tvMazeModel));
      expect(TvMazeSearch(query), TvMazeSearch(query));
      expect(TvMazeError(errorMessage), TvMazeError(errorMessage));
    });
  });
}
