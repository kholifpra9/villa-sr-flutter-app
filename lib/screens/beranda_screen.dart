// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:villa_sr_app/widgets/nav_bar.dart';

class BerandaScreen extends StatefulWidget {
  const BerandaScreen({super.key});

  @override
  State<BerandaScreen> createState() => _BerandaScreenState();
}

class _BerandaScreenState extends State<BerandaScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Container(
                height: 160.0,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://cf.bstatic.com/xdata/images/hotel/max1280x900/492693887.jpg?k=1637b44d47ff6059585f4f6e06dc0ffff8c2f2001a47de01f577d198ff73b710&o=&hp=1",
                    ),
                    fit: BoxFit.cover,
                  ),
                  // borderRadius: BorderRadius.all(
                  //   Radius.circular(
                  //     16.0,
                  //   ),
                  // ),
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
                    Positioned(
                      left: 20.0,
                      top: 0.0,
                      bottom: 0.0,
                      child: SizedBox(
                        // width: 100.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Hi Guest111",
                              style: TextStyle(
                                fontSize: 30.0,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Selamat Datang!",
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
              SizedBox(height: 20),
              //carousell
              Builder(builder: (context) {
                List images = [
                  "https://images.unsplash.com/photo-1555939594-58d7cb561ad1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                  "https://images.unsplash.com/photo-1540189549336-e6e99c3679fe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80",
                  "https://images.unsplash.com/photo-1565299624946-b28f40a0ae38?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=781&q=80",
                  "https://images.unsplash.com/photo-1565958011703-44f9829ba187?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=765&q=80",
                  "https://images.unsplash.com/photo-1482049016688-2d3e1b311543?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=710&q=80",
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
              SizedBox(height: 20),
              //penawaran

              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Penawaran",
                  style: TextStyle(
                    fontSize: 22.5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Builder(
                builder: (context) {
                  List items = [
                    {
                      "id": 1,
                      "photo":
                          "https://i.ibb.co/6NZ8dGk/Holiday-Travel-Agent-Promotion-Banner-Landscape.png",
                      "onTap": (item) {},
                    },
                    {
                      "id": 2,
                      "photo":
                          "https://i.ibb.co/5xfjdy9/Blue-Modern-Discount-Banner.png",
                      "onTap": (item) {},
                    },
                    {
                      "id": 3,
                      "photo":
                          "https://i.ibb.co/6Rvjyy1/Brown-Yellow-Free-Furniture-Promotion-Banner.png",
                      "onTap": (item) {},
                    }
                  ];

                  return SizedBox(
                    height: 120.0,
                    child: ListView.builder(
                      itemCount: items.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        var item = items[index];
                        return Container(
                          height: 100.0,
                          width: MediaQuery.of(context).size.width * 0.7,
                          margin: const EdgeInsets.only(right: 16.0),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                item["photo"],
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                16.0,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),

              SizedBox(height: 35),
              //Rekomendasi Terdekat
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.only(left: 20),
                child: Text(
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
                    "label": "Main Course",
                    "image":
                        "https://images.unsplash.com/photo-1593253787226-567eda4ad32d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=387&q=80",
                  },
                  {
                    "label": "Drink",
                    "image":
                        "https://images.unsplash.com/photo-1527661591475-527312dd65f5?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=415&q=80",
                  },
                  {
                    "label": "Snack",
                    "image":
                        "https://images.unsplash.com/photo-1580314552228-5a7ce023fc9e?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=388&q=80",
                  },
                ];

                return ListView.builder(
                  itemCount: categories.length,
                  shrinkWrap: true,
                  physics: ScrollPhysics(),
                  itemBuilder: (BuildContext context, int index) {
                    var item = categories[index];
                    return Container(
                      height: 100.0,
                      clipBehavior: Clip.antiAlias,
                      margin:
                          EdgeInsets.only(bottom: 12.0, left: 20, right: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
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
                              style: TextStyle(
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
      ),
    );
  }
}
