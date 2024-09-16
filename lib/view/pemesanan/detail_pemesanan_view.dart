import 'package:flutter/material.dart';
import 'package:villa_sr_app/core.dart';
import 'package:villa_sr_app/widgets/bottom_button.dart';

class DetailPemesananView extends StatefulWidget {
  final Map<String, dynamic> bookingData;
  const DetailPemesananView({super.key, required this.bookingData});

  Widget build(context, DetailPemesananController controller) {
    int bookingId = bookingData['id'];
    double bayarDP = bookingData['totalBayar'] / 2;
    String bookingStatus =
        bookingData['status']; // Ambil status dari booking data
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Pemesanan"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "INVOICE",
                    style: TextStyle(
                      fontSize: 20.0,
                    ),
                  ),
                  DataTable(
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            'Reservasi',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Expanded(
                          child: Text(
                            '',
                            style: TextStyle(fontStyle: FontStyle.italic),
                          ),
                        ),
                      ),
                    ],
                    rows: <DataRow>[
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('Booking ID :')),
                          DataCell(Text('${bookingData["id"]}')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('Nama Villa :')),
                          DataCell(
                            Text(bookingData["nama_villa"] != null
                                ? '${bookingData["nama_villa"]}'
                                : '${bookingData["villa"]["nama_villa"]}'),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('Atas Nama :')),
                          DataCell(
                            Text(bookingData["nama_user"] != null
                                ? '${bookingData["nama_user"]}'
                                : '${bookingData["user"]["nama"]}'),
                          ),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('Tgl Check-In :')),
                          DataCell(Text('${bookingData["tanggalCheckin"]}')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('Tgl Check-Out :')),
                          DataCell(Text('${bookingData["tanggalCheckout"]}')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('Jumlah Malam :')),
                          DataCell(Text('${bookingData["jml_malam"]}')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('Jumlah Tamu :')),
                          DataCell(Text('${bookingData["jml_tamu"]}')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('Status : ')),
                          DataCell(Text('${bookingData["status"]}')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('Total Bayar : ')),
                          DataCell(Text('Rp. ${bookingData["totalBayar"]}')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('Total Bayar DP : ')),
                          DataCell(Text('Rp. $bayarDP')),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),

              // Periksa jika status adalah 'dipesan'
              // if (bookingStatus == 'dipesan')
              //   Column(
              //     crossAxisAlignment: CrossAxisAlignment.center,
              //     children: [
              //       ElevatedButton(
              //         style: ElevatedButton.styleFrom(
              //           backgroundColor: const Color.fromARGB(255, 39, 214, 9),
              //           foregroundColor: Colors.white,
              //         ),
              //         onPressed: () {
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //               builder: (context) => PembayaranView(
              //                 booking_id: bookingId,
              //               ),
              //             ),
              //           );
              //         },
              //         child: const Text("Bayar DP Sekarang!"),
              //       ),
              //       const SizedBox(
              //         height: 15,
              //       ),
              //       ElevatedButton(
              //         style: ElevatedButton.styleFrom(
              //           backgroundColor: const Color.fromARGB(255, 214, 9, 9),
              //           foregroundColor: Colors.white,
              //         ),
              //         onPressed: () {
              //           // Tambahkan logika untuk membatalkan pesanan
              //         },
              //         child: const Text("Batalkan Pemesanan!"),
              //       ),
              //     ],
              //   ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize
              .min, // Memastikan tombol tidak mengisi seluruh ruang yang tersedia
          children: [
            if (bookingStatus == 'dipesan')
              // Tombol Bayar DP Sekarang!
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 39, 214, 9),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  minimumSize:
                      const Size.fromHeight(50), // Memastikan tombol memanjang
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PembayaranView(
                        booking_id: bookingId,
                        bayarDP: bayarDP,
                      ),
                    ),
                  );
                },
                child: const Text(
                  "Bayar DP Sekarang!",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            const SizedBox(height: 10), // Memberi jarak vertikal antara tombol
            if (bookingStatus == 'dipesan')
              // Tombol Batalkan Pemesanan!
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 214, 9, 9),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  minimumSize:
                      const Size.fromHeight(50), // Memastikan tombol memanjang
                ),
                onPressed: () => BookingController.canceled(context, bookingId),
                child: const Text(
                  "Batalkan Pemesanan!",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  State<DetailPemesananView> createState() => DetailPemesananController();
}
