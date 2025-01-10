import 'package:flutter/material.dart';
import '../model/data/photo.dart';

class PhotoDetailPage extends StatelessWidget {
  final Photo photo;

  const PhotoDetailPage({super.key, required this.photo});

  @override
  Widget build(BuildContext context) {
    final user = photo.user;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Foto'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(photo.urls?.regular ?? ''),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    photo.description ?? '',
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text('Likes: ${photo.likes ?? 0}'),
                  const SizedBox(height: 8),
                  Text('Photographer: ${user?.name ?? 'Unknown'}'),
                  const SizedBox(height: 8),
                  Text('Username: ${user?.username ?? 'Unknown'}'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
