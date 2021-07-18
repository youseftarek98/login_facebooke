import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_facebooke/screens/home_page.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class NaScreen extends StatefulWidget {
  const NaScreen({Key key}) : super(key: key);

  @override
  _NaScreenState createState() => _NaScreenState();
}

class _NaScreenState extends State<NaScreen> {
  final List<Widget> _screen = [
    HomePage(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];
  final List<IconData> _icons = [
    Icons.home,
    Icons.ondemand_video,
    MdiIcons.accountCircleOutline,
    MdiIcons.accountGroupOutline,
    MdiIcons.bellOutline,
    Icons.menu
  ];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _icons.length,
      child: Scaffold(
       // appBar: AppBar(),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.black,
          backgroundColor: Colors.white,
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.ondemand_video), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.person_pin), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ""),
            BottomNavigationBarItem(icon: Icon(Icons.menu), label: "" ),
          ],
        ),
        body: IndexedStack(
          index: _selectedIndex,
          children: _screen,
        ),
      ),
    );
  }
}
