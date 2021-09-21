import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';

showShimmerBox(double height, double width) {
  return Shimmer.fromColors(
    baseColor: Colors.grey[300]!,
    highlightColor: Colors.grey[200]!,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(10.r),
      child: Container(
        width: width,
        height: height,
        color: Colors.grey[300],
      ),
    ),
  );
}
