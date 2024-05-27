import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:villa_sr_app/core.dart';
import 'package:villa_sr_app/services/booking_service.dart';
import '../view/villa/booking_view.dart';

class BookingController extends State<BookingView> {
  static late BookingController instance;
  late BookingView view;
  late BuildContext loading;

  @override
  void initState() {
    super.initState();
    instance = this;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  DateTime? tglCekin;
  DateTime? tglCekout;
  int? jmlMalam;
  int? jmlTamu;
  double? totalBayar;
  int? villaId;
  int? userId;

  doSave(tglCekin, tglCekout, jmlMalam, jmlTamu, totalBayar, villaId,
      userId) async {
    print("cekin : $tglCekin");
    print("cekout : $tglCekout");
    print("jml_malam : $jmlMalam");
    print("jml_tamu : $jmlTamu");
    print("villa : $villaId");
    print("user : $userId");
    print("bayar : $totalBayar");

    await BookingService().store(
        tglCekin: tglCekin!,
        tglCekout: tglCekout!,
        jmlMalam: jmlMalam!,
        jmlTamu: jmlTamu!,
        totalbayar: totalBayar!,
        villaId: villaId!,
        userId: userId!);
  }
}

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
