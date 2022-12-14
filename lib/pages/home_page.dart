// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:alma_mater/pages/calendar_page.dart';
import 'package:alma_mater/pages/hero_page.dart';
import 'package:alma_mater/pages/market/market_page.dart';
import 'package:alma_mater/pages/profile_page.dart';
import 'package:alma_mater/style/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  final List<Widget> _pages = [HeroPage(), MarketPage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      backgroundColor: const Color.fromRGBO(252, 251, 254, 1),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        child: GNav(
          backgroundColor: Colors.white,
          gap: 8,
          activeColor: SECONDARY_COLOR,
          color: Colors.grey,
          padding: EdgeInsets.all(16),
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          tabs: [
            GButton(
              icon: Icons.home_rounded,
            ),
            GButton(
              icon: Icons.favorite_border,
            ),
            GButton(
              icon: Icons.person,
            ),
          ],
        ),
      ),
    );
  }
}

/* 

 */
