import 'package:belajar/Controller/MovieListController.dart';
import 'package:belajar/Model/ListMovie/result.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ListMovieWidget extends StatefulWidget {
  const ListMovieWidget({super.key});

  @override
  State<ListMovieWidget> createState() => _ListMovieWidgetState();
}

class _ListMovieWidgetState extends State<ListMovieWidget> {
  final MovieListController controller = Get.put(MovieListController());
  List<Result> movieList = [];

  @override
  void initState() {
    super.initState();
    controller.getMovieList();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final result = controller.resultData.value;
      if (result.resultData == null) {
        return const Text('Something Went Wrong');
      }
      if (result.isError) {
        return const Center(child: Text('Error while fetching data'));
      } else if (result.isLoading) {
        return const Center(child: CircularProgressIndicator());
      } else if (result.resultData!.isEmpty) {
        return const Text('List is Empty');
      }

      movieList.addAll(result.resultData!);

      return ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (context, index) {
            return Container(
              padding: EdgeInsets.all(12),
              margin: EdgeInsets.only(bottom: 12, left: 12, right: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade200,
              ),
              child: Row(
                children: [
                  Container(
                    height: 100.h,
                    width: 75.w,
                    child:
                        Image.network(movieList[index].get(), fit: BoxFit.fill),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movieList[index].originalTitle ?? '',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          movieList[index].overview ?? '',
                          style: TextStyle(fontSize: 14),
                          maxLines: 3,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            Icon(Icons.star, size: 12, color: Colors.yellow),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              movieList[index].voteAverage.toString(),
                              style: TextStyle(fontSize: 12),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '(${movieList[index].releaseDate})',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          });
    });
  }
}
