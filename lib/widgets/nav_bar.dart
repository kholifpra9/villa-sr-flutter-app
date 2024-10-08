import 'package:flutter/material.dart';
import 'package:villa_sr_app/core.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: selectedIndex,
      child: Scaffold(
        body: IndexedStack(
          index: selectedIndex,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            const HomeScreen(),
            const PemesananView(),
            const BantuanView(),
            const AkunView()
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          selectedItemColor: Color.fromARGB(255, 39, 214, 9),
          unselectedItemColor: Colors.grey[500],
          onTap: (index) {
            setState(() {
              selectedIndex = index;
              if (selectedIndex == 1) {
                // Ganti tab Pemesanan agar di-reload setiap kali diklik
                PemesananController.instance.getBookingByUserDipesan();
                PemesananController.instance.getBookingByUserDibayar();
                PemesananController.instance.getBookingByUserSelesai();
                PemesananController.instance.getBookingByUserCanceled();
              }
            });
          },
          items: const [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(
                Icons.home,
              ),
            ),
            BottomNavigationBarItem(
              label: "Pemesanan",
              icon: Icon(
                Icons.book_rounded,
              ),
            ),
            BottomNavigationBarItem(
              label: "Bantuan?",
              icon: Icon(
                Icons.live_help,
              ),
            ),
            BottomNavigationBarItem(
              label: "Me",
              icon: Icon(
                Icons.person,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
