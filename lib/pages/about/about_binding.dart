import 'package:get/instance_manager.dart';
import 'package:myoffice/pages/about/about_ctr.dart';
class AboutBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AboutCTR>(() => AboutCTR());
  }
}
