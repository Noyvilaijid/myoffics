import 'package:get/instance_manager.dart';
import 'package:myoffice/pages/teamwork/teamwork_ctr.dart';

class TeamWorkBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeamWorkCTR>(() => TeamWorkCTR());
  }
}
