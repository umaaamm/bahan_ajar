import 'package:belajar/Common/ApiService.dart';
import 'package:belajar/Model/ListMovie/movie_list.dart';
import 'package:dio/dio.dart';

import '../Helper/main_failure.dart';
import 'package:dartz/dartz.dart';

import '../Services/movie_list_service.dart';
import 'dart:developer';

class MovieListImplementation extends MovieListService {
  final dio = Dio();
  MovieListImplementation.internal();
  static MovieListImplementation instance = MovieListImplementation.internal();

  MovieListImplementation factory() {
    return instance;
  }

  @override
  Future<Either<MainFailure, MovieList>> getMovies(
      {required int pageNum}) async {
    try {
      final url =
      EndPoints().getMoviesUrl.replaceFirst('{pagenumber}', '$pageNum');
      final response = await dio.get(url);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final result = MovieList.fromJson(response.data);
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
