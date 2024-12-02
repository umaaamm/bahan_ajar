import 'package:json_annotation/json_annotation.dart';

import '../../Constant/Constant.dart';

part 'result.g.dart';

@JsonSerializable()
class Result {
  @JsonKey(name: 'original_title')
  String? originalTitle;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'overview')
  String? overview;
  @JsonKey(name: 'release_date')
  String? releaseDate;
  @JsonKey(name: 'vote_average')
  double? voteAverage;

  String get() => '$imageAppendUrl$posterPath';
  Result({this.originalTitle, this.posterPath, this.overview, this.releaseDate, this.voteAverage});

  factory Result.fromJson(Map<String, dynamic> json) {
    return _$ResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
