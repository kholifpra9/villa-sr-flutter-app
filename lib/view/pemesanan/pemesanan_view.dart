import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:villa_sr_app/core.dart';
import '../../controllers/pemesanan_controller.dart';

class PemesananView extends StatefulWidget {
  const PemesananView({super.key});

  Widget build(context, PemesananController controller) {
    controller.view = this;
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Pemesanan'),
          bottom: const TabBar(
            tabs: <Widget>[
              Tab(
                text: "Dipesan",
              ),
              Tab(
                text: "Dibayar",
              ),
              Tab(
                text: "Selesai",
              ),
              Tab(
                text: "Dibatalkan",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            //belum Dibayar
            ListView.builder(
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
                            height: 135.0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Booking ID : ${item["id"]}"),
                                Text("${item["villa"]["nama_villa"]}",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14)),
                                Text("Status : ${item["status"]}"),
                                Text(
                                    "${formatTanggal(item["tanggalCheckin"])} - ${formatTanggal(item["tanggalCheckout"])} • ${item["jml_tamu"]} Tamu",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12)),
                                Expanded(
                                    child: Container(
                                  margin: EdgeInsets.all(5),
                                  child: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailPemesananView(
                                                    bookingData: item,
                                                  )),
                                        );
                                      },
                                      child: Text('Lihat Detail & Bayar')),
                                ))
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
            Center(
              child: Text("dibayar"),
            ),
            Center(
              child: Text("It's rainy here"),
            ),
            Center(
              child: Text("It's sunny here"),
            ),
          ],
        ),
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
