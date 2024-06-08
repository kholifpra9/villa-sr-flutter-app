import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:villa_sr_app/core.dart';

class LoginController extends State<LoginView> {
  static late LoginController instance;
  late LoginView view;
  late BuildContext loading;

  @override
  void initState() {
    super.initState();
    instance = this;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String? username;
  String? password;
  doLogin() async {
    bool isvalid = formKey.currentState!.validate();
    if (!isvalid) {
      return;
    }

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          loading = context;
          return LoadingAnimationWidget.halfTriangleDot(
              color: Colors.white, size: 80);
        });
    bool isSuccess =
        await AuthService().login(username: username!, password: password!);
    Navigator.of(loading).pop();

    if (!isSuccess) {
      InfoDialog.show(context, "Username/email/password Salah!");
    } else {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const NavBar()));
    }
  }
}

class InfoDialog {
  static void show(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          // title: Text("Info"),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Oke"),
            ),
          ],
        );
      },
    );
  }
}
