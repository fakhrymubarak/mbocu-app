import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:mbocu_app/routes/binding/item_details_binding.dart';
import 'package:mbocu_app/routes/binding/splashscreen_binding.dart';
import 'package:mbocu_app/views/details/item_details_page.dart';
import 'package:mbocu_app/views/home/home_container.dart';
import 'package:mbocu_app/views/login_page.dart';
import 'package:mbocu_app/views/register_page.dart';
import 'package:mbocu_app/views/splashscreen_page.dart';

import 'binding/home_binding.dart';
import 'binding/login_binding.dart';
import 'binding/register_binding.dart';

class Routes {
  static final route = [
    GetPage(
      name: '/splashscreen',
      page: () => SplashscreenPage(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
      name: '/login',
      page: () => LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: '/register',
      page: () => RegisterPage(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: '/home',
      page: () => HomeContainer(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: '/details/:itemId',
      page: () => ItemDetailsPage(),
      binding: ItemDetailsBinding(),
    ),
  ];
}
