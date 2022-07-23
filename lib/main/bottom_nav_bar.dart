import 'package:flutter/material.dart';
import 'home_page/page_1.dart';
import 'home_page/page_2.dart';
import 'settings/settings.dart';
import 'home_page/home_page.dart';
import 'home_page/page_3.dart';
import 'home_page/page_4.dart';
import 'popup_calendar/alert_dialog.dart';
import 'tab_bar_item.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  DateTime? lastTime;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10,
        shape: const Border(bottom: BorderSide(width: 1, color: Color(0xffdddddd))),
      ),
      body: () {
        switch (_selectedIndex) {
          case 0: return HomePage(upToDateTime: lastTime);
          case 1: return const Page1();
          case 2: return const Page2();
          case 3: return const Page3();
          case 4: return const Page4();
          case 5: return Settings();
        }
      }(),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          ...TabBarItem.values.map(
                (TabBarItem item) => BottomNavigationBarItem(
              icon: Icon(item.icon),
              label: item.title,
            ),
          ),
        ],
        elevation: 33,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blueGrey[900],
        iconSize: 22,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showDialog<DateTime>(
              barrierColor: Colors.grey[300]?.withOpacity(0.7),
              context: context,
              builder: (context) {
                return const ShowAlertDialog();
              }
          );
          setState(() {
            lastTime = result;
          });
        },
        child: const Icon(Icons.playlist_add),
      )
    );
  }
}