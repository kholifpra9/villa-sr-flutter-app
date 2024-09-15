
import 'package:flutter/material.dart';
import 'package:villa_sr_app/core.dart';
import '../view/akun_view.dart';

class AkunController extends State<AkunView> {
  static late AkunController instance;
  late AkunView view;

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
    