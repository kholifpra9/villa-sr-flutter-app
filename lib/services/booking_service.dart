import 'package:dio/dio.dart';
import 'package:villa_sr_app/core.dart';

class BookingService {
  Future<List> getBookingsByUser() async {
    var response = await Dio().get(
      "http://192.168.1.6:8080/api/booking",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${AuthService.token}",
        },
      ),
    );
    Map obj = response.data;
    return obj['data'];
  }

  Future<List> getBookingsByUserDipesan() async {
    var response = await Dio().get(
      "http://192.168.1.6:8080/api/booking/dipesan",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${AuthService.token}",
        },
      ),
    );
    Map obj = response.data;
    return obj['data'];
  }

  Future<List> getBookingsByUserDibayar() async {
    var response = await Dio().get(
      "http://192.168.1.6:8080/api/booking/dibayar",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${AuthService.token}",
        },
      ),
    );
    Map obj = response.data;
    return obj['data'];
  }

  Future<List> getBookingsByUserSelesai() async {
    var response = await Dio().get(
      "http://192.168.1.6:8080/api/booking/selesai",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${AuthService.token}",
        },
      ),
    );
    Map obj = response.data;
    return obj['data'];
  }

  Future<List> getBookingsByUserCanceled() async {
    var response = await Dio().get(
      "http://192.168.1.6:8080/api/booking/canceled",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer ${AuthService.token}",
        },
      ),
    );
    Map obj = response.data;
    return obj['data'];
  }

  Future<Map<String, dynamic>?> store({
    required DateTime tglCekin,
    required DateTime tglCekout,
    required int jmlMalam,
    required int jmlTamu,
    required double totalbayar,
    required int villaId,
    required int userId,
  }) async {
    try {
      var response = await Dio().post(
        "http://192.168.1.6:8080/api/booking/store", // Ganti '127.0.0.1' sesuai kebutuhan
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${AuthService.token}",
          },
        ),
        data: {
          "tanggalCheckin": tglCekin.toIso8601String(),
          "tanggalCheckout": tglCekout.toIso8601String(),
          "jml_malam": jmlMalam,
          "jml_tamu": jmlTamu,
          "status": "dipesan",
          "totalBayar": totalbayar,
          "villa_id": villaId,
          "user_id": userId
        },
      );

      // Jika API mengembalikan data booking baru, kembalikan data tersebut
      return response.data['data'];
    } catch (e) {
      // Gunakan DioError untuk handling error lebih spesifik
      if (e is DioError) {
        print("DioError: ${e.response?.data ?? e.message}");
      } else {
        print("Error: $e");
      }
      return null;
    }
  }
}
