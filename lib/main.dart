import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picture_of_the_day/cubit/picture_cubit.dart';
import 'package:picture_of_the_day/pages/picture_list_page.dart';
import 'package:picture_of_the_day/repositories/picture_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => PictureCubit(PictureRepository()),
      child: MaterialApp(
        home: PictureListPage(),
      ),
    );
  }
}

