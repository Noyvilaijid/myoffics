import 'package:get/instance_manager.dart';
import 'package:myoffice/pages/contactus/contact_ctr.dart';
class ContactBing extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactCTR>(() => ContactCTR());
  }
}
