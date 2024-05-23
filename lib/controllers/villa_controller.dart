import 'package:flutter/material.dart';
import 'package:villa_sr_app/core.dart';
import 'package:villa_sr_app/services/villa_servie.dart';
import '../view/villa/villa_view.dart';

class VillaController extends State<VillaView> {
  static late VillaController instance;
  late VillaView view;

  @override
  void initState() {
    instance = this;
    getVilla();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List villa = [];
  getVilla() async {
    villa = await VillaService().get();
    setState(() {});
  }
}
