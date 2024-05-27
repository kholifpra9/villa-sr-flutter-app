import 'package:dio/dio.dart';

class VillaService {
  Future<List> get() async {
    var response = await Dio().get(
      "http://127.0.0.1:8000/api/villa",
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
