import 'package:flutter/material.dart';

class PictureWidiget extends StatelessWidget {
  const PictureWidiget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          print('contando 1');
          return const Column(
            children: [
              Text('nome'),
              Text('data'),
              Text('explicação'),
            ],
          );
        });
  }
}
