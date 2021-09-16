import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mbocu_app/controller/home_controller.dart';
import 'package:mbocu_app/themes/colors.dart';
import 'package:mbocu_app/themes/text_styles.dart';
import 'package:mbocu_app/views/widgets/list_items_widget.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeController _controller = Get.find();
  ScrollController _scrollController = ScrollController();
  ValueNotifier<int> isAppBarShown = ValueNotifier<int>(0);

  @override
  void initState() {
    super.initState();
    _setupScrollListener();
  }

  void _setupScrollListener() {
    double x = 0;
    _scrollController.addListener(() {
      if (_scrollController.position.pixels > x &&
          _scrollController.position.pixels > 80.h &&
          isAppBarShown.value == 0) {
        isAppBarShown.value = 1;
      } else if (_scrollController.position.pixels < x &&
          isAppBarShown.value == 1) {
        isAppBarShown.value = 0;
      }
      x = _scrollController.position.pixels;
    });
  }

  Widget build(BuildContext context) {
    List<String> list = ["1", "2", "3", "4", "5", "6"];
    return CustomScrollView(
      controller: _scrollController,
      slivers: <Widget>[
        _headerHomePage(),
        SliverList(
          delegate: SliverChildListDelegate([
            SizedBox(height: 16.h),
            _searchBar(),
            SizedBox(height: 16.h),
            _imgPromoHomePage(),
            SizedBox(height: 20.h),
            _listItem("For You", list),
            SizedBox(height: 20.h),
            _listItem("Best Seller", list),
            SizedBox(height: 20.h),
          ]),
        ),
      ],
    );
  }

  _headerHomePage() {
    return SliverAppBar(
      pinned: true,
      snap: false,
      floating: false,
      backgroundColor: colorWhite,
      expandedHeight: 160.h,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Container(
              height: 160.h,
              width: 411.w,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/volkadot.png'),
                  fit: BoxFit.cover,
                ),
                color: colorPrimary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15.w),
                  bottomRight: Radius.circular(15.w),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 16.w, top: 24.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('assets/images/img_logo.png'),
                  SizedBox(
                    height: 28.h,
                  ),
                  Text(
                    "Hi, Mbocu User!",
                    style: tsHeading1,
                  ),
                  TextButton(
                    child: Text(
                      "Diantar ke: Linus Pratama Regency",
                      style: tsHeading2,
                    ),
                    onPressed: () => print('Pressed'),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.only(top: 0, left: 0),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      title: TextButton(
        child: ValueListenableBuilder(
          valueListenable: isAppBarShown,
          builder: (context, value, widget) {
            return value == 1
                ? Text(
              "Diantar ke: Linus Pratama Regency",
              style: tsHeading2,
            )
                : SizedBox();
          },
        ),
        onPressed: () => print('Pressed'),
        style: TextButton.styleFrom(
          padding: EdgeInsets.only(top: 0, left: 0),
        ),
      ),
      titleTextStyle: tsHeading2,
    );
  }

  _searchBar() {
    return Container(
      margin: EdgeInsets.only(left: 16.w, right: 16.w),
      child: TextField(
        style: tsRegular,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Colors.transparent, width: 0),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.r),
            borderSide: BorderSide(color: Colors.transparent, width: 0),
          ),
          contentPadding:
          EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          filled: true,
          fillColor: colorGreyLight,
          hintText: "Search Foods",
          hintStyle: tsRegular,
        ),
      ),
    );
  }

  _imgPromoHomePage() {
    return Container(
      margin: EdgeInsets.only(left: 16.w, right: 16.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.r),
        child: Image.asset('assets/images/img_promo_cover.png'),
      ),
    );
  }

  _listItem(String title, List<String> list) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: tsHeading2,
              ),
              InkWell(
                onTap: () => Get.toNamed('/details/0'),
                child: Text(
                  "Lihat Semua",
                  style: tsHeading2,
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 16.h),
        ListItemsWidget(list),
      ],
    );
  }
}
