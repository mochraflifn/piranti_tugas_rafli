import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:piranti_tugas_rafli/controller/feed_controller.dart';
import 'package:piranti_tugas_rafli/view/feed_card.dart';

class FeedBookmarkListWidget extends StatelessWidget {
  const FeedBookmarkListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<FeedController>();

    return RefreshIndicator(
      onRefresh: () async {
        await Future.delayed(const Duration(seconds: 1));
        controller.refresh();
      },
      child: controller.isBookmarkEmpty()
          ? const Center(
              child: Text('Tidak ada Gan'),
            )
          : ListView.builder(
              itemCount: controller.bookmarkFeeds.length,
              itemBuilder: (context, index) => FeedCard(
                feed: controller.bookmarkFeeds[index],
              ),
            ),
    );
  }
}
