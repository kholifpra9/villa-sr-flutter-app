
import 'package:flutter/material.dart';
import 'package:villa_sr_app/core.dart';
import '../view/pemesanan_view.dart';

class PemesananController extends State<PemesananView> {
  static late PemesananController instance;
  late PemesananView view;

  @override
  void initState() {
    super.initState();
    instance = this;
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
  }

  void onReady() {
    
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
    