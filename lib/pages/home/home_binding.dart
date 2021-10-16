import 'package:get/instance_manager.dart';
import 'package:myoffice/pages/home/home_ctr.dart';
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeCTR>(() => HomeCTR());
  }
}
