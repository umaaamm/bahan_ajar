
import 'package:belajar/Model/NowPlaying/result_now_playing.dart';

class ResultNowPlayingData {
  final List<ResultNowPlaying>? resultData;
  final bool isError;
  final bool isLoading;

  ResultNowPlayingData(
      {required this.resultData,
        required this.isError,
        required this.isLoading});
}
