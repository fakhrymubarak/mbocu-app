import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mbocu_app/controller/item_details_controller.dart';
import 'package:mbocu_app/models/ItemDetailsDTO.dart';
import 'package:mbocu_app/themes/colors.dart';
import 'package:mbocu_app/themes/text_styles.dart';
import 'package:mbocu_app/utils/money_convertion.dart';
import 'package:mbocu_app/utils/whatsapp_launcher.dart';
import 'package:mbocu_app/views/widgets/list_food_shimmer.dart';
import 'package:mbocu_app/views/widgets/list_food_widget.dart';
import 'package:mbocu_app/views/widgets/shimmer_box.dart';

class ItemDetailsPage extends StatefulWidget {
  ItemDetailsPage({Key? key}) : super(key: key);

  @override
  _ItemDetailsPageState createState() => _ItemDetailsPageState();
}

class _ItemDetailsPageState extends State<ItemDetailsPage> {
  final ItemDetailsController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(
          () => _controller.itemDetails.value.data == null
              ? _loadingWidget()
              : _successWidget(
                  _controller.itemDetails.value.data!.first.merchant!.listItem),
        ),
      ),
    );
  }

  _successWidget(List<ItemDetails>? listItem) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              _headerDetailsPage(),
              SizedBox(height: 16.h),
              _titleAndDescription(),
              SizedBox(height: 16.h),
              Divider(),
              _merchantWidget(),
              Divider(),
              SizedBox(height: 16.h),
              _listFood(listItem),
            ],
          ),
        ),
        _fixedOrderItem(),
      ],
    );
  }

  _fixedOrderItem() {
    return Container(
      height: 55.h,
      width: double.maxFinite,
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: colorGreyLight)),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 0,
            blurRadius: 5,
            offset: Offset(0, 0),
          )
        ],
      ),
      child: Container(
        padding: EdgeInsetsDirectional.only(start: 16.w, end: 16.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart_rounded),
                  SizedBox(width: 8.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Price",
                        style: tsRegular,
                      ),
                      Text(
                        intToRupiah(_controller
                                .itemDetails.value.data!.first.price!) +
                            " / item",
                        style: tsHeading2,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () => launchWhatsApp('6285157573144',
                  "Halo ${_controller.itemDetails.value.data!.first.merchant!.name}! Saya mau pesan ${_controller.itemDetails.value.data!.first.name!}!"),
              child: Text("Order via Whatsapp"),
              style: TextButton.styleFrom(
                backgroundColor: colorPrimary,
                textStyle: tsRegular,
                primary: colorWhite,
              ),
            )
          ],
        ),
      ),
    );
  }

  _loadingWidget() {
    return ListView(
      children: [
        showShimmerBox(226.h, 370.w),
        SizedBox(height: 16.h),
        _shimmerTitleAndDescription(),
        SizedBox(height: 16.h),
        ListFoodShimmer(),
      ],
    );
  }

  _headerDetailsPage() {
    return Stack(
      children: [
        Container(
          height: 200.h,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/img_default_item.jpg'),
                fit: BoxFit.cover),
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
            _controller.itemDetails.value.data!.first.name!,
            style: tsHeading1,
          ),
          SizedBox(
            height: 4.h,
          ),
          Text(
              _controller.itemDetails.value.data!.first.desc == null
                  ? "Tidak ada deskripsi"
                  : _controller.itemDetails.value.data!.first.desc!,
              style: tsRegular)
        ],
      ),
    );
  }

  _merchantWidget() {
    return InkWell(
      child: Padding(
        padding: EdgeInsets.only(right: 16.w, left: 16.w),
        child: Row(
          children: [
            Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/img_promo_cover.png'),
                    fit: BoxFit.cover),
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              _controller.itemDetails.value.data!.first.merchant!.name!,
              style: tsHeading2,
            )
          ],
        ),
      ),
    );
  }

  _listFood(List<ItemDetails>? listItem) {
    return Container(
      margin: EdgeInsets.only(right: 16.w, left: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Hidangan Lainnya Dari Toko Ini", style: tsHeading2),
          ListFoodWidget(listItem, _controller),
        ],
      ),
    );
  }

  _shimmerTitleAndDescription() {
    return Container(
      margin: EdgeInsets.only(right: 16.w, left: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          showShimmerBox(14.h, 100.w),
          SizedBox(height: 4.h),
          showShimmerBox(10.h, 200.w),
          SizedBox(height: 2.h),
          showShimmerBox(10.h, 350.w),
        ],
      ),
    );
  }
}
