import 'package:get/instance_manager.dart';
import 'package:mbocu_app/controller/item_details_controller.dart';

class ItemDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ItemDetailsController());
  }
}
