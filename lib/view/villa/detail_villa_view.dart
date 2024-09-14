import 'package:flutter/material.dart';
import 'package:input_quantity/input_quantity.dart';
import 'package:villa_sr_app/controllers/booking_controller.dart';
import 'package:villa_sr_app/core.dart';
import 'package:villa_sr_app/widgets/date_picker.dart';

class DetailVillaView extends StatefulWidget {
  final Map<String, dynamic> villa;

  const DetailVillaView({super.key, required this.villa});

  @override
  State<DetailVillaView> createState() => _DetailVillaViewState();
}

class _DetailVillaViewState extends State<DetailVillaView> {
  final controllerBooking = BookingController();
  DateTime? cekin;
  DateTime? cekout;
  int? jmlTamu;
  int? jmlMalam;
  double? totalBayar;
  int? villaId;
  int? userId;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    jmlTamu = 1;
    cekin = DateTime(now.year, now.month, now.day);
    cekout = cekin!.add(Duration(days: 1));
    villaId = widget.villa["id"];
    userId = AuthService.id;
  }

  void updatecekin(DateTime date) {
    setState(() {
      cekin = date;
      if (cekout != null && cekout!.isBefore(cekin!.add(Duration(days: 1)))) {
        cekout = cekin!.add(Duration(days: 1));
      }
    });
  }

  void updatecekout(DateTime date) {
    setState(() {
      cekout = date;
      if (cekin != null && cekout!.isBefore(cekin!.add(Duration(days: 1)))) {
        cekout = cekin!.add(Duration(days: 1));
      }
    });
  }

  int calculateDifferenceInDays() {
    if (cekin != null && cekout != null) {
      jmlMalam = cekout!.difference(cekin!).inDays;
      return cekout!.difference(cekin!).inDays;
    }
    return 0;
  }

  double totalharga() {
    int days = calculateDifferenceInDays();
    double pricePerNight = widget.villa['harga'];
    totalBayar = days * pricePerNight;
    return days * pricePerNight;
  }

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
                        "https://assets.zyrosite.com/cdn-cgi/image/format=auto,w=2448,h=928,fit=crop/YX44ly25pWflV6nD/4-AzG8b5rOXXUOKNDr.jpg",
                    "onTap": (item) {},
                  },
                  {
                    "id": 2,
                    "photo":
                        "https://assets.zyrosite.com/cdn-cgi/image/format=auto,w=861,h=575,fit=crop/YX44ly25pWflV6nD/18-A85rEr4bGLcZEQ7R.jpg",
                    "onTap": (item) {},
                  },
                  {
                    "id": 3,
                    "photo":
                        "https://assets.zyrosite.com/cdn-cgi/image/format=auto,w=861,h=575,fit=crop/YX44ly25pWflV6nD/whatsapp-image-2022-11-13-at-06.17.38-d95r73Zzj9u4en0o.jpeg",
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
              margin: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text("$cekout"),
                  const SizedBox(height: 15),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.villa['nama_villa'] + " - " + widget.villa['tipe'],
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.villa['lokasi'],
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(16)),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 1,
                          blurRadius: 1,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "Tanggal menginap Anda",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 10),
                        Row(
                          // Baris pertama berisi Check-in dan Check-out
                          children: [
                            Expanded(
                              // Widget Check-in
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(1),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: QDatePicker(
                                  label: "Tanggal Check-in",
                                  firstdate: DateTime.now(),
                                  value: cekin,
                                  onChanged: (value) {
                                    updatecekin(value);
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                                width:
                                    10), // Jarak antara Check-in dan Check-out
                            Expanded(
                              // Widget Check-out
                              child: Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(1),
                                      spreadRadius: 1,
                                      blurRadius: 1,
                                      offset: Offset(0, 3),
                                    ),
                                  ],
                                ),
                                child: QDatePicker(
                                  label: "Tanggal Check-out",
                                  firstdate: cekin!.add(Duration(days: 1)),
                                  value: cekout,
                                  onChanged: (value) {
                                    updatecekout(value);
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${calculateDifferenceInDays()} Malam",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "Jumlah Tamu",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14),
                              ),
                            ),
                            Expanded(
                              child: InputQty(
                                maxVal: 100,
                                initVal: 1,
                                minVal: 0,
                                steps: 1,
                                onQtyChanged: (val) {
                                  jmlTamu = val;
                                },
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                "Booking For",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 14),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "${AuthService.username_}",
                                style: TextStyle(
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                "Rp. ${totalharga().toStringAsFixed(0)}",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              child: ElevatedButton(
                onPressed: () => BookingController.doSave(
                  context,
                  cekin,
                  cekout,
                  jmlMalam,
                  jmlTamu,
                  totalBayar,
                  villaId,
                  userId,
                ),
                // {
                //   BookingController();
                //   print("cekin : $cekin");
                //   print("cekout : $cekout");
                //   print("jml_malam : $jmlMalam");
                //   print("jml_tamu : $jmlTamu");
                //   print("villa : $villaId");
                //   print("user : $userId");
                //   print("bayar : $totalBayar");
                //   // print(AuthService.username_);
                // },
                child: Text('Pesan Sekarang'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
