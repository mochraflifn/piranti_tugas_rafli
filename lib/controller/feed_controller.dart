import 'package:flutter/material.dart';
import 'package:piranti_tugas_rafli/model/feed.dart';
import 'package:piranti_tugas_rafli/model/feed_repository.dart';

class FeedController extends ChangeNotifier {
  List<Feed> feeds = FeedRepository().fetch();
  List<Feed> bookmarkFeeds = [];

  int get length => feeds.length;

  Feed feed(int index) {
    return feeds[index];
  }

  like(Feed feed) {
    feeds
        .firstWhere(
          (element) => element.id == feed.id,
        )
        .content
        .isLike = !feed.content.isLike;
    notifyListeners();
  }

  bookmark(Feed feed) {
    if (isBookmark(feed)) {
      bookmarkFeeds.remove(feed);
    } else {
      bookmarkFeeds.add(feed);
    }
    notifyListeners();
  }

  bool isBookmark(Feed feed) {
    return bookmarkFeeds.map((e) => e.id).contains(feed.id);
  }

  bool isBookmarkEmpty() {
    return bookmarkFeeds.isEmpty;
  }

  refresh() {
    feeds = FeedRepository().fetch();
    notifyListeners();
  }
}
