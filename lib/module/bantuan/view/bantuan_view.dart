import 'package:flutter/material.dart';
import 'package:villa_sr_app/core.dart';
import '../controller/bantuan_controller.dart';

class BantuanView extends StatefulWidget {
  const BantuanView({Key? key}) : super(key: key);

  Widget build(context, BantuanController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 39, 214, 9),
        title: const Text(
          "Bantuan?",
          style: TextStyle(
            color: Color.fromARGB(255, 255, 255, 255),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 600.0,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    8.0,
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Container(
                          width: 280,
                          child: const Text(
                            "Ada yang bisa Kami Bantu?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 20.0, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: Container(
                          margin: const EdgeInsets.only(top: 10, bottom: 10),
                          width: 340,
                          child: const Text(
                            " ",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 13.0, fontWeight: FontWeight.normal),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Flexible(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 12, 174, 50),
                              minimumSize: const Size(150, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
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
                          child: const Text(
                            'Hubungi Staff Villa',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<BantuanView> createState() => BantuanController();
}
