import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:piranti_tugas_rafli/controller/feed_controller.dart';
import 'package:piranti_tugas_rafli/controller/home_controller.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<FeedController>();
    final homeController = context.watch<HomeController>();

    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Stack(children: [
                SizedBox(
                    width: 120,
                    height: 120,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                          backgroundColor: Colors.grey.shade200,
                          backgroundImage: const NetworkImage(
                              'https://images.pexels.com/photos/2567011/pexels-photo-2567011.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')),
                    )),
                Positioned(
                    bottom: 0,
                    right: 0,
                    child: FloatingActionButton.small(
                        backgroundColor: Colors.teal,
                        heroTag: const Key('Home'),
                        onPressed: () {},
                        child: const Icon(Icons.edit, color: Colors.white)))
              ]),
              const Padding(
                  padding: EdgeInsets.only(top: 12.0),
                  child: Text(
                    'Rafli',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  )),
              Text(
                'Orang Ganteng',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Colors.grey.shade500),
              ),
              const SizedBox(
                height: 30,
              ),
              listTile('My Membership', Icons.star_border_outlined),
              listTile('My Collection', Icons.bookmark_outline,
                  trailing: Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.black,
                    ),
                    child: Center(
                      child: Text(
                        controller.bookmarkFeeds.length.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ), onTap: () {
                homeController.changeIndex(1);
              }),
              listTile(
                'Logout',
                Icons.logout,
                color: Colors.red,
                onTap: () {},
              ),
            ],
          ),
        ));
  }

  ListTile listTile(
    String title,
    IconData icon, {
    Color color = Colors.black,
    void Function()? onTap,
    Widget? trailing,
  }) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 14,
      ),
      leading: Icon(
        icon,
        color: color,
      ),
      title: Text(
        title,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: trailing,
    );
  }
}
