
import 'package:belajar/Constant/Constant.dart';

class EndPoints {
  final getMoviesUrl =
      '$baseUrl/discover/movie?api_key=e0fbe343b5da81336bd33336f637962c&page={pagenumber}';
  final getNowPlaying = '$baseUrl/movie/now_playing?api_key=e0fbe343b5da81336bd33336f637962c&page=1';
}