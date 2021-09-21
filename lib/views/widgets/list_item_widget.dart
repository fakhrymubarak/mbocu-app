import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mbocu_app/models/ItemsByLocationDTO.dart';
import 'package:mbocu_app/themes/text_styles.dart';
import 'package:mbocu_app/utils/money_convertion.dart';

class ListItemsWidget extends StatelessWidget {
  ListItemsWidget(this.listItems);

  final List<FoodItem>? listItems;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 230.h,
      child: ListView.builder(
        itemCount: listItems == null ? 0 : listItems!.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsetsDirectional.only(start: 8.w, end: 8.h),
        itemBuilder: (BuildContext context, int index) {
          return _itemWidget(index);
        },
      ),
    );
  }

  Widget _itemWidget(int index) {
    FoodItem item = listItems![index];
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
                  child: Image.asset('assets/images/img_default_item.jpg'),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Text(item.name!, style: tsRegularBold),
            SizedBox(height: 4.h),
            Row(
              children: [
                Text("Mulai dari ", style: tsSmall),
                Text(intToRupiah(item.price!), style: tsSmallBold),
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
