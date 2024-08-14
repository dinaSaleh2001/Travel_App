import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:travelapp/pages/home.dart';
import 'package:travelapp/pages/nav_pages/searchpage.dart';
import 'package:travelapp/pages/nav_pages/profilepage.dart';


class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List pages = [
    const HomePage(),
    
    SearchPage(),
    const ProfilePage(),
  ];
  int currentpage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
          iconSize: 23.sp,
          backgroundColor: Colors.white,
          onTap: (value) {
            currentpage = value;
            setState(() {});
          },
          currentIndex: currentpage,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.apps,
                  size: 30,
                ),
                label: "Home"),
           
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.search,
                  size: 30,
                ),
                label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                  size: 30,
                ),
                label: "My"),
          ]),
      body: pages[currentpage],
    );
  }
}
