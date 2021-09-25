import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mbocu_app/routes/binding/home_binding.dart';
import 'package:mbocu_app/routes/binding/login_binding.dart';
import 'package:mbocu_app/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _isLoginChecker(),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.data != null) {
          return ScreenUtilInit(
            builder: () => GetMaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Mbocu App',
              getPages: Routes.route,
              initialRoute: snapshot.data == true ? '/home' : '/login',
              initialBinding:
                  snapshot.data == true ? HomeBinding() : LoginBinding(),
              theme: ThemeData(
                primarySwatch: Colors.orange,
              ),
            ),
            designSize: const Size(411, 731),
          );
        } else {
          return MaterialApp(
            home: Scaffold(
              body: SafeArea(
                child: Center(
                  child: Image.asset('assets/images/img_logo.png'),
                ),
              ),
            ),
          );
        }
      },
    );
  }

  Future<bool> _isLoginChecker() async {
    var prefs = await SharedPreferences.getInstance();
    if (prefs.getBool("isLogin") == true &&
        prefs.getString("accessToken") != null) {
      return true;
    }
    return false;
  }
}
