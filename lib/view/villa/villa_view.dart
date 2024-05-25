import 'package:flutter/material.dart';
import 'package:villa_sr_app/core.dart';
import 'package:villa_sr_app/view/villa/detail_villa_view.dart';
import '../../controllers/villa_controller.dart';

class VillaView extends StatefulWidget {
  const VillaView({super.key});

  Widget build(context, VillaController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Villa"),
        actions: const [],
      ),
      body: ListView.builder(
        itemCount: controller.villa.length,
        physics: const ScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          var item = controller.villa[index];
          return Card(
              margin: const EdgeInsets.all(15),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailVillaView(villa: item)));
                },
                child: Column(
                  children: [
                    // Bagian gambar
                    SizedBox(
                      height: 200.0,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 1,
                        itemBuilder: (context, imgIndex) {
                          return Container(
                            height: 200.0,
                            width:
                                320, //MediaQuery.of(context).size.width * 0.7,
                            margin: const EdgeInsets.only(left: 10.0, top: 10),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(item["gambar"]),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(16.0),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    // Bagian judul dan deskripsi
                    ListTile(
                      title: Text(item["nama_villa"] + " - " + item["tipe"]),
                      subtitle: Text(item["lokasi"]),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 15, bottom: 5),
                      alignment: Alignment.centerLeft,
                      child: Text("Rp. ${item['harga']}"),
                    )
                  ],
                ),
              ));
        },
      ),
    );
  }

  @override
  State<VillaView> createState() => VillaController();
}
