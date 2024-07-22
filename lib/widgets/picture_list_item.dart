import 'package:flutter/material.dart';
import '../models/picture_model.dart';
import '../pages/details_picture_page.dart';

class PictureListItem extends StatelessWidget {
  final PictureModel picture;

  const PictureListItem({Key? key, required this.picture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsPicture(picture: picture),
          ),
        );
      },
      child: Card(
        color: Colors.grey,
        child: Column(
          children: [
            Image.network(
              picture.url,
              fit: BoxFit.cover,
              errorBuilder: (context, error, trace) {
                return Container(
                  color: Colors.grey,
                  child: const Icon(Icons.broken_image),
                );
              },
            ),
            Text(
              picture.title,
              style: const TextStyle(color: Colors.white),
            ),
            Text(
              picture.date,
              style: const TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
