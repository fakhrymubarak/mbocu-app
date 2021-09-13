import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mbocu_app/controller/item_details_controller.dart';
import 'package:mbocu_app/themes/colors.dart';
import 'package:mbocu_app/themes/text_styles.dart';
import 'package:mbocu_app/views/widgets/list_food_widget.dart';

class ItemDetailsPage extends StatefulWidget {
  ItemDetailsPage({Key? key}) : super(key: key);

  @override
  _ItemDetailsPageState createState() => _ItemDetailsPageState();
}

class _ItemDetailsPageState extends State<ItemDetailsPage> {
  final ItemDetailsController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    List<String> list = ["1", "2", "3", "4", "5", "6"];

    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            _headerDetailsPage(),
            SizedBox(height: 16.h),
            _titleAndDescription(),
            SizedBox(height: 16.h),
            _listFood(list),
          ],
        ),
      ),
    );
  }

  _headerDetailsPage() {
    return Stack(
      children: [
        Container(
          child: Image.asset('assets/images/img_promo_cover.png'),
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
        Positioned(
          top: 16.h,
          left: 16.w,
          child: InkWell(
            onTap: () => Get.back(),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: colorWhite,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.arrow_back,
                color: colorBlack,
                size: 16.w,
              ),
            ),
          ),
        )
      ],
    );
  }

  _titleAndDescription() {
    return Container(
      margin: EdgeInsets.only(right: 16.w, left: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Dapur 88",
            style: tsHeading1,
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(
              "Bekal praktis ala Dapur 88 yang menyediakan makanan khas nusantara",
              style: tsRegular)
        ],
      ),
    );
  }

  _listFood(List<String> list) {
    return Container(
      margin: EdgeInsets.only(right: 16.w, left: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Jadwal Langganan", style: tsHeading2),
          ListFoodWidget(list),
        ],
      ),
    );
  }
}
