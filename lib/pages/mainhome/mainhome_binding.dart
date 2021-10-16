import 'package:get/get.dart';
import 'package:myoffice/pages/mainhome/mainhome_ctr.dart';
class HomemainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainHomeCTR>(() => MainHomeCTR());
  }
}
