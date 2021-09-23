import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mbocu_app/themes/colors.dart';

final ButtonStyle buttonPrimaryLarge = ElevatedButton.styleFrom(
  primary: colorPrimary,
  onPrimary: colorWhite,
  minimumSize: const Size(88, 36),
  padding: const EdgeInsets.symmetric(horizontal: 16),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(100.r),
    ),
  ),
);
