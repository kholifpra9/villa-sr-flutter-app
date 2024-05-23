import 'package:flutter/material.dart';

class DetailVillaView extends StatefulWidget {
  final Map<String, dynamic> villa;
  const DetailVillaView({super.key, required this.villa});

  @override
  State<DetailVillaView> createState() => _DetailVillaViewState();
}

class _DetailVillaViewState extends State<DetailVillaView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.villa['nama_villa']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(widget.villa['gambar']),
            SizedBox(height: 16.0),
            Text(
              widget.villa['nama_villa'] + " - " + widget.villa['tipe'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              widget.villa['lokasi'],
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8.0),
            Text(
              "Rp. " + widget.villa['harga'].toString(),
              style: TextStyle(fontSize: 16, color: Colors.green),
            ),
            SizedBox(height: 16.0),
            Text(
              "Deskripsi Villa",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              widget.villa['deskripsi'] ?? 'Tidak ada deskripsi.',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
    );
  }
}
