// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'now_playing_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NowPlayingList _$NowPlayingListFromJson(Map<String, dynamic> json) =>
    NowPlayingList(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => ResultNowPlaying.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NowPlayingListToJson(NowPlayingList instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
