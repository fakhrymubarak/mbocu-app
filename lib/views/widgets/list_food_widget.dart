import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mbocu_app/themes/text_styles.dart';

class ListFoodWidget extends StatelessWidget {
  ListFoodWidget(this.listFood);

  final List<String> listFood;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: listFood.length,
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
              Container(
                width: 130.w,
                height: 80.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.r),
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: Image.asset('assets/images/img_promo_cover.png'),
                  ),
                ),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 12,
                      offset: Offset(0, 4.w),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(start: 8.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 12.h),
                    Text("Sate Ayam dan Tempe", style: tsRegularBold),
                    SizedBox(height: 4.h),
                    Text("Rp27.000", style: tsSmall)
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
