import 'package:flutter/material.dart';

class DetailsPicture extends StatelessWidget {
  const DetailsPicture({super.key, required this.picture});

  final Map picture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(picture['title']),
        backgroundColor: Colors.grey,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(picture['url']),
            Text(
              picture['title'],
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Text(
              picture['date'],
              style: const TextStyle(color: Colors.white),
            ),
            Text(
              picture['explanation'],
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
