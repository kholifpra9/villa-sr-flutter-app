import 'package:flutter/material.dart';
import 'package:villa_sr_app/core.dart';
import '../../controllers/detail_pemesanan_controller.dart';

class DetailPemesananView extends StatefulWidget {
  const DetailPemesananView({super.key});

  Widget build(context, DetailPemesananController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Pemesanan"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }

  @override
  State<DetailPemesananView> createState() => DetailPemesananController();
}
