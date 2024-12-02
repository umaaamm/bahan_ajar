import 'package:belajar/Model/ListMovie/result_data.dart';
import 'package:belajar/Model/NowPlaying/result_now_playing_data.dart';
import 'package:belajar/Repository/MovieListImplementation.dart';
import 'package:belajar/Repository/NowPlayingImplementation.dart';
import 'package:get/get.dart';

class NowPlayingListController extends GetxController {
  Rx<ResultNowPlayingData> resultData =
      ResultNowPlayingData(resultData: [], isError: false, isLoading: true).obs;

  getNowPlayingList() async {
    try {
      final response = await NowPlayingListImplementation.instance
          .getNowPlayingList();

      resultData.value = response.fold(
              (mainFailure) =>
                  ResultNowPlayingData(resultData: [], isError: true, isLoading: false),
              (result) => ResultNowPlayingData(
              resultData: result.results, isError: false, isLoading: false));
    } catch (e) {
      resultData.value =
          ResultNowPlayingData(resultData: [], isError: true, isLoading: false);
    }
  }
}
