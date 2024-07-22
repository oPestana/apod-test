// cubit/picture_cubit.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/picture_model.dart';
import '../repositories/picture_repository.dart';
import 'picture_state.dart';

class PictureCubit extends Cubit<PictureState> {
  final PictureRepository _pictureRepository;
  List<PictureModel> _pictures = [];

  PictureCubit(this._pictureRepository) : super(InitialPictureState()) {
    fetchPictures();
  }

  Future<void> fetchPictures() async {
    emit(LoadingPictureState());
    try {
      _pictures = await _pictureRepository.fetchPictures();
      emit(LoadedPictureState(_pictures, _pictures));
    } catch (e) {
      emit(ErrorPictureState(e.toString()));
    }
  }

  void filterPictures(String query) {
    final filtered = _pictures
        .where((picture) =>
        picture.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    emit(LoadedPictureState(_pictures, filtered));
  }
}
