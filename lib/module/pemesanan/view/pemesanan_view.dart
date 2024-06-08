import 'package:flutter/material.dart';
import 'package:villa_sr_app/core.dart';
import '../controller/pemesanan_controller.dart';

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
        itemCount: 3,
        physics: const ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.grey[200],
                backgroundImage: const NetworkImage(
                  "https://res.cloudinary.com/dotz74j1p/raw/upload/v1716045088/aqwqm57kunudfs2y5swr.png",
                ),
              ),
              title: const Text("Jessica Doe"),
              subtitle: const Text("Programmer"),
            ),
          );
        },
      ),
    );
  }

  @override
  State<PemesananView> createState() => PemesananController();
}
