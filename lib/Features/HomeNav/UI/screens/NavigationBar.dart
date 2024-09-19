import 'package:flutter/material.dart';
import 'package:task1/Features/FirstScreen/UI/screens/FirstScreen.dart';
import 'package:task1/Features/SecondScreen/UI/screens/SecondScreen.dart';
import 'package:task1/Features/ThirdScreen/UI/screens/ThirdScreen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Widget> screens = [
    const FirstScreen(),
    const SecondScreen(),
    const ThirdScreen()
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex,
            onTap: (value) {
              currentIndex = value;
              setState(() {});
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profile"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.calculate), label: "Calc"),
            ]));
  }
}
