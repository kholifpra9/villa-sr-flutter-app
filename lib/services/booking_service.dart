import 'package:dio/dio.dart';

class BookingService {
  Future<bool> store({
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
        "http://127.0.0.1:8000/api/booking/store",
        options: Options(
          headers: {
            "Content-Type": "application/json",
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
      print("Response: ${response.data}");
      return true;
    } catch (e) {
      print("Error: $e");
      return false;
    }
  }
}
