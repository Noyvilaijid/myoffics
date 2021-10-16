import 'package:get/get.dart';
import 'package:myoffice/pages/about/about_binding.dart';
//import 'package:myoffice/pages/about/about_page.dart';
import 'package:myoffice/pages/contactus/contact_binding.dart';
//import 'package:myoffice/pages/contactus/contact_page.dart';
import 'package:myoffice/pages/home/home_binding.dart';
//import 'package:myoffice/pages/home/home_page.dart';
import 'package:myoffice/pages/mainhome/homepage.dart';
import 'package:myoffice/pages/mainhome/mainhome_binding.dart';
import 'package:myoffice/pages/pastwork/pastwork_binding.dart';
//import 'package:myoffice/pages/pastwork/pastwork_page.dart';
import 'package:myoffice/pages/service/service_binding.dart';
//import 'package:myoffice/pages/service/service_page.dart';
import 'package:myoffice/pages/teamwork/teamwork_binding.dart';
//import 'package:myoffice/pages/teamwork/teamwork_page.dart';
import 'package:myoffice/router/router_route.dart';
class AppPages {
  static var listAppPage = [
    GetPage(
        name: AppRoutes.MAINHOME,
        page: () => HomeMain(),
        binding: HomemainBinding()),
    GetPage(
        name: AppRoutes.HOME, page: () => null, binding: HomeBinding()),
    GetPage(
        name: AppRoutes.ABOUT,
        page: () => null,
        binding: AboutBinding()),
    GetPage(
        name: AppRoutes.SERVICE,
        page: () => null,
        binding: ServiceBinding()),
    GetPage(
        name: AppRoutes.PASTWORK,
        page: () => null,
        binding: PastWorkBinding()),
    GetPage(
        name: AppRoutes.TEAMWORK,
        page: () => null,
        binding: TeamWorkBinding()),
    GetPage(
        name: AppRoutes.CONTTACT,
        page: () => null,
        binding: ContactBing()),
  ];
}
