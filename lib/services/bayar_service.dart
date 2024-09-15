import 'package:dio/dio.dart';
import 'package:villa_sr_app/core.dart';

class BayarService {
  Future<Map<String, dynamic>?> store({
    required String buktiTF,
    required int bookingId,
  }) async {
    try {
      var response = await Dio().post(
        "http://192.168.1.6:8080/api/pembayaran/storee", // Ganti '127.0.0.1' sesuai kebutuhan
        options: Options(
          headers: {
            "Content-Type": "application/json",
            "Authorization": "Bearer ${AuthService.token}",
          },
        ),
        data: {
          "bukti_pembayaran": buktiTF,
          "booking_id": bookingId,
          "status": "check",
        },
      );

      // Jika API mengembalikan data booking baru, kembalikan data tersebut
      return response.data['data'][0];
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
