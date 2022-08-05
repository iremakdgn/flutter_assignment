import 'package:flutter_assignment/models/tvmaze_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('TvMazeModel', () {
    test('supports value comparison', () {
      expect(
        TvMazeModel(
            id: 1,
            url: "tvmaze url",
            name: "tvmaze name",
            type: "tvmaze type",
            language: "tvmaze language",
            genres: ["tvmaze genres"],
            image: ImageModel(medium: "tvmaze medium", original: "tvmaze original"),
            summary: "tvmaze summary"),
        TvMazeModel(
            id: 1,
            url: "tvmaze url",
            name: "tvmaze name",
            type: "tvmaze type",
            language: "tvmaze language",
            genres: ["tvmaze genres"],
            image: ImageModel(medium: "tvmaze medium", original: "tvmaze original"),
            summary: "tvmaze summary"),
      );
    });
  });
}
