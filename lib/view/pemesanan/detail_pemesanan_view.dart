import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:villa_sr_app/core.dart';
import '../../controllers/detail_pemesanan_controller.dart';

class DetailPemesananView extends StatefulWidget {
  final Map<String, dynamic> bookingData;
  const DetailPemesananView({super.key, required this.bookingData});

  Widget build(context, DetailPemesananController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Pemesanan"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "INVOICE",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  Text('Booking ID: ${bookingData["id"]}'),
                  Text(bookingData["nama_villa"] != null
                      ? 'Villa: ${bookingData["nama_villa"]}'
                      : 'Villa: ${bookingData["villa"]["nama_villa"]}'),
                  Text(bookingData["nama_user"] != null
                      ? 'Atas Nama: ${bookingData["nama_user"]}'
                      : 'Atas Nama: ${bookingData["user"]["nama"]}'),
                  Text('Tanggal Check-in: ${bookingData["tanggalCheckin"]}'),
                  Text('Tanggal Check-out: ${bookingData["tanggalCheckout"]}'),
                  Text('Jumlah Malam: ${bookingData["jml_malam"]}'),
                  Text('Jumlah Tamu: ${bookingData["jml_tamu"]}'),
                  Text('status: ${bookingData["status"]}'),
                  Text('Total Bayar: ${bookingData["totalBayar"]}'),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 39, 214, 9),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PembayaranView()),
                      );
                    },
                    child: const Text("Bayar DP Sekarang!"),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 214, 9, 9),
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {},
                    child: const Text("Batalkan Pemesanan!"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<DetailPemesananView> createState() => DetailPemesananController();
}
