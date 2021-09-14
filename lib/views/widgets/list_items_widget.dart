import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mbocu_app/themes/text_styles.dart';

class ListItemsWidget extends StatelessWidget {
  ListItemsWidget(this.listItems);

  final List<String> listItems;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230.h,
      child: ListView.builder(
        itemCount: listItems.length,
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
            Container(
              height: 170.h,
              width: 150.w,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10.r),
                child: FittedBox(
                  fit: BoxFit.cover,
                  child: Image.asset('assets/images/img_promo_cover.png'),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Text("Dapur 88", style: tsRegularBold),
            SizedBox(height: 4.h),
            Row(
              children: [
                Text("Mulai dari ", style: tsSmall),
                Text("Rp30.000 ", style: tsSmallBold),
              ],
            ),
            SizedBox(height: 4.h),
            Text("Lunch Time • Personal", style: tsSmall)
          ],
        ),
      ),
    );
  }
}
