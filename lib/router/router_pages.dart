
import 'package:get/get.dart';
import 'package:myoffice/pages/about/about_binding.dart';
import 'package:myoffice/pages/about/about_page.dart';
import 'package:myoffice/pages/contactus/contact_binding.dart';
import 'package:myoffice/pages/contactus/contact_page.dart';
import 'package:myoffice/pages/home/home_binding.dart';
import 'package:myoffice/pages/home/home_page.dart';
import 'package:myoffice/pages/mainhome/homepage.dart';
import 'package:myoffice/pages/mainhome/mainhome_binding.dart';
import 'package:myoffice/pages/pastwork/pastwork_binding.dart';
import 'package:myoffice/pages/pastwork/pastwork_page.dart';
import 'package:myoffice/pages/service/service_binding.dart';
import 'package:myoffice/pages/service/service_page.dart';
import 'package:myoffice/pages/teamwork/teamwork_binding.dart';
import 'package:myoffice/pages/teamwork/teamwork_page.dart';
import 'package:myoffice/router/router_route.dart';
class AppPages {
  static var listAppPage = [
    GetPage(
        name: AppRoutes.MAINHOME,
        page: () => HomeMain(),
        binding: HomemainBinding()),
    GetPage(
        name: AppRoutes.HOME, page: () => HomePage(), binding: HomeBinding()),
    GetPage(
        name: AppRoutes.ABOUT,
        page: () => AboutPage(),
        binding: AboutBinding()),
    GetPage(
        name: AppRoutes.SERVICE,
        page: () => ServicePage(),
        binding: ServiceBinding()),
    GetPage(
        name: AppRoutes.PASTWORK,
        page: () => PastWork(),
        binding: PastWorkBinding()),
    GetPage(
        name: AppRoutes.TEAMWORK,
        page: () => TeamWorkPage(),
        binding: TeamWorkBinding()),
    GetPage(
        name: AppRoutes.CONTTACT,
        page: () => ContactPage(),
        binding: ContactBing()),
  ];
}
