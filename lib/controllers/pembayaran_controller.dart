import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:villa_sr_app/core.dart';
import 'package:villa_sr_app/services/bayar_service.dart';

class PembayaranController extends State<PembayaranView> {
  static late PembayaranController instance;
  late PembayaranView view;

  @override
  void initState() {
    super.initState();
    instance = this;
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
  }

  void onReady() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}

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

class BayarController {
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
    String? buktiTF,
    int? bookingId,
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
      var postBukti = await BayarService().store(
        buktiTF: buktiTF!,
        bookingId: bookingId!,
      );

      // Tutup loading
      Navigator.of(context).pop();

      // Jika postBukti tidak null, booking berhasil
      if (postBukti != null) {
        // Tampilkan pesan berhasil
        show(context, "Bukti Pembayaran Sudah Di Upload!", onOkPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => const NavBar(),
          //   ),
          // );
          Get.back();
        });
      } else {
        // Jika null, tampilkan pesan gagal
        InfoDialog.show(context, "Gagal melakukan Upload Bukti.");
      }
    } catch (e) {
      // Tutup loading jika ada error
      Navigator.of(context).pop();
      InfoDialog.show(context, "Terjadi kesalahan: $e");
      print("Error: $e");
    }
  }
}
