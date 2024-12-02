// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
      originalTitle: json['original_title'] as String?,
      posterPath: json['poster_path'] as String?,
      overview: json['overview'] as String?,
      releaseDate: json['release_date'] as String?,
      voteAverage: (json['vote_average'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
      'original_title': instance.originalTitle,
      'poster_path': instance.posterPath,
      'overview': instance.overview,
      'release_date': instance.releaseDate,
      'vote_average': instance.voteAverage,
    };
