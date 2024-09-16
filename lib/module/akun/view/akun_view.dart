import 'package:flutter/material.dart';
import 'package:villa_sr_app/core.dart';
import 'package:villa_sr_app/services/auth_service.dart';
import '../controller/akun_controller.dart';

class AkunView extends StatefulWidget {
  const AkunView({super.key});

  Widget build(context, AkunController controller) {
    controller.view = this;
    /*
    ------------------------
    https://capekngoding.com
    ------------------------
    Starring:
    Name: Deny Ocr
    Github: https://www.youtube.com/c/CapekNgoding
    ------------------------
    -
    ------------------------
    Code generation with snippets can be a good solution for you or it can kill you.
    A basic understanding of Dart and Flutter is required.
    Keep it in mind, Our snippet can't generate many files yet.
    So, all of our snippets are put in one file which is not best practice.
    You need to do the optimization yourself, and at least you are familiar with using Flutter.
    ------------------------
    */
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color.fromARGB(255, 39, 214, 9),
        foregroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          // IconButton(
          //   onPressed: () {},
          //   icon: const Icon(
          //     Icons.logout,
          //     size: 24.0,
          //   ),
          // ),
        ],
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Column(
          children: [
            Container(
              constraints: const BoxConstraints(
                maxHeight: 110.0,
              ),
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(
                        "https://res.cloudinary.com/dotz74j1p/raw/upload/v1716046071/lav8q7oo72hn1kdbtggm.png"),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Hello",
                          style: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 12.0,
                          ),
                        ),
                        Text(
                          "${AuthService.username_}",
                          style: const TextStyle(
                            fontSize: 20.0,
                            color: Color.fromARGB(255, 0, 0, 0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 8.0,
                  ),
                  // InkWell(
                  //   onTap: () {},
                  //   child: CircleAvatar(
                  //     radius: 16.0,
                  //     backgroundColor: Colors.blueGrey[900],
                  //     child: const Icon(
                  //       Icons.edit,
                  //       size: 12.0,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Builder(
                builder: (context) {
                  List items = [
                    {
                      "label": "Nama : ${AuthService.nama_}",
                      "icon": Icons.person_pin_rounded,
                    },
                    {
                      "label": "Alamat : ${AuthService.alamat_}",
                      "icon": Icons.pin_drop_rounded,
                    },
                    {
                      "label": "Email : ${AuthService.email_}",
                      "icon": Icons.email_rounded,
                    },
                    {
                      "label": "No Telepon : ${AuthService.notelp_}",
                      "icon": Icons.numbers_rounded,
                    },
                    {
                      "label": "Log Out",
                      "icon": Icons.logout_outlined,
                      "on_tap": () => _dialogYakin(context)
                    }
                  ];

                  return InkWell(
                    onTap: () {},
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                        horizontal: 12.0,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20.0),
                        ),
                      ),
                      child: ListView.builder(
                        itemCount: items.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var item = items[index];
                          return InkWell(
                            onTap: () {
                              if (item["on_tap"] != null) {
                                item["on_tap"]!();
                              }
                            },
                            child: SizedBox(
                              child: Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: ListTile(
                                  leading: Icon(
                                    item["icon"],
                                    size: 30.0,
                                  ),
                                  title: Text(item["label"]),
                                  // trailing: const Icon(
                                  //   Icons.chevron_right,
                                  // ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  State<AkunView> createState() => AkunController();
}

Future<void> _dialogYakin(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Log Out'),
        content: const Text('Apakah anda yakin Ingin Log-out? \n'),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Tidak'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Log-out!'),
              onPressed: () {}),
        ],
      );
    },
  );
}
