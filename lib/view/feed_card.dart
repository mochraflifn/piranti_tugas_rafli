import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:piranti_tugas_rafli/controller/feed_controller.dart';
import 'package:piranti_tugas_rafli/model/feed.dart';

class FeedCard extends StatefulWidget {
  final Feed feed;

  const FeedCard({
    super.key,
    required this.feed,
  });

  @override
  State<FeedCard> createState() => _FeedCardState();
}

class _FeedCardState extends State<FeedCard> {
  @override
  Widget build(BuildContext context) {
    final user = widget.feed.user;
    final content = widget.feed.content;
    var controller = context.read<FeedController>();

    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user.avatar),
            ),
            title: Text(
              user.name,
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Text(user.place),
            trailing: const Icon(Icons.more_vert_outlined),
          ),
          Image.network(
            content.image,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width * 0.8,
            fit: BoxFit.cover,
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  controller.like(widget.feed);
                },
                icon: Icon(
                    content.isLike ? Icons.favorite : Icons.favorite_outline),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.maps_ugc_rounded),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.share_outlined),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  controller.bookmark(widget.feed);
                },
                icon: Icon(controller.isBookmark(widget.feed)
                    ? Icons.bookmark
                    : Icons.bookmark_outline_outlined),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  content.likes,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                Text(
                  content.description,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 12,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
