import 'package:belajar/Model/NowPlaying/now_playing_list.dart';
import 'package:dartz/dartz.dart';

import '../Helper/main_failure.dart';

abstract class NowPlayingListService {
  Future<Either<MainFailure, NowPlayingList>> getNowPlayingList();
}

