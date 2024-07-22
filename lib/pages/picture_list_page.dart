// pages/picture_list_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/picture_cubit.dart';
import '../widgets/picture_list_item.dart';
import '../cubit/picture_state.dart';

class PictureListPage extends StatelessWidget {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Astronomy Picture of the Day'),
        backgroundColor: Colors.grey,
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          TextField(
            controller: _searchController,
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search_rounded),
              labelText: 'Pesquise por nome',
              labelStyle: TextStyle(color: Colors.white),
            ),
            style: const TextStyle(color: Colors.white),
            onChanged: (value) {
              context.read<PictureCubit>().filterPictures(value);
            },
          ),
          Expanded(
            child: BlocBuilder<PictureCubit, PictureState>(
              builder: (context, state) {
                if (state is LoadingPictureState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    ),
                  );
                } else if (state is LoadedPictureState) {
                  return ListView.builder(
                    itemCount: state.filteredPictures.length,
                    itemBuilder: (context, index) {
                      final picture = state.filteredPictures[index];
                      return PictureListItem(picture: picture);
                    },
                  );
                } else if (state is ErrorPictureState) {
                  return Center(
                    child: Text(
                      state.message,
                      style: const TextStyle(color: Colors.white),
                    ),
                  );
                } else {
                  return const Center(
                    child: Text(
                      'Erro desconhecido',
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
