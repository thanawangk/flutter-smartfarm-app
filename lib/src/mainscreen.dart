import 'package:flutter/material.dart';
import 'package:minihydrov1/src/actionscreen.dart';
import 'package:minihydrov1/src/dashscreen.dart';
import 'package:minihydrov1/src/howto.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // void initState() {
  //   super.initState();
  //   startDB(DateTime.now());
  // }

  int _selectedIndex = 1;
  final List<Widget> _widgetOptions = [
    HowtoScreen(),
    DashScreen(),
    ActionScreen(),

  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        //backgroundColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.local_florist),
            label: 'Help',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dynamic_form), //or dns
            label: 'Dash',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.face), //or games
            label: 'Action',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green[700],
        onTap: _onItemTapped,
      ),
    );
  }
}
