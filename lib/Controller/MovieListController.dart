import 'package:belajar/Model/ListMovie/result_data.dart';
import 'package:belajar/Repository/MovieListImplementation.dart';
import 'package:belajar/Repository/NowPlayingImplementation.dart';
import 'package:get/get.dart';

class MovieListController extends GetxController {
  Rx<ResultData> resultData =
      ResultData(resultData: [], isError: false, isLoading: true).obs;
  Rx<int> pageNum = 0.obs;

  getMovieList() async {
    try {
      pageNum = (pageNum.value + 1).obs;
      if (pageNum > 500) {
        return;
      }

      print("pageNum: ${pageNum.value}");

      final response = await MovieListImplementation.instance
          .getMovies(pageNum: pageNum.value);

      resultData.value = response.fold(
              (mainFailure) =>
              ResultData(resultData: [], isError: true, isLoading: false),
              (result) => ResultData(
              resultData: result.results, isError: false, isLoading: false));
    } catch (e) {
      resultData.value =
          ResultData(resultData: [], isError: true, isLoading: false);
    }
  }
}
