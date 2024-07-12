import 'package:catflix/views/account_view.dart';
import 'package:catflix/views/home_view.dart';
import 'package:catflix/views/shorts_view.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  List<Widget> views = [
    const HomeView(),
    const ShortsView(),
    const AccountView(),
  ];
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {},
      child: Scaffold(
        // backgroundColor: Colors.grey.shade700,
        appBar: AppBar(
          leading: Image.asset(
            'assets/catflix.jpeg',
          ),
          // backgroundColor: Colors.black,
          title: const Text(
            "Catflix",
            style: TextStyle(fontSize: 22, fontFamily: "TitanOne"),
          ),
        ),
        body: _currentIndex == 1
            ? views[_currentIndex]
            : SingleChildScrollView(child: views[_currentIndex]),
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          currentIndex: _currentIndex,
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.video_collection),
              label: "Shorts",
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.white,
              icon: Icon(Icons.verified_user),
              label: "Account",
            ),
          ],
          onTap: (int newIndex) {
            setState(() {
              _currentIndex = newIndex;
            });
          },
        ),
      ),
    );
  }
}
