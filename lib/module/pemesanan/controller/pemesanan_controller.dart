import 'package:flutter/material.dart';
import 'package:villa_sr_app/core.dart';
import '../view/pemesanan_view.dart';

class PemesananController extends State<PemesananView> {
  static late PemesananController instance;
  late PemesananView view;

  @override
  void initState() {
    instance = this;
    getBookingByUser();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List bookedByUser = [];
  getBookingByUser() async {
    bookedByUser = await BookingService().getBookingsByUser();
    setState(() {});
  }
}
