import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:villa_sr_app/core.dart';

class InfoDialog {
  static void show(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Oke"),
            ),
          ],
        );
      },
    );
  }
}

class BookingController {
  static void show(BuildContext context, String message,
      {VoidCallback? onOkPressed}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                if (onOkPressed != null) {
                  onOkPressed(); // Jalankan fungsi ketika "Oke" ditekan
                }
              },
              child: Text("Oke"),
            ),
          ],
        );
      },
    );
  }

  static void doSave(
    BuildContext context,
    DateTime? tglCekin,
    DateTime? tglCekout,
    int? jmlMalam,
    int? jmlTamu,
    double? totalBayar,
    int? villaId,
    int? userId,
  ) async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: LoadingAnimationWidget.halfTriangleDot(
            color: Colors.white,
            size: 80,
          ),
        );
      },
    );

    try {
      // Mendapatkan data booking yang baru ditambahkan
      var bookingData = await BookingService().store(
        tglCekin: tglCekin!,
        tglCekout: tglCekout!,
        jmlMalam: jmlMalam!,
        jmlTamu: jmlTamu!,
        totalbayar: totalBayar!,
        villaId: villaId!,
        userId: userId!,
      );

      // Tutup loading
      Navigator.of(context).pop();

      // Jika bookingData tidak null, booking berhasil
      if (bookingData != null) {
        // Tampilkan pesan berhasil
        show(context, "Pemesanan Berhasil! Lanjut ke Pembayaran!",
            onOkPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailPemesananView(
                bookingData:
                    bookingData, // Mengirimkan data booking baru ke halaman detail
              ),
            ),
          );
        });
      } else {
        // Jika null, tampilkan pesan gagal
        InfoDialog.show(
            context, "Villa sudah dipesan untuk tanggal yang dipilih");
      }
    } catch (e) {
      // Tutup loading jika ada error
      Navigator.of(context).pop();
      InfoDialog.show(context, "Terjadi kesalahan: $e");
      print("Error: $e");
    }
  }

  static void canceled(
    BuildContext context,
    int? bookingID,
  ) async {
    // Jika bookingID null, jangan lanjut
    if (bookingID == null) {
      InfoDialog.show(context, "Booking ID tidak valid");
      return;
    }

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: LoadingAnimationWidget.halfTriangleDot(
            color: Colors.white,
            size: 80,
          ),
        );
      },
    );

    try {
      // Mendapatkan data booking yang dibatalkan
      var canceled = await BookingService().canceled(bookingID: bookingID);

      // Tutup loading
      Navigator.of(context).pop();

      // Jika canceled tidak null, booking berhasil dibatalkan
      if (canceled != null) {
        show(context, "Pemesanan Berhasil Dibatalkan!", onOkPressed: () {
          PemesananController.instance.getBookingByUserDipesan();
          PemesananController.instance.getBookingByUserDibayar();
          PemesananController.instance.getBookingByUserSelesai();
          PemesananController.instance.getBookingByUserCanceled();
          Get.back();
        });
      } else {
        InfoDialog.show(context, "Gagal Dibatalkan");
      }
    } catch (e) {
      Navigator.of(context).pop();
      String errorMessage = "Terjadi kesalahan";
      if (e is DioError && e.response != null) {
        errorMessage =
            e.response?.data['message'] ?? "Error: ${e.response?.statusCode}";
      }
      InfoDialog.show(context, errorMessage);
      print("Error: $e");
    }
  }
}
