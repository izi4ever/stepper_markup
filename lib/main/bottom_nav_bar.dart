import 'package:flutter/material.dart';
import 'popup_calendar/popup_calendar.dart';
import 'tab_bar_item.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;

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
      body: TabBarItem.values[_selectedIndex].body,
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
                return CalendarPopup();
              }
          );
          // TODO (Babich) reflect result in UI
          print('Popup result is: $result');
        },
        child: const Icon(Icons.playlist_add),
      )
    );
  }
}