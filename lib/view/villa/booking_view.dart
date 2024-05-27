import 'package:flutter/material.dart';
import 'package:villa_sr_app/core.dart';
import '../../controllers/booking_controller.dart';

class BookingView extends StatefulWidget {
  const BookingView({Key? key}) : super(key: key);

  Widget build(context, BookingController controller) {
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Booking"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: const [],
          ),
        ),
      ),
    );
  }

  @override
  State<BookingView> createState() => BookingController();
}
