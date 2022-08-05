import 'package:dio/dio.dart';
import 'package:flutter_assignment/models/tvmaze_model.dart';

class ApiProvider {
  final Dio _dio = Dio();
  final String _url = 'https://api.tvmaze.com';

  Future<List<TvMazeModel>> fetchTvMazeList() async {
    try {
      Response response = await _dio.get("$_url/shows");
      return tvMazeModelListFromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return Future<List<TvMazeModel>>.error(error);
    }
  }

  Future<List<TvMazeModel>> search(String q) async {
    try {
      Response response = await _dio.get("$_url/search/shows?q=$q");
      return tvMazeModelListFromSearchJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return Future<List<TvMazeModel>>.error(error);
    }
  }
}
