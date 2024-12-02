import 'package:belajar/Controller/NowPlayingListController.dart';
import 'package:belajar/Model/NowPlaying/result_now_playing.dart';
import 'package:belajar/Widgets/ListMovieWidget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomeMovie extends StatefulWidget {
  const HomeMovie({super.key});

  @override
  State<HomeMovie> createState() => _HomeMovieState();
}

class _HomeMovieState extends State<HomeMovie> {
  final NowPlayingListController controller =
      Get.put(NowPlayingListController());
  List<ResultNowPlaying> nowPlayingList = [];

  @override
  void initState() {
    super.initState();
    controller.getNowPlayingList();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Home Movie"),
          actions: [
            IconButton(
                onPressed: () {
                  controller.getNowPlayingList();
                },
                icon: Icon(Icons.refresh))
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              margin: EdgeInsets.only(bottom: 16),
              child: Text("Now Playing",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Obx(() {
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

              nowPlayingList.addAll(result.resultData!);

              return CarouselSlider.builder(
                itemCount: nowPlayingList.length,
                itemBuilder:
                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                        Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                          image: NetworkImage(nowPlayingList[itemIndex].get()),
                          fit: BoxFit.fill)),
                ),
                options: CarouselOptions(
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.95,
                    aspectRatio: 2.0,
                    initialPage: 0,
                    height: 200),
              );
            }),
            SizedBox(
              height: 16,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              margin: EdgeInsets.only(bottom: 16),
              child: Text("List Movie",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ),
            Expanded(
              child: ListMovieWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

