import 'package:flutter/material.dart';
import 'package:villa_sr_app/core.dart';
import '../controllers/login_controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  Widget build(context, LoginController controller) {
    controller.view = this;
    return Theme(
      data: ThemeData(
        primaryColor: const Color(0xFF6F35A5),
        scaffoldBackgroundColor: Colors.white,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: const Color(0xFF6F35A5),
            shape: const StadiumBorder(),
            maximumSize: const Size(double.infinity, 56),
            minimumSize: const Size(double.infinity, 56),
          ),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Color(0xFFF1E6FF),
          iconColor: Color(0xFF6F35A5),
          prefixIconColor: Color(0xFF6F35A5),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            borderSide: BorderSide.none,
          ),
        ),
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: SizedBox(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              // Positioned(
              //   top: 50,
              //   child: Image.network(
              //     "https://e1.pngegg.com/pngimages/822/197/png-clipart-band-logos-metallica-logo-thumbnail.png",
              //     width: 300,
              //   ),
              // ),
              SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Column(
                        children: [
                          Text(
                            "Sindang Restu \nVilla",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 16.0 * 2),
                          // Row(
                          //   children: [
                          //     const Spacer(),
                          //     Expanded(
                          //       flex: 8,
                          //       child: SvgPicture.network(
                          //           "https://capekngoding.com/uploads/62f680358d0a9_login.svg"),
                          //     ),
                          //     const Spacer(),
                          //   ],
                          // ),
                          SizedBox(height: 16.0 * 2),
                        ],
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          Expanded(
                            flex: 8,
                            child: Form(
                              key: controller.formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    validator: required,
                                    textInputAction: TextInputAction.next,
                                    cursorColor:
                                        Color.fromARGB(255, 73, 165, 53),
                                    onChanged: (value) {
                                      controller.username = value;
                                    },
                                    decoration: const InputDecoration(
                                      hintText: "Masukan Username/email",
                                      fillColor:
                                          Color.fromARGB(255, 239, 239, 239),
                                      prefixIcon: Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: Icon(Icons.person),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16.0),
                                    child: TextFormField(
                                      validator: required,
                                      onChanged: (value) {
                                        controller.password = value;
                                      },
                                      textInputAction: TextInputAction.done,
                                      obscureText: true,
                                      cursorColor:
                                          Color.fromARGB(255, 255, 255, 255),
                                      decoration: const InputDecoration(
                                        hintText: "Masukan Password",
                                        fillColor:
                                            Color.fromARGB(255, 239, 239, 239),
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: Icon(
                                            Icons.lock,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  Hero(
                                    tag: "login_btn",
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Color.fromARGB(255, 87, 193, 78)),
                                      onPressed: () => controller.doLogin(),
                                      child: Text(
                                        "Login".toUpperCase(),
                                        style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 242, 241, 243),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      const Text(
                                        "Belum Punya Akun ? ",
                                        style:
                                            TextStyle(color: Color(0xFF6F35A5)),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) {
                                                return Container();
                                              },
                                            ),
                                          );
                                        },
                                        child: const Text(
                                          "Daftar",
                                          style: TextStyle(
                                            color: Color(0xFF6F35A5),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<LoginView> createState() => LoginController();

  String? required(String? value) {
    if (value == null || value.isEmpty) {
      return 'Field ini diperlukan';
    }
    return null; // Mengembalikan null jika validasi berhasil
  }
}
