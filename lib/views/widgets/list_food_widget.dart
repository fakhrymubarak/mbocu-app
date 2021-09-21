import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:mbocu_app/controller/item_details_controller.dart';
import 'package:mbocu_app/models/ItemDetailsDTO.dart';
import 'package:mbocu_app/themes/text_styles.dart';
import 'package:mbocu_app/utils/money_convertion.dart';

class ListFoodWidget extends StatelessWidget {
  ListFoodWidget(this.listFood, this._controller);

  final List<ItemDetails>? listFood;
  final  ItemDetailsController _controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: listFood == null ? 0 : listFood!.length,
        scrollDirection: Axis.vertical,
        padding: EdgeInsetsDirectional.only(top: 8.h, bottom: 8.h),
        itemBuilder: (BuildContext context, int index) {
          return _itemWidget(index);
        },
      ),
    );
  }

  Widget _itemWidget(int index) {
    ItemDetails item = listFood![index];
    return InkWell(
      onTap: () {
        Get.toNamed('/details/${item.id}');
        _controller.loadItemDetails();
      },
      child: Container(
        margin: EdgeInsetsDirectional.only(top: 8.h, bottom: 8.h),
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
                      child: Image.asset('assets/images/img_default_item.jpg'),
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
                      Text(item.name!, style: tsRegularBold),
                      SizedBox(height: 4.h),
                      Text(intToRupiah(item.price!), style: tsSmall)
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
