import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
        token = auth["token"];
        id = auth["user"]["id"];
        username_ = auth["user"]["username"];

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token!);
        await prefs.setInt('id', id!);
        await prefs.setString('username', username_!);

        return true; // Login berhasil
      } else {
        return false; // Login gagal, respons tidak 200
      }
    } catch (e) {
      print("Error: $e"); // Tampilkan pesan kesalahan
      return false; // Login gagal karena kesalahan
    }
  }

  Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    token = prefs.getString('token');
    id = prefs.getInt('id');
    username_ = prefs.getString('username');
    return token != null;
  }
}
