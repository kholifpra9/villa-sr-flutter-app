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
        title: Text(
          widget.villa['nama_villa'] + " - " + widget.villa['tipe'],
          style: TextStyle(fontSize: 15),
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Builder(
              builder: (context) {
                List items = [
                  {
                    "id": 1,
                    "photo":
                        "https://res.cloudinary.com/dotz74j1p/raw/upload/v1716045413/v9mct2dsiepfm8im8n2y.png",
                    "onTap": (item) {},
                  },
                  {
                    "id": 2,
                    "photo":
                        "https://res.cloudinary.com/dotz74j1p/raw/upload/v1716045418/pxztfthdjnzsvdsv48fb.png",
                    "onTap": (item) {},
                  },
                  {
                    "id": 3,
                    "photo":
                        "https://res.cloudinary.com/dotz74j1p/raw/upload/v1716045423/cd5buk49nzy48j4ynlvq.png",
                    "onTap": (item) {},
                  }
                ];

                return SizedBox(
                  height: 200.0,
                  child: ListView.builder(
                    itemCount: items.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var item = items[index];
                      return Container(
                        height: 100,
                        width: 350,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                              item["photo"],
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            Container(
              margin: EdgeInsets.only(left: 20),
              child: Column(
                children: [
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
          ],
        ),
      ),
    );
  }
}
