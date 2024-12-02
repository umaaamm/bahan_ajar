import 'package:belajar/Model/NowPlaying/result_now_playing.dart';
import 'package:json_annotation/json_annotation.dart';

part 'now_playing_list.g.dart';

@JsonSerializable()
class NowPlayingList {
  @JsonKey(name: 'results')
  List<ResultNowPlaying>? results;

  NowPlayingList({this.results});

  factory NowPlayingList.fromJson(Map<String, dynamic> json) {
    return _$NowPlayingListFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NowPlayingListToJson(this);
}
