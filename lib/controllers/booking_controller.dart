import 'package:flutter/material.dart';
import 'package:villa_sr_app/core.dart';
import '../view/villa/booking_view.dart';

class BookingController extends State<BookingView> {
  static late BookingController instance;
  late BookingView view;

  @override
  void initState() {
    super.initState();
    instance = this;
    WidgetsBinding.instance.addPostFrameCallback((_) => onReady());
  }

  void onReady() {}

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);
}
