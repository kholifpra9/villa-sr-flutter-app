// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
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
              Positioned(
                top: 50,
                child: Image.network(
                  "https://e1.pngegg.com/pngimages/822/197/png-clipart-band-logos-metallica-logo-thumbnail.png",
                  width: 300,
                ),
              ),
              SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Column(
                        children: [
                          const Text(
                            "LOGIN",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 30),
                          ),
                          const SizedBox(height: 16.0 * 2),
                          Row(
                            children: [
                              const Spacer(),
                              Expanded(
                                flex: 8,
                                child: SvgPicture.network(
                                    "https://capekngoding.com/uploads/62f680358d0a9_login.svg"),
                              ),
                              const Spacer(),
                            ],
                          ),
                          const SizedBox(height: 16.0 * 2),
                        ],
                      ),
                      Row(
                        children: [
                          const Spacer(),
                          Expanded(
                            flex: 8,
                            child: Form(
                              child: Column(
                                children: [
                                  TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    textInputAction: TextInputAction.next,
                                    cursorColor: const Color(0xFF6F35A5),
                                    onSaved: (email) {},
                                    decoration: const InputDecoration(
                                      hintText: "Masukan Email",
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
                                      textInputAction: TextInputAction.done,
                                      obscureText: true,
                                      cursorColor: const Color(0xFF6F35A5),
                                      decoration: const InputDecoration(
                                        hintText: "Masukan Password",
                                        prefixIcon: Padding(
                                          padding: EdgeInsets.all(16.0),
                                          child: Icon(Icons.lock),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
                                  Hero(
                                    tag: "login_btn",
                                    child: ElevatedButton(
                                      onPressed: () {},
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
}
