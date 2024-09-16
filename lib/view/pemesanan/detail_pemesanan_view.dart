import 'package:flutter/material.dart';
import 'package:villa_sr_app/core.dart';

// ignore: non_constant_identifier_names
int? booking_id;

class DetailPemesananView extends StatefulWidget {
  final Map<String, dynamic> bookingData;
  const DetailPemesananView({super.key, required this.bookingData});

  Widget build(context, DetailPemesananController controller) {
    booking_id = bookingData['id'];
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
                onPressed: () => _dialogYakin(context),
                child: const Text(
                  "Batalkan Pemesanan!",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),

            if (bookingStatus == 'dibayar')
              OutlinedButton(
                onPressed: () => _dialogBuilder(context),
                child: const Text(
                  'Rules & Check-In',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
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

Future<void> _dialogBuilder(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Rules & Check-In'),
        content: const Text(
          'Rules Pembatalan\n'
          '- H-7 sd H5 : Uang Kembali 50%\n'
          '- H-4 sd H3 : Uang Kembali 25%\n'
          '- H-2 : Hangus\n\n'
          'Rules Check-In & Check-Out\n'
          '- Check-In : Hari H Check-In jam 2\n'
          '- Check-Out : Hari H Check-out maksimal jam 12\n -Pelunasan pada Saat Checkin \n \n'
          'Info lebih lanjut hubungi Staff Villa',
        ),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Hubungi Staff Villa'),
            onPressed: () async {
              final Uri whatsappUrl = Uri.parse(
                  "https://wa.me/+6286791552626?text=Tamu%20Villa%20%3A%20Sudah%20bayar%20DP%2C%20%0Aingin%20meminta%20informasi");

              // Mengecek apakah URL bisa dibuka
              if (await canLaunchUrl(whatsappUrl)) {
                await launchUrl(whatsappUrl); // Membuka WhatsApp
              } else {
                // Jika tidak bisa membuka WhatsApp, tampilkan error
                throw 'Could not launch $whatsappUrl';
              }
            },
          ),
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Oke'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

Future<void> _dialogYakin(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Pembatalan Pemesanan'),
        content: const Text('Apakah anda yakin membatalkan pemesanan? \n'),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Tidak'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Batalkan Pemesanan!'),
              onPressed: () {
                BookingController.canceled(context, booking_id);
                Navigator.of(context).pop();
              }),
        ],
      );
    },
  );
}
