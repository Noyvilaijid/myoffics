import 'package:get/instance_manager.dart';
import 'package:myoffice/pages/pastwork/pastwork_ctr.dart';

class PastWorkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PastWorkCTR>(() => PastWorkCTR());
  }
}
