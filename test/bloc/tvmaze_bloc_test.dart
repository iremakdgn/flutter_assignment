import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_assignment/blocs/tvmaze_bloc/tvmaze_bloc.dart';
import 'package:flutter_assignment/models/tvmaze_model.dart';
import 'package:flutter_assignment/resources/api_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockApiRepository extends Mock implements ApiRepository {}

void main() {
  late ApiRepository apiRepository;

  setUp(() {
    apiRepository = MockApiRepository();
  });

  group('TvMazeBloc', () {
    var tvMaze = [
      TvMazeModel(
          id: 1,
          url: "tvmaze url",
          name: "tvmaze name",
          type: "tvmaze type",
          language: "tvmaze language",
          genres: ["tvmaze genres"],
          image: ImageModel(medium: "tvmaze medium", original: "tvmaze original"),
          summary: "tvmaze summary")
    ];
    test('initial state is TvMazeState', () {
      final mazeBloc = TvMazeBloc(
        apiRepository: apiRepository,
      );
      expect(mazeBloc.state, TvMazeInitial());
    });
  });
}
