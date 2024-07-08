import 'package:flutter/material.dart';
import 'package:picture_of_the_day/pages/picture_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: PictureListPage(),
    );
  }
}

