import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'create_screen.dart';
import 'profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const Center(child: Text("Discover (Coming Soon)")), // Placeholder
    const CreateScreen(),
    const Center(child: Text("Inbox (Coming Soon)")), // Placeholder
    const ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.grey.shade900],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          border: Border(
            top: BorderSide(color: Colors.grey.shade800, width: 0.5),
          ),
        ),
        child: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.transparent,
          selectedItemColor: const Color(0xFF00F7FF),
          unselectedItemColor: Colors.grey.shade500,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                size: 28,
              ),
              label: 'Home',
              activeIcon: Icon(
                Icons.home_filled,
                size: 32,
                color: const Color(0xFF00F7FF),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 28,
              ),
              label: 'Discover',
              activeIcon: Icon(
                Icons.search,
                size: 32,
                color: const Color(0xFF00F7FF),
              ),
            ),
            BottomNavigationBarItem(
              icon: Container(
                width: 55,
                height: 35,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFF00F7FF), Color(0xFFFF0055)],
                  ),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.cyan.withOpacity(0.3),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: const Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 24,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.message_outlined,
                size: 28,
              ),
              label: 'Inbox',
              activeIcon: Icon(
                Icons.message,
                size: 32,
                color: const Color(0xFF00F7FF),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
                size: 28,
              ),
              label: 'Profile',
              activeIcon: Icon(
                Icons.person,
                size: 32,
                color: const Color(0xFF00F7FF),
              ),
            ),
          ],
        ),
      ),
    );
  }
}