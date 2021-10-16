import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myoffice/theme/theme.dart';
import 'router/router_pages.dart';
import 'router/router_route.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Official Website',
      initialRoute: AppRoutes.MAINHOME,
      getPages: AppPages.listAppPage,
      theme: new ThemeData(scaffoldBackgroundColor: colorwhite), //secondcolor
    );
  }
}
//http://192.168.100.12:1337/admin