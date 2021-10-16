import 'package:get/instance_manager.dart';
import 'meeting_ctr.dart';
class MeetingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MeetingCTR>(() => MeetingCTR());
  }
}
