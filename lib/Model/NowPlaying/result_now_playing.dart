import 'package:json_annotation/json_annotation.dart';

import '../../Constant/Constant.dart';

part 'result_now_playing.g.dart';

@JsonSerializable()
class ResultNowPlaying {
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'original_title')
  String? originalTitle;


  String get() => '$imageAppendUrl$backdropPath';
  ResultNowPlaying({this.backdropPath, this.originalTitle});

  factory ResultNowPlaying.fromJson(Map<String, dynamic> json) {
    return _$ResultNowPlayingFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResultNowPlayingToJson(this);
}
