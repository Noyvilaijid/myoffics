import 'package:get/instance_manager.dart';
import 'package:myoffice/pages/service/service_ctr.dart';

class ServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServiceCTR>(() => ServiceCTR());
  }
}
