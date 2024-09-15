import 'package:dio/dio.dart';

class VillaService {
  Future<List> get() async {
    var response = await Dio().get(
      "http://192.168.1.6:8080/api/villa",
      options: Options(
        headers: {
          "Content-Type": "application/json",
        },
      ),
    );
    Map obj = response.data;
    return obj['data'];
  }
}
