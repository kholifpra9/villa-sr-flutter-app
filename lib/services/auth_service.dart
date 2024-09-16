import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static String? token;
  static int? id;
  static String? username_;
  static String? nama_;
  static String? email_;
  static String? alamat_;
  static String? notelp_;
  Future<bool> login({
    required String username,
    required String password,
  }) async {
    try {
      var response = await Dio().post(
        "http://192.168.1.6:8080/api/login",
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
        nama_ = auth["user"]["nama"];
        email_ = auth["user"]["email"];
        alamat_ = auth["user"]["alamat"];
        notelp_ = auth["user"]["notelp"];

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token!);
        await prefs.setInt('id', id!);
        await prefs.setString('username', username_!);
        await prefs.setString('nama', nama_!);
        await prefs.setString('email', email_!);
        await prefs.setString('alamat', alamat_!);
        await prefs.setString('notelp', notelp_!);

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
    nama_ = prefs.getString('nama');
    email_ = prefs.getString('email');
    alamat_ = prefs.getString('alamat');
    notelp_ = prefs.getString('notelp');

    return token != null;
  }
}
