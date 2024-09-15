import 'package:flutter/material.dart';
import 'package:villa_sr_app/core.dart';

class PemesananController extends State<PemesananView> {
  static late PemesananController instance;
  late PemesananView view;

  @override
  void initState() {
    instance = this;
    getBookingByUser();
    getBookingByUserDipesan();
    getBookingByUserDibayar();
    getBookingByUserSelesai();
    getBookingByUserCanceled();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (ModalRoute.of(context)?.isCurrent ?? false) {
      getBookingByUser(); // Refresh data saat tab diakses
      getBookingByUserDipesan();
      getBookingByUserDibayar();
      getBookingByUserSelesai();
      getBookingByUserCanceled();
    }
  }

  @override
  Widget build(BuildContext context) => widget.build(context, this);

  List bookedByUser = [];
  Future<void> getBookingByUser() async {
    bookedByUser = await BookingService().getBookingsByUser();
    setState(() {});
  }

  List bookedByUserDipesan = [];
  Future<void> getBookingByUserDipesan() async {
    bookedByUserDipesan = await BookingService().getBookingsByUserDipesan();
    setState(() {});
  }

  List bookedByUserDibayar = [];
  Future<void> getBookingByUserDibayar() async {
    bookedByUserDibayar = await BookingService().getBookingsByUserDibayar();
    setState(() {});
  }

  List bookedByUserSelesai = [];
  Future<void> getBookingByUserSelesai() async {
    bookedByUserSelesai = await BookingService().getBookingsByUserSelesai();
    setState(() {});
  }

  List bookedByUserCanceled = [];
  Future<void> getBookingByUserCanceled() async {
    bookedByUserCanceled = await BookingService().getBookingsByUserCanceled();
    setState(() {});
  }
}
