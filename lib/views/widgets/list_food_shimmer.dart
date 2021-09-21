import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mbocu_app/views/widgets/shimmer_box.dart';

class ListFoodShimmer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 10,
        scrollDirection: Axis.vertical,
        padding: EdgeInsetsDirectional.only(top: 8.w, bottom: 8.h),
        itemBuilder: (BuildContext context, int index) {
          return _itemWidget(index);
        },
      ),
    );
  }

  Widget _itemWidget(int index) {
    return Container(
      margin: EdgeInsetsDirectional.only(top: 8.w, bottom: 8.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              showShimmerBox(80.h, 130.w),
              Container(
                margin: EdgeInsetsDirectional.only(start: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 12.h),
                    showShimmerBox(20.h, 150.w),
                    SizedBox(height: 4.h),
                    showShimmerBox(20.h, 130.w)
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
