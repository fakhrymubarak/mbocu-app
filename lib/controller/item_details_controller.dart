import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:mbocu_app/models/ItemDetailsDTO.dart';
import 'package:mbocu_app/repositories/mbocu_db_api.dart';

class ItemDetailsController extends GetxController {
  String? itemId;

  MbocuDbApi _mbocuDbApi = MbocuDbApi();
  late Rx<ItemDetailsDto> itemDetails;

  @override
  void onInit() {
    itemDetails = new ItemDetailsDto().obs;
    loadItemDetails();
    super.onInit();
  }

  void loadItemDetails() async {
    try {
      itemId = Get.parameters['itemId'];
      print(itemId);
      itemDetails.value = await _mbocuDbApi.getItemDetails(itemId!) ;
      itemDetails.refresh();
    } catch (e) {
      _showDialog(title: "Error", middleText: "Cannot load data");
    }
  }



  void _closeCurrentDialog() {
    if (Get.isDialogOpen!) {
      Navigator.of(Get.overlayContext!).pop();
    }
  }

  void _showDialog({required String title, required String middleText}) {
    _closeCurrentDialog();
    Get.defaultDialog(
      barrierDismissible: false,
      titleStyle: TextStyle(fontSize: 24),
      middleTextStyle: TextStyle(fontSize: 18),
      title: title,
      middleText: middleText,
      textConfirm: 'OK',
      radius: 17,
      confirmTextColor: Colors.black87,
      onConfirm: () {
        Navigator.of(Get.overlayContext!).pop();
      },
    );
  }
}