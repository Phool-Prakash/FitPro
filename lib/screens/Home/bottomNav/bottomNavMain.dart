import 'package:fit_pro/screens/Home/bottomNav/profile/profileScreen.dart';
import 'package:fit_pro/screens/Home/bottomNav/progress/progressScreen.dart';
import 'package:fit_pro/screens/Home/bottomNav/training/trainingScreen.dart';
import 'package:fit_pro/screens/Home/bottomNav/workout/workoutScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'homeScreen/homeScreen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const GetStartedScreen(),
    const ProfileScreen(),
    const ProgressScreen(),
    const TrainingScreen(),
    const WorkoutScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    bool isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    ///Scaling Factor
    double baseHeight = isPortrait ? 720.0 : 360.0;
    double baseWidth = isPortrait ? 360.0 : 720.0;
    double heightScale = screenHeight / baseHeight;
    double widthScale = screenWidth / baseWidth;

    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedIconTheme: IconThemeData(color: Color(0xFFA6FF00)),
          backgroundColor: const Color(0xFF1C222B),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              label: 'Home', icon: Image.asset('assets/icons/home.png')),
          BottomNavigationBarItem(
              label: 'Workout', icon: Image.asset('assets/icons/workout.png')),
          BottomNavigationBarItem(
              label: 'Training',
              icon: Image.asset('assets/icons/training.png')),
          BottomNavigationBarItem(
              label: 'Progress',
              icon: Image.asset('assets/icons/progress.png')),
          BottomNavigationBarItem(
              label: 'Profile', icon: Image.asset('assets/icons/profile.png'))
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: const Color(0xFF8B8E92),
        selectedItemColor: const Color(0xFFA6FF00),
        showUnselectedLabels: true,
        unselectedLabelStyle: GoogleFonts.roboto(
          textStyle:const TextStyle(
            color:Color(0xFF8B8E92),
            fontSize: 12,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w500,
          ),
        ),
        onTap: _onItemTapped,
      ),
    );
  }
}
