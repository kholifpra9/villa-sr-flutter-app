import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:villa_sr_app/controllers/user_controller.dart';

class PemesananScreen extends StatefulWidget {
  const PemesananScreen({super.key});

  @override
  State<PemesananScreen> createState() => _PemesananScreenState();

  build(BuildContext context, UserController userController) {}
}

class _PemesananScreenState extends State<PemesananScreen> {
  @override
  Widget build(BuildContext context) {
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
                          child: Text(
                            "Belum ada pemesanan!",
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
                          margin: EdgeInsets.only(top: 10, bottom: 10),
                          width: 340,
                          child: Text(
                            "Silahkan tentukan tujuan anda & mulai pemesanan sekarang",
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
                              backgroundColor: Color.fromARGB(255, 185, 40, 40),
                              minimumSize: Size(150, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12))),
                          onPressed: () {},
                          child: const Text(
                            "Pesan Sekarang",
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
}
