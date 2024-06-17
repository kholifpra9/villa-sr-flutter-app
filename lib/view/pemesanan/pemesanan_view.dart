import 'package:flutter/material.dart';
import 'package:villa_sr_app/core.dart';
import '../../controllers/pemesanan_controller.dart';

class PemesananView extends StatefulWidget {
  const PemesananView({super.key});

  Widget build(context, PemesananController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Pesanan Saya",
          style: TextStyle(
            color: Color.fromARGB(255, 118, 117, 117),
            fontWeight: FontWeight.normal,
          ),
        ),
        actions: const [],
      ),
      body: ListView.builder(
        itemCount: controller.bookedByUser.length,
        physics: const ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          var item = controller.bookedByUser[index];
          return Column(children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  Expanded(
                      flex: 1,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: 100.0,
                          child: Image.network(
                            "${item["villa"]["gambar"]}",
                            fit: BoxFit.cover,
                          ),
                        ),
                      )),
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: EdgeInsets.all(5),
                      height: 100.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Booking ID : ${item["id"]}"),
                          Text("${item["villa"]["nama_villa"]}",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14)),
                          Text("Status : ${item["status"]}"),
                          Text(
                              "${formatTanggal(item["tanggalCheckin"])} - ${formatTanggal(item["tanggalCheckout"])} • ${item["jml_tamu"]} Tamu",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              child: Divider(color: Colors.grey, thickness: 0.5),
            ),
          ]);
        },
      ),
    );
  }

  String formatTanggal(String tanggal) {
    final DateTime parsedDate = DateTime.parse(tanggal);
    final List<String> bulan = [
      "Januari",
      "Februari",
      "Maret",
      "April",
      "Mei",
      "Juni",
      "Juli",
      "Agustus",
      "September",
      "Oktober",
      "November",
      "Desember"
    ];
    return "${parsedDate.day} ${bulan[parsedDate.month - 1]}";
  }

  @override
  State<PemesananView> createState() => PemesananController();
}
