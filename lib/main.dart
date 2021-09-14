import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mbocu_app/routes/binding/home_binding.dart';
import 'package:mbocu_app/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: () => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        getPages: Routes.route,
        initialRoute: '/home',
        initialBinding: HomeBinding(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
      designSize: const Size(411, 731),
    );
  }
}
