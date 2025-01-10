import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:piranti_tugas_rafli/controller/feed_controller.dart';
import 'package:piranti_tugas_rafli/view/feed_card.dart';

class FeedBookmarkPage extends StatefulWidget {
  const FeedBookmarkPage({super.key});

  @override
  State<FeedBookmarkPage> createState() => _FeedBookmarkPageState();
}

class _FeedBookmarkPageState extends State<FeedBookmarkPage> {
  @override
  Widget build(BuildContext context) {
    final controller = context.watch<FeedController>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Bookmark List',
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: controller.bookmarkFeeds.length,
        itemBuilder: (context, index) => FeedCard(
          feed: controller.bookmarkFeeds[index],
        ),
      ),
    );
  }
}
