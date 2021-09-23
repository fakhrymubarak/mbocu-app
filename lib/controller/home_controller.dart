import 'dart:async';

import 'package:get/get.dart' hide Response;
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:mbocu_app/models/ItemsByLocationDTO.dart';
import 'package:mbocu_app/repositories/mbocu_db_api.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  String locationName = "Tugu Yogyakarta";
  CameraPosition? _kCurrLoc;

  MbocuDbApi _mbocuDbApi = MbocuDbApi();
  Rx<ItemsByLocationDto> itemsByLocation = new ItemsByLocationDto().obs;

  @override
  void onInit() {
    _getCurrentLocation();
    _loadItemsByLocation();
    super.onInit();
  }

  Future<void> _getCurrentLocation() async {
    Location location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await location.getLocation();
    _kCurrLoc = CameraPosition(
      target: LatLng(_locationData.latitude!, _locationData.longitude!),
      zoom: 15,
    );
  }

  Future<void> _loadItemsByLocation() async{
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if(prefs.getString("accessToken") != null) {
        String token = prefs.getString("accessToken")!;
        itemsByLocation.value = await _mbocuDbApi.getItemsByLocation('110.416664', '-6.966667', token);
        itemsByLocation.refresh();
      }else{
        Get.toNamed("/login");
      }
    } catch (e) {
      printError(info: e.toString());
    }
  }
}