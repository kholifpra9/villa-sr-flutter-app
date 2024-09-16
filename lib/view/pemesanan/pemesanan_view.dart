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
              itemCount: controller.bookedByUserDipesan.isEmpty
                  ? 1 // Jika kosong, maka itemCount menjadi 1 untuk menampilkan pesan
                  : controller.bookedByUserDipesan.length,
              itemBuilder: (BuildContext context, int index) {
                if (controller.bookedByUserDipesan.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "Belum ada pemesanan hari ini",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  );
                }

                var item1 = controller.bookedByUserDipesan[index];
                return Column(
                  children: [
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
                                  "${item1["villa"]["gambar"]}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              margin: EdgeInsets.all(5),
                              height: 135.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Booking ID : ${item1["id"]}"),
                                  Text("${item1["villa"]["nama_villa"]}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14)),
                                  Text("Status : ${item1["status"]}"),
                                  Text(
                                      "${formatTanggal(item1["tanggalCheckin"])} - ${formatTanggal(item1["tanggalCheckout"])} • ${item1["jml_tamu"]} Tamu",
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
                                                      bookingData: item1,
                                                    )),
                                          );
                                        },
                                        child: Text('Lihat Detail & Bayar!'),
                                      ),
                                    ),
                                  )
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
                  ],
                );
              },
            ),
            //dibayar
            ListView.builder(
              itemCount: controller.bookedByUserDibayar.isEmpty
                  ? 1 // Jika kosong, maka itemCount menjadi 1 untuk menampilkan pesan
                  : controller.bookedByUserDibayar.length,
              itemBuilder: (BuildContext context, int index) {
                if (controller.bookedByUserDibayar.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "Belum ada Pembayaran hari ini",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  );
                }

                var item2 = controller.bookedByUserDibayar[index];
                return Column(
                  children: [
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
                                  "${item2["villa"]["gambar"]}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              margin: EdgeInsets.all(5),
                              height: 135.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Booking ID : ${item2["id"]}"),
                                  Text("${item2["villa"]["nama_villa"]}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14)),
                                  Text("Status : ${item2["status"]}"),
                                  Text(
                                      "${formatTanggal(item2["tanggalCheckin"])} - ${formatTanggal(item2["tanggalCheckout"])} • ${item2["jml_tamu"]} Tamu",
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
                                                      bookingData: item2,
                                                    )),
                                          );
                                        },
                                        child: Text('Lihat Detail'),
                                      ),
                                    ),
                                  )
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
                  ],
                );
              },
            ),
            //selesai
            ListView.builder(
              itemCount: controller.bookedByUserSelesai.isEmpty
                  ? 1 // Jika kosong, maka itemCount menjadi 1 untuk menampilkan pesan
                  : controller.bookedByUserSelesai.length,
              itemBuilder: (BuildContext context, int index) {
                if (controller.bookedByUserSelesai.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "Belum ada pemesanan Selesai Hari ini",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  );
                }

                var item3 = controller.bookedByUserSelesai[index];
                return Column(
                  children: [
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
                                  "${item3["villa"]["gambar"]}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              margin: EdgeInsets.all(5),
                              height: 135.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Booking ID : ${item3["id"]}"),
                                  Text("${item3["villa"]["nama_villa"]}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14)),
                                  Text("Status : ${item3["status"]}"),
                                  Text(
                                      "${formatTanggal(item3["tanggalCheckin"])} - ${formatTanggal(item3["tanggalCheckout"])} • ${item3["jml_tamu"]} Tamu",
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
                                                      bookingData: item3,
                                                    )),
                                          );
                                        },
                                        child: Text('Lihat Detail'),
                                      ),
                                    ),
                                  )
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
                  ],
                );
              },
            ),
            //canceled
            ListView.builder(
              itemCount: controller.bookedByUserCanceled.isEmpty
                  ? 1 // Jika kosong, maka itemCount menjadi 1 untuk menampilkan pesan
                  : controller.bookedByUserCanceled.length,
              itemBuilder: (BuildContext context, int index) {
                if (controller.bookedByUserCanceled.isEmpty) {
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Text(
                        "Belum ada pemesanan Dibatalkan hari ini",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  );
                }

                var item4 = controller.bookedByUserCanceled[index];
                return Column(
                  children: [
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
                                  "${item4["villa"]["gambar"]}",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Container(
                              margin: EdgeInsets.all(5),
                              height: 135.0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Booking ID : ${item4["id"]}"),
                                  Text("${item4["villa"]["nama_villa"]}",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14)),
                                  Text("Status : ${item4["status"]}"),
                                  Text(
                                      "${formatTanggal(item4["tanggalCheckin"])} - ${formatTanggal(item4["tanggalCheckout"])} • ${item4["jml_tamu"]} Tamu",
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
                                                      bookingData: item4,
                                                    )),
                                          );
                                        },
                                        child: Text('Lihat Detail'),
                                      ),
                                    ),
                                  )
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
                  ],
                );
              },
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
