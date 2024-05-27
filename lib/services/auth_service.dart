import 'package:dio/dio.dart';

class AuthService {
  static String? token;
  static int? id;
  static String? username_;
  Future<bool> login({
    required String username,
    required String password,
  }) async {
    try {
      var response = await Dio().post(
        "http://127.0.0.1:8000/api/login",
        options: Options(
          headers: {
            "Content-Type": "application/json",
          },
        ),
        data: {
          "identifier": username,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        Map auth = response.data;
        token = auth["user"]["token"];
        id = auth["user"]["id"];
        username_ = auth["user"]["username"];

        return true; // Login berhasil
      } else {
        return false; // Login gagal, respons tidak 200
      }
    } catch (e) {
      print("Error: $e"); // Tampilkan pesan kesalahan
      return false; // Login gagal karena kesalahan
    }
  }
}
