import 'package:flutter/material.dart';
import 'package:villa_sr_app/view/pemesanan_view.dart';

class UserController extends State<PemesananScreen> {
  static late UserController instance;
  late PemesananScreen view;

  @override
  void initState() {
    instance = this;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
