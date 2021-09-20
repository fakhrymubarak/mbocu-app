import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mbocu_app/themes/colors.dart';
import 'package:mbocu_app/themes/text_styles.dart';

void displayBottomSheet(BuildContext context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15.r),
          topRight: Radius.circular(15.r),
        ),
      ),
      backgroundColor: colorWhite,
      builder: (ctx) {
        return Container(
          height: MediaQuery.of(context).size.height * (9 / 10),
          width: 411.w,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 16.h),
                height: 7.h,
                width: 100.w,
                decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.all(Radius.circular(15.r))),
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: EdgeInsets.only(right: 16.w, left: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Alamat Pengantaran",
                      style: tsHeading1,
                    ),
                    TextButton(
                        onPressed: () => print("LihatPeta"),
                        child: Text(
                          "Lihat Peta",
                          style: tsRegular,
                        ))
                  ],
                ),
              ),
              SizedBox(height: 8.h),
              _searchLocation(),
              SizedBox(height: 8.h),
              _itemLocation(),
            ],
          ),
        );
      });
}

_itemLocation() {
  return InkWell(
    onTap: () => print("Button Current Location Tapped"),
    child: Container(
      padding: EdgeInsets.all(16.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(8.h),
            child: Icon(
              Icons.location_searching,
              size: 16.h,
            ),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.all(Radius.circular(20.r)),
            ),
          ),
          SizedBox(width: 16.w),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Lokasimu saat ini", style: tsHeading2),
                SizedBox(height: 4.h),
                Text(
                  "Perum Polri Gowok Blok A1 No.2, RT.10/RW.05, Ambarukmo, Caturtunggal, Depok Sub-District, Sleman Regency, Special Region of Yogyakarta 55281",
                  style: tsRegular,
                ),
                Divider(
                  color: Colors.grey[300],
                  thickness: 1.h,
                  endIndent: 8.w,
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

_searchLocation() {
  return Container(
    margin: EdgeInsets.only(left: 16.w, right: 16.w),
    child: TextField(
      style: tsRegular,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.r),
          borderSide: BorderSide(color: Colors.transparent, width: 0),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50.r),
          borderSide: BorderSide(color: Colors.transparent, width: 0),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
        filled: true,
        fillColor: colorGreyLight,
        hintText: "Cari Lokasi",
        hintStyle: tsRegular,
        prefixIcon: Icon(Icons.search),
      ),
    ),
  );
}
