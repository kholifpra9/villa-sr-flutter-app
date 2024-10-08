// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:villa_sr_app/core.dart';
import '../../controllers/pembayaran_controller.dart';
import '../../widgets/image_picker.dart';

class PembayaranView extends StatefulWidget {
  final int booking_id;
  final double bayarDP;
  const PembayaranView(
      {super.key, required this.booking_id, required this.bayarDP});

  Widget build(context, PembayaranController controller) {
    String? buktiTF;
    int? bookingId;
    bookingId = booking_id;
    controller.view = this;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pembayaran"),
        actions: const [],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                "Booking ID : $bookingId",
                style: const TextStyle(
                    fontWeight: FontWeight.normal, fontSize: 14),
              ),
              Text(
                "Total Bayar DP : Rp.$bayarDP",
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
              QImagePicker(
                label: "Photo",
                validator: Validator.required,
                value: null,
                onChanged: (value) {
                  buktiTF = value;
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                ),
                onPressed: () =>
                    BayarController.doSave(context, buktiTF, bookingId),
                child: const Text("Kirim Bukti Pembayaran"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  State<PembayaranView> createState() => PembayaranController();
}

class Validator {
  static String? rule(
    String? value, {
    bool required = false,
  }) {
    if (required && value!.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  static String? required(
    dynamic value, {
    String? fieldName,
  }) {
    if (value == null) {
      return 'This field is required';
    }

    if (value is String || value == null) {
      if (value.toString() == 'null') return 'This field is required';
      if (value.isEmpty) return 'This field is required';
    }

    if (value is List) {
      if (value.isEmpty) return 'This field is required';
    }
    return null;
  }

  static String? email(String? value) {
    if (value!.isEmpty) return 'This field is required';

    final isValidEmail = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+.[a-zA-Z]+",
    ).hasMatch(value);

    if (!isValidEmail) {
      return 'This field is not in a valid email format';
    }
    return null;
  }

  static String? number(String? value) {
    if (value!.isEmpty) return 'This field is required';

    final isNumber = RegExp(r'^[0-9]+$').hasMatch(value);
    if (!isNumber) {
      return 'This field is not in a valid number format';
    }
    return null;
  }

  static String? atLeastOneitem(List<Map<String, dynamic>> items) {
    final checkedItems = items.where((i) => i['checked'] == true).toList();
    if (checkedItems.isEmpty) {
      return 'you must choose at least one item';
    }
    return null;
  }
}
