import 'package:dio/dio.dart';
import 'package:mbocu_app/const/constants.dart';
import 'package:mbocu_app/models/ItemsByLocationDTO.dart';

class MboccuDbApi {

  // Fetch Items By Location
  Future<ItemsByLocationDto> getItemsByLocation(String long, String lat) async {
    var path = 'itemloc';
    var token = '4|sZXTqzFP4K7In5s6YPRp0jheGA7TyErO4ytlG7KB';
    var formData = FormData.fromMap({
      'long': long,
      'lat': lat,
    });

    ItemsByLocationDto output = ItemsByLocationDto();

    try {
      Dio _dio = new Dio();
      _dio.options.headers["authorization"] = "Bearer " + token;
      _dio.options.headers["authorization"] = "Bearer " + token;

      Response response = await _dio.post(BASE_API + path, data: formData);
      if (response.statusCode == 200) {
        output = ItemsByLocationDto.fromJson(response.data);
      }
    } catch (e) {
      print(e);
    }
    return output;
  }
}
