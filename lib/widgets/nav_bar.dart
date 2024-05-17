import 'package:flutter/material.dart';
import 'package:villa_sr_app/screens/home_screen.dart';
import 'package:villa_sr_app/screens/pemesanan_screen.dart';

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
          children: [
            const HomeScreen(),
            const PemesananScreen(),
            Container(
              color: Colors.purple[100],
            ),
            Container(
              color: Colors.blue[100],
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          selectedItemColor: const Color.fromARGB(255, 202, 54, 54),
          unselectedItemColor: Colors.grey[500],
          onTap: (index) {
            selectedIndex = index;
            setState(() {});
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
