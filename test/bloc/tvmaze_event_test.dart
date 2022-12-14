import 'package:flutter_assignment/blocs/tvmaze_bloc/tvmaze_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const query = 'mock-query';
  group('TvMazeEvent', () {
    group('GetTvMazeList', () {
      test('supports value comparison', () {
        expect(GetTvMazeListed(), GetTvMazeListed());
      });
    });

    group('GetTvMazeSearch', () {
      test('supports value comparison', () {
        expect(const GetTvMazeSearched(query), const GetTvMazeSearched(query));
      });
    });
  });
}
