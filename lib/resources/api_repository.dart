import 'package:flutter_assignment/models/tvmaze_model.dart';

import 'api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<List<TvMazeModel>> fetchTvMazeList() {
    return _provider.fetchTvMazeList();
  }

  Future<List<TvMazeModel>> search(String q) {
    return _provider.search(q);
  }
}

class NetworkError extends Error {}
