
import 'package:flutter/material.dart';
import 'package:villa_sr_app/core.dart';
import '../view/bantuan_view.dart';

class BantuanController extends State<BantuanView> {
  static late BantuanController instance;
  late BantuanView view;

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
    