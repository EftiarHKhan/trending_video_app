import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:nb_utils/nb_utils.dart';
import 'package:trending_video_app/constant/constant.dart';

class ApiProvider {

// Get trending video list
  Future<Map<String, dynamic>?> getVideoList(String id) async {

    try {
      var response = await http.get(
        Uri.parse(BASE_URL + endpoint_trending_video).replace(queryParameters: {
          'page': id,
        }),
      );

      print(response.request.toString());

      if (response.statusCode == 200) {
        print("Success");
        var decoded = jsonDecode(response.body);
        print(decoded);
        return decoded;
      } else {
        print("Failed");
        toast(response.body.toString());
        return null;
      }
    } on SocketException catch (e) {
      print("SocketException: $e");
      return null;
    } on HttpException catch (e) {
      print("HttpException: $e");
      return null;
    } on FormatException catch (e) {
      print("FormatException: $e");
      return null;
    } catch (e) {
      print("Unexpected error: $e");
      return null;
    }
  }

}