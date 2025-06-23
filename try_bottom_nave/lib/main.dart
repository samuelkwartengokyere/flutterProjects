import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: GNav(
              gap: 8,
              backgroundColor: Colors.black,
              color: Colors.white,
              activeColor: Colors.white,
              tabBackgroundColor: Colors.grey,
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
              onTabChange: (index){
                print('Flutter index is $index');
              },
              tabs: [
                GButton(
                  icon: Icons.home,
                  text:'Home',
                  textColor: Colors.white,
                ),
                GButton(
                    icon: Icons.favorite_border,
                    text: 'Likes',
                  textColor: Colors.white,
                ),
                GButton(
                    icon: Icons.search,
                    text: 'Search',
                  textColor: Colors.white,
                ),
                GButton(
                    icon: Icons.settings,
                    text: 'Settings',
                  textColor: Colors.white,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
