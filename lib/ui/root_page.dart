import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:toga_app/ui/screens/home.dart';
import 'package:toga_app/ui/screens/info.dart';
import 'package:toga_app/ui/screens/medical.dart';
import 'package:toga_app/ui/screens/plants.dart';
import 'package:toga_app/ui/screens/profile.dart';

import '../constant.dart';

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int _bottomNavIndex = 0;

  //List of the pages
  List<Widget> pages = const [
    HomePage(),
    PlantsPage(),
    MedicalPage(),
    ProfilePage(),
  ];

  //List of the pages icons
  List<IconData> iconList = [
    Icons.home,
    Icons.compost_outlined,
    Icons.medication,
    Icons.person,
  ];

  //List of the pages titles
  List<String> titleList = [
    'Home',
    'Toga',
    'Obat',
    'Profil',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              titleList[_bottomNavIndex],
              style: TextStyle(
                color: Constants.blackColor,
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
            IconButton(
              icon: Icon(Icons.info_outline),
              iconSize: 30,
              color: Constants.blackColor,
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const InfoPage()));
              },
            ),
          ],
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0.0,
      ),
      body: IndexedStack(
        index: _bottomNavIndex,
        children: pages,
      ),
      bottomNavigationBar: SalomonBottomBar(
          currentIndex: _bottomNavIndex,
          selectedItemColor: Constants.primaryColor,
          onTap: (index) => setState(() => _bottomNavIndex = index),
          items: [
            SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text("Home"),
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.compost_outlined),
              title: Text("Toga"),
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.medication),
              title: Text("Obat"),
            ),
            SalomonBottomBarItem(
              icon: Icon(Icons.person),
              title: Text("Profil"),
            ),
          ]),
    );
  }
}
