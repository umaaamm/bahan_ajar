import 'dart:ui';

import 'package:belajar/Constant/Constant.dart';
import 'package:belajar/Utils/Utils.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeExample extends StatefulWidget {
  const HomeExample({super.key});

  @override
  State<HomeExample> createState() => _HomeExampleState();
}

class _HomeExampleState extends State<HomeExample> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).viewPadding.top;

    return Container(
      color: ColorBiru,
      child: SafeArea(
        top: false,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            margin: EdgeInsets.only(top: height),
            padding: const EdgeInsets.only(left: 23, right: 23),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  HeaderWidget(),
                  SizedBox(height: 20.h),
                  SearchWidget(),
                  SizedBox(height: 20.h),
                  CarouselWidget(),
                  SizedBox(height: 20.h),
                  CategoryWidget(),
                  SizedBox(height: 20.h),
                  MenuGridWidget(),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Text(
                        "Promo Today",
                        style: TextStyle(
                            fontSize: getResponsiveFontSize(context, 18).sp, fontWeight: FontWeight.normal),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  CarouselWidget(),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Container(
            height: 65,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0.r),
                topRight: Radius.circular(16.0.r),
              ),
              child: BottomNavigationBar(
                currentIndex: _selectedIndex,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white60,
                backgroundColor: ColorBiru,
                onTap: (index) {
                  print(index);
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                      icon: Icon(Icons.home), label: "Home"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.shopping_cart), label: "Cart"),
                  BottomNavigationBarItem(
                      icon: Stack(
                        children: [
                          Icon(Icons.notifications),
                          Positioned(
                            // draw a red marble
                            top: 0.0,
                            right: 0.0,
                            child: Icon(Icons.brightness_1,
                                size: 8.0, color: Colors.redAccent),
                          )
                        ],
                      ),
                      label: "Notification"),
                  BottomNavigationBarItem(
                      icon: Icon(Icons.settings), label: "Settings"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MenuGridWidget extends StatelessWidget {
  const MenuGridWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    double mainAxisExtent = screenHeight * 0.15; // Adjust percentage as needed
    double maxHeight = 90.0;  // You can adjust this value as needed

    mainAxisExtent = mainAxisExtent > maxHeight ? maxHeight : mainAxisExtent;

    return GridView(
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 0),
      physics: NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        // mainAxisSpacing: 10,
        mainAxisExtent: mainAxisExtent.h,
      ),
      children: <Widget>[
        MenuWidget(menuName: "Fruits"),
        MenuWidget(menuName: "Vegetables"),
        MenuWidget(menuName: "Meat"),
        MenuWidget(menuName: "Seafood"),
        MenuWidget(menuName: "Dairy"),
        MenuWidget(menuName: "Grains"),
        MenuWidget(menuName: "Fruits"),
        MenuWidget(menuName: "Vegetables"),
      ],
    );
  }
}

class MenuWidget extends StatefulWidget {
  String menuName = "";

  MenuWidget({super.key, required this.menuName});

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    double spacing = screenHeight * 0.01;

    return Column(children: [
      Container(
          height:50.h,
          width: 50.w,
          child: Image(image: AssetImage("assets/menu.png"))),
      SizedBox(height: spacing),
      Text(
        widget.menuName,
        style: TextStyle(fontSize: getResponsiveFontSize(context, 14).sp),
      ),
    ]);
  }
}

class CategoryWidget extends StatelessWidget {
  const CategoryWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Category",
          style: TextStyle(
              fontSize: getResponsiveFontSize(context, 18).sp,
              fontWeight: FontWeight.w500),
        ),
        Spacer(),
        Text(
          "See all",
          style: TextStyle(
              fontSize: getResponsiveFontSize(context, 16).sp, color: AbuAbu),
        ),
      ],
    );
  }
}

class CarouselWidget extends StatelessWidget {
  const CarouselWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: 4,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            image: DecorationImage(
                image: AssetImage("assets/product2.png"), fit: BoxFit.fill)),
      ),
      options: CarouselOptions(
          autoPlay: true,
          enlargeCenterPage: true,
          viewportFraction: 1,
          aspectRatio: 2.0,
          initialPage: 0,
          height: 100.h),
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        border: Border.all(color: AbuAbu, width: 2.w),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Center(
        child: const TextField(
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search, color: ColorBiru),
            hintText: "What are u looking for ?",
            border: InputBorder.none,
            suffixIcon: Icon(Icons.camera_alt_outlined, color: AbuAbu),
          ),
        ),
      ),
    );
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double widthInPixels = 144.w;
    double percentage = widthInPixels / ScreenUtil().screenWidth;
    // Base font size multiplied by scaling factor
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 1,
          child: Container(
            height: 50.h,
            width: MediaQuery.of(context).size.width * percentage,
            decoration: BoxDecoration(
              border: Border.all(color: ColorBiru, width: 2.w),
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: 10.w), // Add padding to the left if needed
                  child: Image.asset("assets/loc.png"),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                        right: 10.w), // Add padding to the right side of text
                    child: Center(
                      child: Text(
                        "Algiers, 476CP...",
                        style: TextStyle(
                          fontSize: getResponsiveFontSize(context, 12).sp,
                          fontWeight: FontWeight.w500,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // SizedBox(width: 10.w),
        Flexible(
          flex: 1,
          child: Container(
            height: 70.h,
            width: MediaQuery.of(context).size.width * percentage,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: Image(
                    image: AssetImage("assets/motorbike.png"),
                  ),
                ),
                Expanded(
                  child: Padding(
                      padding: EdgeInsets.only(
                          right: 10.w), // Add padding to the right side of text
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              "Free Delivery",
                              style: TextStyle(
                                fontSize: getResponsiveFontSize(context, 14).sp,
                                color: AbuAbu,
                                fontWeight: FontWeight.w500,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Center(
                            child: Text(
                              "800da +",
                              style: TextStyle(
                                fontSize: getResponsiveFontSize(context, 14).sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
        // SizedBox(width: 10.w),
        Flexible(
          flex: 1,
          child: Container(
            width: 50.w,
            child: Image(
              image: AssetImage("assets/human.png"),
            ),
          ),
        ),
      ],
    );
  }
}
