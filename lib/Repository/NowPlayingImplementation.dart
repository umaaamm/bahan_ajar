import 'package:belajar/Common/ApiService.dart';
import 'package:belajar/Model/ListMovie/movie_list.dart';
import 'package:belajar/Model/NowPlaying/now_playing_list.dart';
import 'package:belajar/Services/now_playing_list_service.dart';
import 'package:dio/dio.dart';

import '../Helper/main_failure.dart';
import 'package:dartz/dartz.dart';

import 'dart:developer';

class NowPlayingListImplementation extends NowPlayingListService {
  final dio = Dio();
  NowPlayingListImplementation.internal();
  static NowPlayingListImplementation instance = NowPlayingListImplementation.internal();

  NowPlayingListImplementation factory() {
    return instance;
  }

  @override
  Future<Either<MainFailure, NowPlayingList>> getNowPlayingList() async {
    try {
      final url = EndPoints().getNowPlaying;

      final response = await dio.get(url);

      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = NowPlayingList.fromJson(response.data);
        return Right(result);
      } else {
        return const Left(MainFailure.serverFailure());
      }
    } catch (e) {
      log(e.toString());
      return const Left(MainFailure.clientFailure());
    }
  }
}
