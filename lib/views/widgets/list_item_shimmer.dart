import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mbocu_app/views/widgets/shimmer_box.dart';

class ListItemsShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230.h,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsetsDirectional.only(start: 8.w, end: 8.h),
        itemBuilder: (BuildContext context, int index) {
          return _itemWidget(index);
        },
      ),
    );
  }

  Widget _itemWidget(int index) {
    return Container(
      margin: EdgeInsetsDirectional.only(start: 8.w, end: 8.h),
      child: InkWell(
        onTap: () => Get.toNamed('/details/0'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            showShimmerBox(170.h, 150.w),
            SizedBox(height: 12.h),
            showShimmerBox(10.h, 70.w),
            SizedBox(height: 4.h),
            Row(
              children: [
                showShimmerBox(10.h, 50.w),
                showShimmerBox(10.h, 50.w),
              ],
            ),
            SizedBox(height: 4.h),
            showShimmerBox(10.h, 70.w),
          ],
        ),
      ),
    );
  }
}
