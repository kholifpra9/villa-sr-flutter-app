import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:villa_sr_app/core.dart';

import 'package:villa_sr_app/services/booking_service.dart';

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
        InfoDialog.show(context, "Gagal melakukan booking.");
      }
    } catch (e) {
      // Tutup loading jika ada error
      Navigator.of(context).pop();
      InfoDialog.show(context, "Terjadi kesalahan: $e");
      print("Error: $e");
    }
  }
}
