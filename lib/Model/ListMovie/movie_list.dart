import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'movie_list.g.dart';

@JsonSerializable()
class MovieList {
  @JsonKey(name: 'results')
  List<Result>? results;

  MovieList({this.results});

  factory MovieList.fromJson(Map<String, dynamic> json) {
    return _$MovieListFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MovieListToJson(this);
}
