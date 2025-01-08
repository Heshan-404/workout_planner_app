import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:workout_planner/pages/add_page.dart';
import 'package:workout_planner/pages/favorites_page.dart';
import 'package:workout_planner/pages/home_page.dart';
import 'package:workout_planner/pages/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int currentIndexCus = 0;
  @override
  Widget build(BuildContext context) {
    final List<Widget> pageList = [
      const HomePage(),
      AddPage(),
      const FavoritePage(),
      const ProfilePage()
    ];
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.amber,
        textTheme: GoogleFonts.interTextTheme(Theme.of(context).textTheme),
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: ClipRRect(
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: false,
            backgroundColor: Colors.black,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add_circle_outlined), label: "Add"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: "Favorites"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_3_rounded), label: "Profile")
            ],
            currentIndex: currentIndexCus,
            unselectedItemColor: Colors.white30,
            selectedItemColor: Colors.white,
            onTap: (index) {
              setState(() {
                currentIndexCus = index;
              });
            },
          ),
        ),
        body: pageList[currentIndexCus],
      ),
    );
  }
}
