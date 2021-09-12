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

  Widget build(BuildContext context) {
    List<String> list = ["1", "2", "3", "4", "5", "6"];
    return Container(
      color: colorWhite,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _headerHomePage(),
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
        ),
      ),
    );
  }

  _headerHomePage() {
    return Stack(
      children: [
        Image.asset('assets/images/img_header_bg.png'),
        Container(
          margin: EdgeInsets.only(left: 16.w, top: 16.h),
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
              Text(
                "Diantar ke: Limus Pratama Regency",
                style: tsHeading2,
              )
            ],
          ),
        ),
      ],
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
