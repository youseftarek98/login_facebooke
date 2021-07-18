
import 'package:flutter/material.dart';
import 'package:login_facebooke/screens/import.dart';

class Screens extends StatefulWidget {

  const Screens({Key key}) : super(key: key);

  @override
  _ScreensState createState() => _ScreensState();
}

class _ScreensState extends State<Screens> {
  final List _screens=[
    HomePage(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
    Scaffold(),
  ];
  final List<IconData> _icon = const[
    Icons.home,
    Icons.ondemand_video,
    Icons.menu,
    Icons.people_outline

  ];
   int _selectedIndex =0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _icon.length,
      child: Scaffold(

      ),
    );
  }
}
