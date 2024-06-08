import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'package:villa_sr_app/services/booking_service.dart';

class InfoDialog {
  static void show(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // title: Text("Info"),
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
    print("cekin : $tglCekin");
    print("cekout : $tglCekout");
    print("jml_malam : $jmlMalam");
    print("jml_tamu : $jmlTamu");
    print("villa : $villaId");
    print("user : $userId");
    print("bayar : $totalBayar");

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
      bool isSuccess = await BookingService().store(
        tglCekin: tglCekin!,
        tglCekout: tglCekout!,
        jmlMalam: jmlMalam!,
        jmlTamu: jmlTamu!,
        totalbayar: totalBayar!,
        villaId: villaId!,
        userId: userId!,
      );
      Navigator.of(context).pop();
      if (!isSuccess) {
        show(context, "GAGAL!");
      } else {
        show(context, "Berhasil!");
      }
    } catch (e) {
      Navigator.of(context).pop();
      show(context, "Terjadi kesalahan: $e");
      print("Error: $e");
    }
  }
}
