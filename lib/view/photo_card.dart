import 'package:flutter/material.dart';
import '../model/data/photo.dart';
import 'photo_detail_page.dart'; // Import halaman detail

class PhotoCard extends StatefulWidget {
  final Photo photo;

  const PhotoCard({
    super.key,
    required this.photo,
  });

  @override
  State<PhotoCard> createState() => _PhotoCardState();
}

class _PhotoCardState extends State<PhotoCard> {
  @override
  Widget build(BuildContext context) {
    final photo = widget.photo;
    final user = photo.user;

    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user?.profileImage?.small ?? ''),
            ),
            title: Text(
              user?.name ?? '',
              style: const TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: Text(user?.username ?? ''),
            trailing: const Icon(Icons.more_vert_outlined),
          ),
          Image.network(
            photo.urls?.regular ?? '',
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width * 0.8,
            fit: BoxFit.cover,
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  // controller.like(photo);
                },
                icon: Icon((photo.likedByUser ?? false)
                    ? Icons.favorite
                    : Icons.favorite_outline),
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
                  // controller.bookmark(photo);
                },
                icon: const Icon(Icons.bookmark_outline_outlined),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  (photo.likes ?? 0).toString(),
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
                Text(
                  photo.description ?? '',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 14,
                ),
                ElevatedButton(
                  onPressed: () {
                    // Navigasi ke halaman detail
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PhotoDetailPage(photo: photo),
                      ),
                    );
                  },
                  child: const Text('Lihat Detail'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
