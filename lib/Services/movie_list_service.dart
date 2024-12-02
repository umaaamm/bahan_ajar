import 'package:belajar/Model/ListMovie/movie_list.dart';
import 'package:belajar/Model/NowPlaying/now_playing_list.dart';
import 'package:dartz/dartz.dart';

import '../Helper/main_failure.dart';

abstract class MovieListService {
  Future<Either<MainFailure, MovieList>> getMovies({required int pageNum});
}

