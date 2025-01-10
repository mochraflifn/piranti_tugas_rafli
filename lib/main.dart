import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:piranti_tugas_rafli/controller/feed_controller.dart';
import 'package:piranti_tugas_rafli/controller/home_controller.dart';
import 'package:piranti_tugas_rafli/controller/photo_controller.dart';
import 'package:piranti_tugas_rafli/view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FeedController(),
        ),
        ChangeNotifierProvider(
          create: (context) => PhotoController(),
        ),
        ChangeNotifierProvider(
          create: (context) => HomeController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Instagram Look Alike',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
          useMaterial3: true,
        ),
        home: const HomePage(),
      ),
    );
  }
}
