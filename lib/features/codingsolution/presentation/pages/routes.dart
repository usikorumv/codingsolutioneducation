import 'package:get/route_manager.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'auth/login_page.dart';
import 'auth/register_page.dart';
import 'main_pages/main_page.dart';

List<GetPage> routes = [
  GetPage(name: '/login', page: () => LoginPage()),
  GetPage(name: '/register', page: () => RegisterPage()),
  GetPage(name: '/home', page: () => MainPage()),
  // GetPage(name: '/second', page: () => Second()),
  // GetPage(
  //     name: '/third',
  //     page: () => Third(),
  //     transition: Transition.zoom
  // ),
];
