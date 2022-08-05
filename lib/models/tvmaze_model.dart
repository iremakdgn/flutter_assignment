import 'package:equatable/equatable.dart';

dynamic tvMazeModelListToJson(List<TvMazeModel> data) => List<dynamic>.from(data.map((x) => x.toJson()));
List<TvMazeModel> tvMazeModelListFromJson(dynamic obj) => List<TvMazeModel>.from(obj.map((x) => TvMazeModel.fromJson(x)));
List<TvMazeModel> tvMazeModelListFromSearchJson(dynamic obj) => List<TvMazeModel>.from(obj.map((x) => TvMazeModel.fromJson(x["show"])));

class TvMazeModel extends Equatable {
  int? id;
  String? url;
  String? name;
  String? type;
  String? language;
  List<String>? genres;
  ImageModel? image;
  String? summary;
  String? error;

  @override
  List<Object?> get props => [id, url, name, type, language, genres, image, summary, error];

  TvMazeModel.withError(String errorMessage) {
    error = errorMessage;
  }

  TvMazeModel({this.id, this.url, this.name, this.type, this.language, this.genres, this.image, this.summary});

  TvMazeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    name = json['name'];
    type = json['type'];
    language = json['language'];
    genres = json['genres'].cast<String>();
    image = json['image'] != null ? ImageModel.fromJson(json['image']) : null;
    summary = json['summary'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['url'] = url;
    data['name'] = name;
    data['type'] = type;
    data['language'] = language;
    data['genres'] = genres;
    if (image != null) {
      data['image'] = image!.toJson();
    }
    data['summary'] = summary;
    return data;
  }
}

class ImageModel extends Equatable {
  String? medium;
  String? original;

  @override
  // TODO: implement props
  List<Object?> get props => [medium, original];

  ImageModel({this.medium, this.original});

  ImageModel.fromJson(Map<String, dynamic> json) {
    medium = json['medium'];
    original = json['original'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['medium'] = medium;
    data['original'] = original;
    return data;
  }
}
