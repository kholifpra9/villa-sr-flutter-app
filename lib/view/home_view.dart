// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:villa_sr_app/core.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "SR VILLA",
          style: TextStyle(
              color: Color.fromARGB(255, 39, 214, 9),
              fontWeight: FontWeight.w900),
        ),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            //carousell
            Builder(builder: (context) {
              List images = [
                "https://assets.zyrosite.com/cdn-cgi/image/format=auto,w=808,h=586,fit=crop/YX44ly25pWflV6nD/11-AzGk5Pr2bPUDy6Wp.jpg",
                "https://assets.zyrosite.com/YX44ly25pWflV6nD/13-AzGk5Pr26MTeoRzD.jpg",
                "https://assets.zyrosite.com/YX44ly25pWflV6nD/10-meP04wLzxNIJaWZO.jpg",
                "https://assets.zyrosite.com/cdn-cgi/image/format=auto,w=506,h=506,fit=crop/YX44ly25pWflV6nD/15-mP4ea1pVPofpBwXK.jpg",
                "https://assets.zyrosite.com/cdn-cgi/image/format=auto,w=506,h=506,fit=crop/YX44ly25pWflV6nD/2-mk30PwDRjPS7nDva.jpg",
              ];

              return CarouselSlider(
                options: CarouselOptions(
                  height: 160.0,
                  autoPlay: true,
                  enlargeCenterPage: true,
                ),
                items: images.map((imageUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: Colors.amber,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(6.0),
                          ),
                          image: DecorationImage(
                            image: NetworkImage(
                              imageUrl,
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              );
            }),
            const SizedBox(height: 40),
            //penginapan
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20),
              child: const Text(
                "Katalog",
                style: TextStyle(
                  fontSize: 22.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Builder(
              builder: (context) {
                List items = [
                  {
                    "id": 1,
                    "photo":
                        "https://assets.zyrosite.com/cdn-cgi/image/format=auto,w=861,h=575,fit=crop/YX44ly25pWflV6nD/whatsapp-image-2022-09-09-at-00.44.36-d95r7rQON7svvyL0.jpeg",
                    "onTap": (context) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const VillaView()),
                      );
                    },
                  },
                  // Add more items as needed
                ];

                return SizedBox(
                  height: 120.0,
                  child: ListView.builder(
                    itemCount: items.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      var item = items[index];
                      return GestureDetector(
                        onTap: () => item['onTap'](context),
                        child: Stack(
                          children: [
                            Container(
                              height: 100.0,
                              width: MediaQuery.of(context).size.width * 0.7,
                              margin: const EdgeInsets.only(
                                  right: 12.0, left: 12.0),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(item["photo"]),
                                  fit: BoxFit.cover,
                                ),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(16.0),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 8.0,
                              left: 8.0,
                              child: Container(
                                padding: const EdgeInsets.all(15.0),
                                color: Colors.black.withOpacity(
                                    0.5), // Background color for text
                                child: Text(
                                  "Cari Villa disini!",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            const SizedBox(height: 40),
            //penawaran
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20),
              child: const Text(
                "Penawaran",
                style: TextStyle(
                  fontSize: 22.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 160.0,
              margin: const EdgeInsets.only(left: 16, right: 16),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://i.pinimg.com/564x/89/c1/df/89c1dfaf3e2bf035718cf2a76a16fd38.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    16.0,
                  ),
                ),
              ),
              child: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          16.0,
                        ),
                      ),
                    ),
                  ),
                  const Positioned(
                    left: 20.0,
                    top: 0.0,
                    bottom: 0.0,
                    child: SizedBox(
                      width: 100.0,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "30%",
                            style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Discount Only Valid for Today",
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),
            //Rekomendasi Terdekat
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20),
              child: const Text(
                "Rekomendasi terdekat",
                style: TextStyle(
                  fontSize: 22.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Builder(builder: (context) {
              List categories = [
                {
                  "label": "Food",
                  "image":
                      "https://images.unsplash.com/photo-1476224203421-9ac39bcb3327?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=870&q=80",
                },
                {
                  "label": "Wisata",
                  "image":
                      "https://i.pinimg.com/736x/ff/f4/3a/fff43a2e6fe4193ff37a7819d3cfdd37.jpg",
                },
              ];

              return ListView.builder(
                itemCount: categories.length,
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  var item = categories[index];
                  return Container(
                    height: 100.0,
                    clipBehavior: Clip.antiAlias,
                    margin: const EdgeInsets.only(
                        bottom: 12.0, left: 20, right: 20),
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(
                          8.0,
                        ),
                      ),
                      image: DecorationImage(
                        image: NetworkImage(
                          item["image"],
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.6),
                          ),
                        ),
                        Center(
                          child: Text(
                            item["label"],
                            style: const TextStyle(
                              fontSize: 18.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
