import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:piranti_tugas_rafli/controller/home_controller.dart';
import 'package:piranti_tugas_rafli/view/feed_bookmark_list_widget.dart';
import 'package:piranti_tugas_rafli/view/feed_bookmark_page.dart';
import 'package:piranti_tugas_rafli/view/profile_page.dart';

import 'feed_list_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bodies = const [
    FeedListWidget(),
    FeedBookmarkListWidget(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final homeController = context.watch<HomeController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GatoGram',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        leading: const Icon(Icons.menu_rounded),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const FeedBookmarkPage(),
              ));
            },
            icon: const Icon(Icons.notifications_outlined),
          ),
        ],
      ),
      body: bodies[homeController.selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.home),
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(Icons.bookmark),
            icon: Icon(Icons.bookmark_outline),
            label: 'Bookmark',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: homeController.selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.black,
        onTap: (index) {
          homeController.changeIndex(index);
        },
      ),
    );
  }
}
