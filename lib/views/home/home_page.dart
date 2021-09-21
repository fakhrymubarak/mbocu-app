import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mbocu_app/controller/home_controller.dart';
import 'package:mbocu_app/models/ItemsByLocationDTO.dart';
import 'package:mbocu_app/themes/colors.dart';
import 'package:mbocu_app/themes/text_styles.dart';
import 'package:mbocu_app/views/widgets/list_item_shimmer.dart';
import 'package:mbocu_app/views/widgets/list_item_widget.dart';
import 'package:mbocu_app/views/widgets/modal_bottom_sheet_widget.dart';
import 'package:mbocu_app/views/widgets/shimmer_box.dart';

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
          _scrollController.position.pixels < 80.h &&
          isAppBarShown.value == 1) {
        isAppBarShown.value = 0;
      }
      x = _scrollController.position.pixels;
    });
  }

  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: _scrollController,
      slivers: <Widget>[
        _headerHomePage(),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Obx(() => _controller.itemsByLocation.value.data == null
                  ? _loadingWidgets()
                  : _successWidgets(_controller.itemsByLocation.value.data))
            ],
          ),
        ),
      ],
    );
  }

  _successWidgets(List<FoodItem>? list) {
    return Column(
      children: [
        SizedBox(height: 16.h),
        _searchBar(),
        SizedBox(height: 16.h),
        _imgPromoHomePage(),
        SizedBox(height: 20.h),
        _listItem("For You", list),
        SizedBox(height: 20.h),
        _listItem("Best Seller", list),
        SizedBox(height: 20.h),
      ],
    );
  }

  _loadingWidgets() {
    return Column(
      children: [
        SizedBox(height: 16.h),
        _searchBar(),
        SizedBox(height: 16.h),
        showShimmerBox(226.h, 370.w),
        SizedBox(height: 20.h),
        ListItemsShimmer(),
        SizedBox(height: 20.h),
        ListItemsShimmer(),
        SizedBox(height: 20.h),
      ],
    );
  }

  _headerHomePage() {
    return SliverAppBar(
      pinned: true,
      snap: false,
      floating: false,
      backgroundColor: colorWhite,
      expandedHeight: 150.h,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          children: [
            Container(
              height: 150.h,
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
                  SizedBox(height: 28.h),
                  Text(
                    "Hi, Mbocu User!",
                    style: tsHeading1,
                  ),
                  SizedBox(height: 8.h),
                  InkWell(
                    child: Text(
                      "Diantar ke: " + _controller.locationName,
                      style: tsHeading2,
                    ),
                    onTap: () => displayBottomSheet(context),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      title: InkWell(
        child: ValueListenableBuilder(
          valueListenable: isAppBarShown,
          builder: (context, value, widget) {
            return value == 1
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Diantar ke:",
                        style: tsHeading1,
                      ),
                      Text(
                        _controller.locationName,
                        style: tsHeading2,
                      )
                    ],
                  )
                : SizedBox();
          },
        ),
        onTap: () => displayBottomSheet(context),
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

  _listItem(String title, List<FoodItem>? list) {
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
